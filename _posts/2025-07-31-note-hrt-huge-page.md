---
title: "讀書筆記: Huge Page"
date: 2025-07-31 00:00:00 +0800
categories: [Careers, Notes]
tags: [Tech]
---

此筆記為 Hudson River Trading 的 Tech Blog 的讀書筆記，原文：
[Part 1](https://www.hudsonrivertrading.com/hrtbeat/low-latency-optimization-part-1/), 
[Part 2](https://www.hudsonrivertrading.com/hrtbeat/low-latency-optimization-part-2/)

不確定它們的文章是不是會定期清除的，也許網頁會消失

作業系統通常是以區塊對記憶體進行管理的，每個區塊稱為 Page，載入和移除等各種操作都是以 Page 為單位進行。

在一個 64-bit x86 的架構下的 Page Size：
- Default Pages / Regular Pages: 4KiB
- Huge Pages: 2MiB  
- Gigantic Pages: 1GiB

一般程式在運行時使用虛擬地址，作業系統會負責將虛擬地址對應到物理 RAM 上的地址，轉換的關係表使用一個叫做 Page Table 的資料結構，每個進程都會有一個自己的 Page Table

查詢的過程事非常耗時的（以 CPU 的視角來看），因為 Page Table 的查詢是多層級的，如果有 4-level Page Table 就需要 3 次獨立的 memory access，就像一本條目太多的字典，你要從字典堆中找到特定的頁數，你必須從一個起始字典找到你要去哪一本字典才能找到，以此往復三次，在最終的字典上才有你要的那一頁的位置

每次 Memory Access 的成本大概是 70ns，在我們拿到想要的資料前，就要花費三次查詢：210ns 的時間

為了解決這個問題，translation lookaside buffer (TLB) 就被發明出來了

TLB 在 CPU cache 裡面，他存著一些最近查過的 Page Table 內容，每個 CPU core 大概能存 1500-2000 entries

以 Default Pages 計算，4KiB * 2000 大約 8MiB，遠小於實際記憶體的需求，而如果我們全都用 Huge Pages 來計算，TLB 瞬間就能涵蓋到 4GiB 的範圍

並且 Huge Pages 的 Page Table 結構也比 regular pages 的更簡單，能夠用較少的 memory access 次數來查到

一個簡單的 [benchmark test](https://github.com/hudson-trading/hrtbeat/blob/master/huge_memory_bench.cpp)

分配一個 Huge Page 需要 512 個連續的空閒 Regular Pages

> 未完待續
{: .prompt-tip }

