---
title: "Memory Order 及相關主題小記"
date: 2026-02-15 00:00:00 +0800
categories: [Careers, Tech]
tags: [Tech]
---

## Memory Order

`std::atomic<T>` 的 `memory_order` 讓我困惑了非常久，終於在最近有搞懂了的感覺，必須記錄下來

用人話說就是能在 multi-threads 的情形下控制不同 threads 的事件發生的先後關係 (關鍵字 happens-before)，但要知道的細節遠遠不只這樣

仙貝知識: 

- 資料存儲的等級依序為 `store buffer` -> `cache (L1->L2->L3)` -> `memory` -> `disk` -> ...
- 其中 `cache` 受到 `MESI Protocol` 規範，其中的修改不用擔心跨 CPU 會看不到，但是 `store buffer` 就會出問題了
- `memory_order` 就是為了解決這個問題而存在的

一句話簡單說，`memory_order` 就是透過控制 `store buffer` flush 的時機來確保跨 core 的 visibility ordering

不要只想著指令順序，而是要關注 `store buffer` 何時 flush，連帶讓其他 core 的 cache line invalidate

以下進一步解釋和舉例

C++ 提供了 6 個 `memory_order` 

```cpp
enum memory_order
{
    relaxed, // 保證該操作是不可分割，不保證任何 happens-before ordering，不提供任何 synchronization
    consume, 
    acquire, // 保證該操作之後的 reads 不會提前，讀到的東西都是 release 指令之前完成的
    release, // 保證該操作之前的 writes 會先被 flush 進 cache
    acq_rel, // acquire + release 我還不太確定會被用在哪，還要再研究一下 (TODO)
    seq_cst
};
```

我們可以來看這個例子

```cpp
// Thread 1
A;
B;
flag.store(true, release)  

// Thread 2
while (!flag.load(acquire));
C;
```

以上程式碼確保了 `A, B happens-before C` 但不保證 `A, B` 的順序和原子性，如果有個其他 thread 來觀察 A, B 的結果有可能只觀察到 B 但沒有 A

## MESI Protocol：Cache Coherence 的核心機制

MESI 是每個 cache line 的狀態機，確保多核心 cache 與 memory 一致。

| 狀態 | 名稱        | 意義                               |
| -- | --------- | ------------------------------------- |
| M  | Modified  | 只有此 core 有，且已修改，memory 是舊的 |
| E  | Exclusive | 只有此 core 有，與 memory 一致         |
| S  | Shared    | 多個 core 有，與 memory 一致           |
| I  | Invalid   | 無效                                  |

- coherence 是以 cache line（通常 64 bytes）為單位
- False Sharing 就是 MESI 的副作用