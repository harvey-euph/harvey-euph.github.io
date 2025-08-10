---
title: "讀書筆記: Dynamic Hedging"
date: 2025-07-25 12:00:00 +0800
categories: [Careers, Notes]
tags: [Notes, Finance, Options, Financial Derivatives]
math: true
---

## 第一部分 Markets, Instruments, People

讀了一些開頭，看起來有點多廢話，先跳

## 第二部分 Measuring Option Risks

### Risk Management Rules

1. 改進和調整一個簡單但成熟的模型比創造一個新的複雜模型更好
    
    ⇒ 以 Black-Scholes-Merton 為基礎來 Hedging
    
2. 模型使用參數越少的模型越好
3. 連續時間模型應該被用來定價而非對沖
4. 在 barrier option 的邊界情況可能會讓 Delta 爆炸，不能用此時的 Delta 下去 hedge

### Black-Scholes-Merton Model

奠基於兩大主要假設，以及三個可調整的參數假設

1. 股價是一個 `Ito Process` i.e. 任意等長時間區段的分布是 `i.i.d.`，無記憶
2. 市場沒有摩擦力（無交易成本及來自管理單位的限制，如放空限制）
3. `const volatility`進一步導致多個資產的相關性也是`const correlation`
4. 第一點提及的分布為 `Geometric Brownian Motion`
5. `const drifts (known parameter)` : flat term structure

現實情況會需要採取一些修正來應對模型的假設

1. 在路徑相依嚴重的情況要去掉假設 1，例如遇到流動性黑洞（Need further explanation）
2. 假設 2 實際上會有交易成本，每次調整部位都會降低 `PV`，因此 rebalance 不能太頻繁
3. 實際上 `vol` 會變動，甚至期權交易員的觀點更是要能 buy-sell `vol` 下去思考
4. 有時`Brownian Motion`更合理，例如利率商品通常都以`Brownian Motion` 為基礎下去衍生模型
5. 利率有時會和資產價格有相關性

### Chapter 7：Adapting Black-Scholes-Merton: The Delta

$$
\text{Delta}=\frac{\partial F}{\partial U}
$$

我們應該對 `Delta` 進行多種修正的實務考量以及手段

- 離散化（考慮 min price step）
- 以 `Expiry`分段（bucket），將長天期和短天期的`Delta`分開考慮，長天期的`Delta`比較容易受到`vol`和`drift term`的`vol`影響
- 跨越各種衍生品類別的 `Delta`
- `Future Delta` 或 `Spot Delta` 的轉換
- 不能單純用 `Delta` 來考慮風險，這是非常粗糙的風險評估方式，考慮二階：

`Equivalent position = face_value * ( Delta * expected_move + 1/2 * Gamma * expected_move^2)`

（仍然很粗糙，下一章會討論 `Gamma`）

`vol` 升高時，`ITM Call` `Delta` 上升，`OTM Call` `Delta` 下降 → 所有 `Call` `Delta` 都更接近 0.5

### Chapter 8：Gamma and shadow-Gamma

`Gamma` 是衍生品價格對 `underlying asset price` 的二階導數

$$
\text{Gamma}=\frac{\partial^2 F}{\partial U^2}
$$

- `At-the-money Option` 越接近 `expiry` `Gamma` 越大
- `In-the-money Option` 越接近 `expiry` `Gamma` 越小

沒有適當的調整，不能比較不同到期日的 `Gamma` (`Vega`也是): 12章會再討論

市場的大幅跳動必定造成波動率的大幅跳動，計算 `Gamma` 時須將其考慮進去 `->` `Shadow Gamma`

無論什麼風險，只要能夠被準確預測，都需要納入分析。否則 `Greeks` 就會變成純理論的計算

跳過了一些東西，再回來看，有點像很多東西都做簡單介紹： `GARCH Gamma` `Advanced shadow Gamma` 

### Chapter 9：Vega and the Volatility Surface

$$
\text{Vega}=\frac{\partial F}{\partial\sigma}
$$

跳

### Chapter 16：Option Trading Concepts

基本上就是名詞講解

- `Option Replication` : A `Self-financing` method to replicate the payoffs of the option instrument with other instruments.
- `Static Replication` :

## 第三部分 Measuring Option Risks

第三部分，奇異期權 `Exotic Option` 的交易與對沖

討論動態對沖者視角的奇異期權風險，方法為構建風險分解的對沖技巧

看起來有些名詞解釋需要往前翻，再寫筆記在這

### 17章 `Binary Option: European Style`

`Digital Derivatives` 

一個 `Binary Option` 的不連續報酬，讓他很難以連續報酬的常規結構來對沖

 

`American Binary Option`