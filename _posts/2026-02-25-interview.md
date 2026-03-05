---
title: "Behavior Questions 整理"
date: 2025-07-25 00:00:00 +0800
categories: [Careers, Interview]
tags: [Careers, Interview]
---

- [ ] Tell me about yourself. (Self-introduction)

> 我是吳冠宏，畢業於台大數學系。
> 過去兩年我在 Aargo Trade 擔任 C++ developer，主要負責交易系統與市場資料系統的開發。工作內容涵蓋底層的連線與交易協議實作，到整個系統的運作與穩定性維護。
> 我是一個具有獨立推進專案和解決問題的能力的人，也能在團隊合作中提出自己對專案的考量，讓團隊合作順暢。當我遇到意見有衝突的時候，我會搭配 AI 工具初步評估確認我的想法是否穩固，如果 AI 工具能支持我的想法我會再進一步尋找確切的證據來說服團隊其他人。我在獨立作業和團隊合作都有實際解決問題或提高效率的案例。

- [ ] What’s your greatest strength?

> 我覺得自己最大的優勢是 problem solving 的能力。
> 數學背景很訓練把複雜問題拆解的能力，我在工程上我也習慣先理解問題的限制條件和目標，再拆解任務或問題，找出最直接有效的解法。
> 另外一個優勢是自我學習能力。軟體開發其實有很多技術需要快速學習，我過去不論是 C++、各種軟體開發相關能力和工具﹑交易系統相關協議、市場資料處理，都是透過自學和實戰逐漸建立起來，我很能接受新事物，也會自己發掘自己有興趣的東西來學。

- [ ] What’s your greatest weakness?

> 如果說一個我過去比較需要調整的地方，是我以前在團隊合作時，有時候會傾向把事情自己扛下來完成。
> 比如在大學專案時，如果我覺得某個部分進度比較慢，我可能會直接自己把那部分做完。短期來說效率很高，但我明白長期其實不是最好的合作方式。
> 後來我慢慢意識到，其實很多時候問題不是別人能力問題，而是 context 不足，而且可能有些人不是那麼習慣需要自己去掌握一些環境現有 context。如果能先把整個專案的背景、目標和設計邏輯講清楚，團隊成員通常就能做得很好。
> 所以現在我會比較多花時間在分享 context 和設計想法，讓大家能在同一個理解下工作。

- [ ] Describe your most challenging project.

> 在 Aargo Trade 工作早期我就遇到一個相當困難的情況，當時可以說是練習，主管讓我用一個已經成形的專案去改寫，來滿足另一個 Broker 的交易協議需求，大致的組件都已經成形，需要我動的部分理論上就只有應用層的微調，對新手來說應該是很適合的練習
> 但實際情形卻沒這麼美好，當時遇到了前所未有的困難，觀察到的現象是連線後極度不穩，大概經過一兩分鐘就會被對方斷線
> 也不全然是連不上線，因為連線測試和登入訊息都可以成功，主管說也沒遇過這種情形，不確定怎麼處理，讓我自己再研究研究
> 我從研究協議內容得知這種現象是因為對方沒有收到我方的 heartbeat，沒辦法確定我方還活著所以斷線，可是我確定我有正常送
> 經過測試發現 logon 訊息以外傳什麼對方都收不到
> 去檢查 TCP message 發現對方明明就有收到，還有回 ACK，表示傳輸層沒問題，但是應用層可能行為不對，懷疑是對方有問題，但對方表示沒辦法在他們的機器跑抓包軟體，需要額外申請權限而且大概也不是符合規定的理由
> 主管建議可以用 python 的第三方協議庫來測試，結果連線行為正常，表示確定我方還有行為可以修改
> 做了諸多測試，包含送訊息用同步非同步啦，多送幾次啦，或是調換順序，不要先送 logon ，此時得知不是 logon 以外都收不到，而是第一封訊息之後都收不到，懷疑是所有訊息都有的共同點讓對方的應用層處理壞掉
> 發現 buffer 沒有截斷，把更大塊的空白 buffer 一起送，懷疑問題在這裡，改掉之後就成功了。
> 相同的行為其他 broker 可以正常處理，但是這家剛好會被空白 buffer 破壞正常行為。

<!-- - Tell me about a time you showed leadership. -->

<!-- - Tell me about yourself. (Self-introduction)
: I am Harvey. Worked as a quant developer in Aargo Trade, a trading firm. Mostly developing trading infrastructures and market data system using C++. I have a deep understanding on tech details including order and execution management, orderbook processing, FIX and TCP protocals, IPCs and system programming.  -->

<!-- In the earlier experience, I worked in the CTBC bank's front office. Working on more about calculation of financial derivatives' price and risks. Both experience make me focus in C++ and financial knowledges. I believe I am the best fit for this position. -->

<!-- - Why do you (want to) leave your last job.
: Actually I was laid off. Our boss decided to stop the maintenance of the platform we were working on. Almost all tech team member were gone. (If asked why stop: We had algo trader before, but getting more and more manual trader and none of algo trader now, thus they can use platform from brokers) -->

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

