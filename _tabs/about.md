---
# the default layout is 'page'
icon: fas fa-info-circle
order: 4
title: About me
---



👋 Hi，我是 **Harvey**。熱衷於 **C++** 及各種軟體技術，喜歡深入理解系統運作、效能優化與底層設計。非軟體相關科系出身，畢業後致力於從上到下補齊必備的軟體相關知識，目前在一家新創 Hedge Fund 擔任軟體工程師，我想在這邊放置一些我的學習筆記，試圖用淺白的中文將軟體知識寫出來，讓和我一樣非本科的人更容易跨入軟體的世界。

---

## 📚 讀書筆記

我平常會挑選對工作與底層理解有幫助的技術書籍閱讀，邊讀邊整理心得與重點筆記，希望幫助記憶，也讓別人更容易入門這些技術。 

### 🔹 [Dynamic Hedging — Nassim Nicholas Taleb](/posts/note-dynamic-hedging)
探討 **期權交易風險管理** 實務的經典作品，適合對量化交易與期權避險策略有興趣的人。  

### 🔹 [Learning eBPF — Liz Rice](/posts/note-learning-ebpf)

---

## 📬 Contact

歡迎交流與討論，未來會不定期分享在工作中遇到的 **技術難題與新知筆記**，你也可以透過 [LinkedIn](https://www.linkedin.com/in/harveywu-k/) 找到我。


<style>
.toggle {
  border: 1px solid var(--toggle-border);
  border-radius: 6px;
  margin: 1em 0;
  background-color: var(--toggle-bg) !important; /* 修正白底問題 */
  overflow: hidden;
  transition: background-color 0.2s ease, border-color 0.2s ease, box-shadow 0.2s ease;
}

.toggle.open {
  background-color: var(--toggle-bg-open) !important;
  border-color: var(--toggle-border-open);
  box-shadow: var(--toggle-shadow);
}

.toggle-header {
  cursor: pointer;
  padding: 0.6em 1em;
  font-weight: bold;
  display: flex;
  align-items: center;
  position: relative;
}

.toggle-header::before {
  content: "▶";
  display: inline-block;
  margin-right: 0.5em;
  transition: transform 0.2s ease;
}

.toggle.open .toggle-header::before {
  transform: rotate(90deg);
}

.toggle-content {
  max-height: 0;
  overflow: hidden;
  padding: 0 1em;
  transition: max-height 0.3s ease, padding 0.3s ease;
}

.toggle.open .toggle-content {
  max-height: 500px;
  padding: 0.6em 1em;
}

/* Light 模式 */
:root {
  --toggle-bg: #f9f9f9;
  --toggle-bg-open: #ffffff;
  --toggle-border: #ddd;
  --toggle-border-open: #aaa;
  --toggle-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}

/* Dark 模式 */
html.dark {
  --toggle-bg: #2b2b2b;
  --toggle-bg-open: #1f1f1f;
  --toggle-border: #444;
  --toggle-border-open: #666;
  --toggle-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);
}
</style>


<script>
document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll(".toggle").forEach(function (toggle) {
    const header = toggle.querySelector(".toggle-header");
    header.addEventListener("click", function () {
      toggle.classList.toggle("open");
    });
  });
});
</script>

<div class="toggle">
  <div class="toggle-header">📌 我的興趣</div>
  <div class="toggle-content">
    <ul>
      <li>程式設計</li>
      <li>Linux Kernel</li>
      <li>金融交易系統</li>
    </ul>
  </div>
</div>

<details>
    <summary>Toggle</summary>
- Text in toggle
- Text in toggle 2
- Text in toggle 3
</details>