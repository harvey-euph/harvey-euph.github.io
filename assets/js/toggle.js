document.addEventListener("DOMContentLoaded", function () {
  const toggles = document.querySelectorAll(".toggle");
  if (!toggles.length) return;

  toggles.forEach(function (toggle) {
    const header = toggle.querySelector(".toggle-header");
    const content = toggle.querySelector(".toggle-content");
    if (!header || !content) return;

    // 初始化為收合狀態
    content.style.maxHeight = toggle.classList.contains("open")
      ? content.scrollHeight + "px"
      : "0px";
    content.style.overflow = "hidden";
    content.style.transition = "max-height 0.3s ease";

    header.addEventListener("click", function (e) {
      e.stopPropagation(); // 阻止事件冒泡，避免影響外層 toggle

      const isOpen = toggle.classList.toggle("open");

      if (isOpen) {
        content.style.maxHeight = content.scrollHeight + "px";
      } else {
        content.style.maxHeight = "0px";
      }
    });

    // 當內容高度變化（圖片載入、字體切換等）時自動調整
    const resizeObserver = new ResizeObserver(() => {
      if (toggle.classList.contains("open")) {
        content.style.maxHeight = content.scrollHeight + "px";
      }
    });
    resizeObserver.observe(content);
  });
});
