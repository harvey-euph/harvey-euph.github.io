---
title: "讀書筆記: Make your programs run faster by better using the data cache"
date: 2025-07-27 00:00:00 +0800
categories: [Careers, Notes]
tags: [Tech, Computer Architecture]
---

此筆記為 Johnny's Software Lab 的網路文章筆記，[原文在此](https://johnnysswlab.com/make-your-programs-run-faster-by-better-using-the-data-cache/)

## 前言

為了讓程式執行的更快，我們常想到的做法之一是改善演算法，如果能把一個 O(n^2) 的演算法變成 O(n*log(n)) 的話，就能有效增加執行速度。另一個可行的路則是對底層進行優化，來獲取更高的執行效率。

## Data Cache

電腦系統包含兩個部件: Processor 和 Memory，但是現代的 Memory 讀取速度比 Processor 執行指令的速度慢上百倍