---
title: "Interview Question 準備"
date: 2026-03-05 00:00:00 +0800
categories: [Careers, Interview]
tags: [Careers, Interview]
---

#### Tell me about yourself. (Self-introduction)

我是吳冠宏，畢業於台大數學系。

過去兩年我在 Aargo Trade 擔任 C++ developer，主要負責交易系統與市場資料系統的開發與維護。工作內容涵蓋底層的連線與交易協議實作，到整個系統的運作與穩定性維護。在這段經驗中，我累積了不少處理複雜系統問題與除錯的經驗，也逐漸培養出系統化分析問題的能力。

我是一個具有獨立推進專案和解決問題的能力的人，也能在團隊中發揮自己的長處，在獨立作業和團隊合作都有實際解決問題或提高效率的案例。

接下來我希望能在高效能系統或交易相關領域持續深入發展，進一步提升在系統設計與系統穩定性方面的能力。

#### What’s your greatest strength?

我覺得自己最大的優勢是系統化的 problem solving 能力。

數學背景很訓練把複雜問題拆解的能力，所以在工程上遇到問題時，我通常會先釐清問題的限制條件與目標，一步一步縮小問題範圍，再嘗試各種可能的解法。

另外一個優勢是自學新技術的能力。過去無論是程式語言、軟體相關技能、交易協議、或市場資料處理相關的技術，其實很多都是透過自學再搭配實際專案慢慢累積起來的，所以我對於接觸新的系統或技術通常適應得蠻快。

#### What’s your greatest weakness?

如果說一個我過去比較需要調整的地方，是我以前在團隊合作時，如果專案某個部分進度落後，我會傾向把事情自己扛下來做。

例如在大學做團體專案時就有過這樣的情況，最後其實讓自己負擔太重，所以我後來也意識到這不是一個長期好的合作方式。

後來慢慢發現很多時候進度落後的原因其實不是能力問題，而是對專案背景或設計理解不夠完整。所以現在我會比較花時間分享專案的 context 和設計想法，讓大家在同一個理解下工作，通常合作效率會更好。

#### Describe your most challenging project.

在 Aargo Trade 工作早期我就遇到一個相當困難的情況，當時主管讓我用一個已經成形的專案去改寫來滿足另一個 Broker 的需求，大致的組件都已經成形，需要我動的部分理論上就只有應用層的微調，對新手來說應該是很適合的練習，但實際情形卻沒這麼順利，當時遇到了前所未有的困難，觀察到的現象是連線後極度不穩，大概經過一兩分鐘就會被對方斷線。
也不全然是連不上線，因為連線測試和登入訊息都可以成功，主管說也沒遇過這種情形，不確定怎麼處理，讓我自己再研究研究。
我從研究協議內容得知這種現象是因為對方沒有收到我方的 heartbeat，沒辦法確定我方還活著所以斷線，可是我確定我有正常送，經過測試發現 logon 訊息以外傳什麼對方都收不到，去檢查 TCP package 發現對方明明就有收到，還有回 ACK，表示傳輸層沒問題，但是應用層可能行為不對，懷疑是對方有問題，但對方表示沒辦法在他們的機器跑抓包軟體，需要額外申請權限而且大概也不是符合規定的理由。

用 python 的第三方協議庫來測試，結果連線行為正常，表示確定我方還有行為可以修改，做了諸多測試，包含送訊息用同步非同步啦，多送幾次啦，或是調換順序，不要先送 logon ，此時得知不是 logon 以外都收不到，而是第一封訊息之後都收不到，懷疑是所有訊息都有的共同點讓對方的應用層處理壞掉

發現 buffer 沒有截斷，把更大塊的空白 buffer 一起送，懷疑問題在這裡，改掉之後就成功了。
相同的行為其他 broker 可以正常處理，但是這家剛好會被空白 buffer 破壞正常行為。

(去除技術細節的版本)

在 Aargo Trade 工作早期我就遇到一個相當困難的情況，當時我負責的專案遇到了主管也沒遇過的奇怪問題，所以也找不到人問，但幸運的是主管能理解這不是常規的問題，能給我時間專心解決

解決問題的中途老實說真的有點灰心，因為我已經拿出各種看家本領了，該拆解的問題，縮小可能的範圍，能做的都做了，甚至一度懷疑是對方的程式有缺陷。為了釐清是我們自己的程式有問題還是連線對方的問題，我去找了 python 的現成套件來測試，發現可以正常運作，於是就確認自己的程式還有地方可以修改來解決問題，也因為這個測試，獲得一些可以比對的樣本，用來找問題出在哪

後來終於解決，是個相當精細，預期中我還碰不到的底層問題，但我也在尋找問題關鍵的過程中用了一些沒用過的工具，學到新東西的同時也解決掉這個問題。開會的時候主管也說我真的是 good job

#### Why do you (want to) leave your last job.

我離開上一家公司主要是因為公司策略的改變。

我的主管離開之後，公司在 algo trading 這個方向的投入逐漸減少，相關的工程和研究人員也陸續離開。後來公司基本上只剩下 manual trading，因此原本維護的交易平台其實已經不太需要持續投入工程資源。

我當時主要負責的平台維護工作也逐漸減少，最後整個工程團隊幾乎都離開了。我算是待到比較後面的人，等到我離開的時候公司只剩下一位工程師。

所以對我來說，也是一個自然的時間點去尋找新的機會，繼續往交易系統或高效能系統相關的方向發展。

<!-- - Tell me about a time you showed leadership. -->

<!-- - Tell me about yourself. (Self-introduction)
: I am Harvey. Worked as a quant developer in Aargo Trade, a trading firm. Mostly developing trading infrastructures and market data system using C++. I have a deep understanding on tech details including order and execution management, orderbook processing, FIX and TCP protocals, IPCs and system programming.  -->

<!-- In the earlier experience, I worked in the CTBC bank's front office. Working on more about calculation of financial derivatives' price and risks. Both experience make me focus in C++ and financial knowledges. I believe I am the best fit for this position. -->


<!-- : There was a time in my pretty early phase in Aargo. It was the first time handling a trading infrastructure. To implement a new broker's FIX specific. The project itself is not that hard, because we have the original infrastructue for FIX protocol.  -->


<!-- The first one is that I tend to pursue difficult challenges. I took multiple honor courses and graduate course. The second one is I work after I make sure I know what I am doing. Whenever received a new task, I analyze the most effective way to achieve it by understanding the whole picture of current state and what result we want to make. I summarize a path for complex problems in my mind the complete it perfectly.  -->

<!-- - 
: I have to say that I used to tend to work on myself rather than team work.   -->

> 未完成，後面待補
{: .prompt-tip }

- Why should we hire you?
- Why do you want to work here?
- Tell me about a time you were successful on a team.
- What would your co-workers say about you?
- Tell me about something you’ve accomplished that you are proud of.
- What do you like to do outside of work?
- Where do you see yourself in 5 years?
- Tell me about a time you failed or made a mistake.
- Tell me about a time you disagreed with someone.
- Tell me about a time you had to learn something quickly.
- Tell me about a time you had to handle pressure.
- Tell me about a time you created a goal and achieved it.
- Tell me about a time you worked with a diffiult person.
- Tell me about a time you had to persuade someone.
- Tell me about a time you had to manage conflicting priorites.
- Tell me about a time you surpassed people’s expectations.
- Do you have any questions for me?

- What are your salary expactations?
- Can you explain your employment gap?
- Describe your leadership style.
- Why do you want to leave your current role?

