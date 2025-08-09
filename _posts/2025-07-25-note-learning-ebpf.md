---
title: "讀書筆記: Learning eBPF"
date: 2025-07-27 00:00:00 +0800
categories: [Careers, Notes]
tags: [eBPF, Tech, Python]
---

原作提供的範例程式碼：[Github](https://github.com/lizrice/learning-ebpf/tree/main)

## Chapter 1: What Is eBPF, and Why Is It Important?

- eBPF 是一個工具，可以讓開發者在不用重新編譯 kernel 的情況下客製化且動態地修改 kernel 的行為。
- eBPF 可以對系統的任何方面進行效能監控、可以實作高效率的網路、也可以偵測和預防對系統潛在的危害

一段 eBPF 的歷史，跳過，也許之後回來補，也許懶得補

## Chapter 2: eBPF’s “Hello World”

eBPF 最容易入手的工具是 [the BCC Python framework](https://github.com/iovisor/bcc)

先從印 `"Hello World!"` 開始

```py
#!/usr/bin/python  
from bcc import BPF

# BPF function (c lang)
# 會交給 kernel 進行編譯和認可是合法的 BPF 程式，有專用的 LLVM 編譯器
# 專案如果較複雜，也可能會另開一個檔案並且引入的方式
bpf = r"""
int hello(void *ctx) {
    bpf_trace_printk("Hello World!");
    return 0;
}
"""

# User space 程式，將 bpf 進行編譯和處理
b = BPF(text=bpf)

# 設定要監測的事件
syscall = b.get_syscall_fnname("execve")
b.attach_kprobe(event=syscall, fn_name="hello")

# 從 user space 觀察/操作 bpf 的執行結果
b.trace_print()

```

- 有一系列的 helper functions 可以在 bpf function 裡面使用，例如 `bpf_trace_printk` 可以用來印東西，後面章節會講更多
- `execve` 是通用介面，但實際的 syscall name 取決於硬體架構，BCC 提供方便的函數 `get_syscall_fnname` 來找真正的 name

### BPF map

BPF map 是一些 data structure，讓人可以從 user space 對應到 bpf 程式的資訊，藉以獲取系統的運行數據，使用 BCC macro 來定義。

`BPF_HASH(table)` 這樣定義之後就可以在 eBPF function 裡面使用 `table` 這個結構，以下整理常用 BPF map 以及支援的操作

- `BPF_HASH(hash_map)`:
    - `hash_map.lookup`
    - `hash_map.update`

- `BPF_PERF_OUTPUT(output)`
    - `output.perf_submit`

### Helper Functions

- `bpf_get_current_uid_gid()`

### Tail Call

在早期的 eBPF 程式中只允許呼叫內建的 helper functions，不允許開發者自己寫 function call，所以要呼叫其他函數必須使用 `__always_inline`來宣告，儘管後來開放了，但 BCC 工具暫時還沒辦法，所以要用 eBPF 專用的設計來 function call 的工具: Tail Call，要注意的是 Tail Call 比較像是 `execve`，一旦呼叫成功就不會再返回了

以 `BPF_PROG_ARRAY(funcs, 10);` 宣告 function array，在 bpf 的程式實作出函數，最後在 user space program 將函數 assign 給 funcs，就可以呼叫了


## CHAPTER 3 Anatomy of an eBPF Program

這一章要脫離 Python BCC，實作一個完全用 c 寫成的 BPF Hello World，我們就可以看到 BCC 在背後幫我們完成了什麼工作

fun fact: 其實可以直接寫 eBPF bytecode instructions 或 Assembly，但主要還是寫 c / Rust 再編譯成 bytecode 比較好


eBPF bytecode 其實是在 kernel 裡面 eBPF 專用的 VM 執行，我們要來了解一下這個 VM

首先 bytecode 載入會先經過 verifier 檢查是否可以安全執行，verifier 的細節會在 Chapter 6 討論
eBPF VM 接受 eBPF bytecode，轉成實際的 machine code 之後執行



```sh
# 需要的套件
sudo apt update
sudo apt install clang llvm
sudo apt install libbpf-dev
```

載入 bytecode 並且可以看到 `/sys/fs/bpf` 有對應的名字
```sh
sudo bpftool prog load hello.bpf.o /sys/fs/bpf/hello
sudo ls /sys/fs/bpf
sudo bpftool prog list # 從這裡可以看到載入的 hello 的編號 <num>
sudo bpftool prog show id <num> --pretty
sudo bpftool net attach xdp id <num> dev enp2s0

# 可以看到網路介面各自被哪些 eBPF 程式 attach
sudo bpftool net list

# 觀看輸出的兩種方法
sudo cat /sys/kernel/debug/tracing/trace_pipe # 要注意這裡不能用 tail -f 
sudo bpftool prog tracelog

# 觀看相關變數或資料
sudo bpftool map dump name hello.bss
sudo bpftool map dump name hello.rodata

# 移除 eBPF
sudo bpftool net detach xdp dev eth0
sudo rm /sys/fs/bpf/hello
```

因為全程使用 c code 進行，不涉及 BCC tool，因此可以進行一般的 bpf function call (這裡暫時沒搞懂，不知道 hello-func.bpf.c 怎麼載入)


## CHAPTER 4 The bpf() System Call

Linux kernel 提供一個 syscall: 
```c
int bpf(int cmd, union bpf_attr *attr, unsigned int size);
```
專門用來處理各種 bpf 相關操作，例如載入 bpf 程式﹑attach﹑BPF map 的創建和各種操作，由 cmd 分辨是哪一種

attr 是一個指向該操作的參數的指標，其意義依照 cmd 而有所不同，size 為該參數的長度，具體內容可以 man bpf 來看

一個 bpf 程式 (and bpf map?) 載入 kernel 之後會有 ref count，如果 ref count 降到 0 就會被移除，所以要把他 pinned to the filesystem



> 未完待續
{: .prompt-tip }
## CHAPTER 7 eBPF Program and Attachment Types

這章要告訴我們有哪些不同的事件可以讓 eBPF 程式附著上去
不同類型的事件觸發的 eBPF 程式的參數不同，回傳值也有不同意義
可以使用的 helper function 也有些差異，都會經過 Verifer 檢查是否合法

例如在 XDP 類型的程式中使用 `bpf_get_current_pid_tgid()` 就是不被允許的，因為當 XDP 被觸發時還沒進到任何 user space process 裡面

可以參考 [helper functions man page](https://man7.org/linux/man-pages/man7/bpf-helpers.7.html)

- Tracing
    - kprobes
    - tracepoints
    - raw tracepoints
    - fentry/fexit probes
    - perf events

除了一些函數因為安全需求不能被監測之外，你可以把 kprobes 和 kretprobes 安插在任何 kernel function 上，但有可能你的 kernel 版本在編譯的時候某些函數被 inline 而無法


## CHAPTER 8 eBPF for Networking

## CHAPTER 10 eBPF Programming


eBPF programming consists of two parts:
- Writing eBPF programs that run in the kernel
- Writing the user space code that manages and interacts with eBPF programs