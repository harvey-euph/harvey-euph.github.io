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
/* === Toggle List Dark/Light 顏色變數（Chirpy 專用）=== */
html {
  @media (prefers-color-scheme: light) {
    &:not([data-mode]),
    &[data-mode='light'] {
      --toggle-bg: #ffffff;
      --toggle-bg-open: #f9fafb;
      --toggle-border: #e5e7eb;
      --toggle-border-open: #d1d5db;
      --toggle-text: #111827;
      --toggle-hover: #f3f4f6;
    }
    &[data-mode='dark'] {
      --toggle-bg: #0f1115;
      --toggle-bg-open: #1a1d24;
      --toggle-border: #2a2f3a;
      --toggle-border-open: #3b4252;
      --toggle-text: #e5e7eb;
      --toggle-hover: #171a21;
    }
  }

  @media (prefers-color-scheme: dark) {
    &:not([data-mode]),
    &[data-mode='dark'] {
      --toggle-bg: #0f1115;
      --toggle-bg-open: #1a1d24;
      --toggle-border: #2a2f3a;
      --toggle-border-open: #3b4252;
      --toggle-text: #e5e7eb;
      --toggle-hover: #171a21;
    }
    &[data-mode='light'] {
      --toggle-bg: #ffffff;
      --toggle-bg-open: #f9fafb;
      --toggle-border: #e5e7eb;
      --toggle-border-open: #d1d5db;
      --toggle-text: #111827;
      --toggle-hover: #f3f4f6;
    }
  }
}

/* === Toggle 元件樣式 === */
.toggle {
  border: 1px solid var(--toggle-border) !important;
  border-radius: 0.75rem;
  background-color: var(--toggle-bg) !important;
  overflow: hidden;
  margin: 1em 0;
  transition: background-color 0.2s ease, border-color 0.2s ease, box-shadow 0.2s ease;
}

.toggle.open {
  background-color: var(--toggle-bg-open) !important;
  border-color: var(--toggle-border-open) !important;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.toggle-header {
  cursor: pointer;
  padding: 0.75em 1em;
  font-weight: bold;
  color: var(--toggle-text) !important;
  display: flex;
  align-items: center;
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

.toggle-header:hover {
  background-color: var(--toggle-hover) !important;
}

.toggle-content {
  max-height: 0;
  overflow: hidden;
  padding: 0 1em;
  color: var(--toggle-text) !important;
  transition: max-height 0.3s ease, padding 0.3s ease;
}

.toggle.open .toggle-content {
  max-height: 500px;
  padding: 0.6em 1em 1em;
}
</style>

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


<details>
    <summary>Toggle</summary>
    <ul>
      <li>程式設計</li>
      <li>Linux Kernel</li>
      <li>金融交易系統</li>
    </ul>
</details>