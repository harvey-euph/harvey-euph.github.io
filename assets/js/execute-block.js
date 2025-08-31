// 在原有的 toggle.js 中新增，或放在 execute-block.js
document.addEventListener("DOMContentLoaded", function () {
  const executeBlocks = document.querySelectorAll(".execute-block");
  if (!executeBlocks.length) return;

  executeBlocks.forEach(function (block) {
    const toggle = block.querySelector(".execute-toggle");
    const output = block.querySelector(".execute-output");
    const arrow = block.querySelector(".execute-arrow");
    
    if (!toggle || !output || !arrow) return;

    // 基本動畫設定
    output.style.overflow = "hidden";
    output.style.transition = "max-height 0.3s ease, opacity 0.3s ease";
    arrow.style.transition = "transform 0.2s ease";

    // 初始化狀態
    if (block.classList.contains("open")) {
      output.style.maxHeight = output.scrollHeight + "px";
      output.style.opacity = "1";
      arrow.style.transform = "rotate(90deg)";
      // 展開完成後設為 none，讓內容能自動調整
      output.addEventListener("transitionend", function te(e) {
        if (e.propertyName === "max-height" && block.classList.contains("open")) {
          output.style.maxHeight = "none";
          output.removeEventListener("transitionend", te);
        }
      });
    } else {
      output.style.maxHeight = "0px";
      output.style.opacity = "0";
      arrow.style.transform = "rotate(0deg)";
    }

    toggle.addEventListener("click", function (e) {
      e.preventDefault();
      e.stopPropagation();

      const isOpening = !block.classList.contains("open");

      if (isOpening) {
        block.classList.add("open");
        arrow.style.transform = "rotate(90deg)";
        output.style.opacity = "1";
        
        // 確保能做動畫
        if (getComputedStyle(output).maxHeight === "none") {
          output.style.maxHeight = output.scrollHeight + "px";
        }
        
        requestAnimationFrame(() => {
          output.style.maxHeight = output.scrollHeight + "px";
        });

        // 展開完成後設為 none
        const onOpenEnd = (ev) => {
          if (ev.propertyName === "max-height" && block.classList.contains("open")) {
            output.style.maxHeight = "none";
            output.removeEventListener("transitionend", onOpenEnd);
          }
        };
        output.addEventListener("transitionend", onOpenEnd);
      } else {
        // 收合
        if (getComputedStyle(output).maxHeight === "none") {
          output.style.maxHeight = output.scrollHeight + "px";
          // 強制回流
          output.offsetHeight;
        }
        
        block.classList.remove("open");
        arrow.style.transform = "rotate(0deg)";
        output.style.maxHeight = "0px";
        output.style.opacity = "0";
      }
    });

    // 處理內容動態變化
    const ro = new ResizeObserver(() => {
      if (block.classList.contains("open") && getComputedStyle(output).maxHeight === "none") {
        // 內容已展開且設為 none，會自動調整
      }
    });
    ro.observe(output);
  });
});