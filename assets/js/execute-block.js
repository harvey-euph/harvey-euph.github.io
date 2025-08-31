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
    output.style.transition = "opacity 0.3s ease, max-height 0.3s ease";
    output.style.overflow = "hidden";
    arrow.style.transition = "transform 0.2s ease";

    // 初始化狀態
    if (block.classList.contains("open")) {
      output.style.opacity = "1";
      output.style.maxHeight = "none";
      arrow.style.transform = "rotate(90deg)";
    } else {
      output.style.opacity = "0";
      output.style.maxHeight = "0";
      output.style.display = "none";
      arrow.style.transform = "rotate(0deg)";
    }

    toggle.addEventListener("click", function (e) {
      e.preventDefault();
      e.stopPropagation();

      const isOpening = !block.classList.contains("open");

      if (isOpening) {
        block.classList.add("open");
        arrow.style.transform = "rotate(90deg)";
        output.style.display = "inline";
        output.style.opacity = "1";
        output.style.maxHeight = "none";
      } else {
        block.classList.remove("open");
        arrow.style.transform = "rotate(0deg)";
        output.style.opacity = "0";
        output.style.maxHeight = "0";
        // 延遲隱藏以配合動畫
        setTimeout(() => {
          if (!block.classList.contains("open")) {
            output.style.display = "none";
          }
        }, 300);
      }
    });
  });
});