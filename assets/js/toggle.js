document.addEventListener("DOMContentLoaded", function () {
  const toggles = document.querySelectorAll(".toggle");
  if (!toggles.length) return;

  toggles.forEach(function (toggle) {
    // 只抓直屬，避免抓到巢內的元素
    const header = toggle.querySelector(":scope > .toggle-header");
    const content = toggle.querySelector(":scope > .toggle-content");
    if (!header || !content) return;

    // 基本動畫設定（避免和舊 CSS 打架）
    content.style.overflow = "hidden";
    content.style.transition = "max-height 0.28s ease";

    // 初始化：如果一開始就有 open class，展開；否則收合
    if (toggle.classList.contains("open")) {
      content.style.maxHeight = content.scrollHeight + "px";
      // 展開完成後設為 none，讓巢狀打開時外層能自動長高
      content.addEventListener("transitionend", function te(e) {
        if (e.propertyName === "max-height" && toggle.classList.contains("open")) {
          content.style.maxHeight = "none";
          content.removeEventListener("transitionend", te);
        }
      });
    } else {
      content.style.maxHeight = "0px";
    }

    header.addEventListener("click", function (e) {
      e.stopPropagation(); // 巢狀時阻止事件往上冒泡

      const isOpening = !toggle.classList.contains("open");

      if (isOpening) {
        // 先從 0 開始，再長到實際高度
        toggle.classList.add("open");
        // 先確保不是 none，才能做動畫
        if (getComputedStyle(content).maxHeight === "none") {
          content.style.maxHeight = content.scrollHeight + "px";
        }
        // 下一幀再量，避免 layout 抖動
        requestAnimationFrame(() => {
          content.style.maxHeight = content.scrollHeight + "px";
        });

        // 展開完成後把 max-height 設回 none，讓內層展開時外層可以自適應
        const onOpenEnd = (ev) => {
          if (ev.propertyName === "max-height" && toggle.classList.contains("open")) {
            content.style.maxHeight = "none";
            content.removeEventListener("transitionend", onOpenEnd);
          }
        };
        content.addEventListener("transitionend", onOpenEnd);
      } else {
        // 若目前是 none，先設為實際高度，才能有「往上收」的動畫
        if (getComputedStyle(content).maxHeight === "none") {
          content.style.maxHeight = content.scrollHeight + "px";
          // 強制回流以套用當前高度
          // eslint-disable-next-line no-unused-expressions
          content.offsetHeight;
        }
        toggle.classList.remove("open");
        content.style.maxHeight = "0px";
      }
    });

    // 內文尺寸在開啟狀態變化（例如圖片載入、字體變化）時，確保外層高度跟上
    // 開啟狀態我們用 max-height:none，所以理論上會自動撐開；這裡只是保險。
    const ro = new ResizeObserver(() => {
      if (toggle.classList.contains("open")) {
        // 若在動畫中就略過；若是 none 就不用理
        if (getComputedStyle(content).maxHeight !== "none") return;
        // 不動就能自動撐開；若有需要也可暫時量一次：
        // content.style.maxHeight = "none";
      }
    });
    ro.observe(content);
  });
});
