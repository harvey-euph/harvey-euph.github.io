---
title: "讀書筆記: Learning eBPF"
date: 2025-07-25 12:00:00 +0800
categories: [Note]
tags: [eBPF, Tech, Python]
---

練習用的程式碼：[Github](https://github.com/lizrice/learning-ebpf/tree/main)

## Chapter 1: What Is eBPF, and Why Is It Important?

- eBPF 是一個工具，可以讓開發者在不用重新編譯 kernel 的情況下客製化且動態地修改 kernel 的行為。
- eBPF 可以對系統的任何方面進行效能監控、可以實作高效率的網路、也可以偵測和預防對系統潛在的危害

一段 eBPF 的歷史，先跳過，之後回來補

## Chapter 2: eBPF’s “Hello World”

這一章使用一些基礎例子讓讀者感受 eBPF 的威力

最簡單好入手的工具是 [the BCC Python framework](https://github.com/iovisor/bcc)

先從印 "Hello World!" 開始

```py
#!/usr/bin/python  
from bcc import BPF

# 這一段是要交給 kernel 執行的 bpf function (c code compiled by llvm)
bpf = r"""
int hello(void *ctx) {
    bpf_trace_printk("Hello World!");
    return 0;
}
"""

# User space 程式，將 bpf 進行編譯和處理，並設定要監測什麼事件，再從外部觀察 bpf 的執行結果
b = BPF(text=bpf)
syscall = b.get_syscall_fnname("execve")
b.attach_kprobe(event=syscall, fn_name="hello")
b.trace_print()

```

這段 code 分成兩部分，bpf 內的程式碼是 c code，BCC 會幫你編譯好，並且在 kernel 執行
而其他部分則是 user space 程式，可以用來看 bpf 執行的結果

- 有一系列的 helper functions 可以在 bpf function 裡面使用，例如 `bpf_trace_printk` 可以用來印東西，後面章節會講更多
- `execve` 是通用介面，但實際的 syscall 取決於硬體架構，BCC 提供方便的函數 `get_syscall_fnname` 來找真正的 syscall 名字

### BPF map

BPF map 是一些 data structure，讓人可以從 user space 對應到 bpf 程式的資訊，藉以獲取系統的運行數據，使用 BCC macro 來定義

`BPF_HASH(table)` 這樣定義之後就可以在 eBPF function 裡面使用 `table` 這個結構，以下整理常用 BPF map 以及支援的操作

- `BPF_HASH(hash_map)`:
    - `hash_map.lookup`
    - `hash_map.update`

- `BPF_PERF_OUTPUT(output)`
    - `output.perf_submit`

### Helper Functions

- `bpf_get_current_uid_gid()`

### Tail Call

在早期的 eBPF 程式中只允許呼叫內建的 helper functions，不允許開發者自己寫 function call，所以要呼叫其他函數必須使用 `__always_inline`，儘管後來開放了，但 BCC 工具暫時還沒辦法，所以要用 eBPF 專用的設計來 function call 的工具: Tail Call，要注意的是 Tail Call 比較像是 `execve`，一旦呼叫成功就不會再返回了

以 ` BPF_PROG_ARRAY(funcs, 10); ` 宣告 function array，在 bpf 的程式實作出函數，最後在 user space program 將函數 assign 給 funcs，就可以呼叫了


