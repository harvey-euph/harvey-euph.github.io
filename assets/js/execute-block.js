document.addEventListener("DOMContentLoaded", function () {
  const execs = document.querySelectorAll(".exec");
  if (!execs.length) return;

  execs.forEach(function (exec) {
    const button = exec.querySelector(".exec-button");
    const output = exec.querySelector(".exec-output");
    if (!button || !output) return;

    // 初始隱藏 output
    output.style.display = "none";
    output.style.overflow = "hidden";
    output.style.transition = "max-height 0.28s ease, padding 0.28s ease";

    // 初始 max-height 為 0
    output.style.maxHeight = "0px";
    output.style.padding = "0";

    button.addEventListener("click", function (e) {
      e.stopPropagation();

      const isHidden = output.style.display === "none";

      if (isHidden) {
        // 顯示 output
        output.style.display = "block";
        // 先確保不是 none，才能動畫
        requestAnimationFrame(() => {
          output.style.maxHeight = output.scrollHeight + "px";
          output.style.padding = "1em 0";  // 添加一些 padding 讓它看起來接在下方
        });

        // 展開完成後設為 none，讓內容自適應
        const onOpenEnd = (ev) => {
          if (ev.propertyName === "max-height" && output.style.display === "block") {
            output.style.maxHeight = "none";
            output.removeEventListener("transitionend", onOpenEnd);
          }
        };
        output.addEventListener("transitionend", onOpenEnd);
      } else {
        // 隱藏 output
        // 若目前是 none，先設為實際高度
        if (getComputedStyle(output).maxHeight === "none") {
          output.style.maxHeight = output.scrollHeight + "px";
          // 強制回流
          output.offsetHeight;
        }
        output.style.maxHeight = "0px";
        output.style.padding = "0";

        // 收合完成後完全隱藏
        const onCloseEnd = (ev) => {
          if (ev.propertyName === "max-height" && output.style.maxHeight === "0px") {
            output.style.display = "none";
            output.removeEventListener("transitionend", onCloseEnd);
          }
        };
        output.addEventListener("transitionend", onCloseEnd);
      }
    });

    // ResizeObserver 確保 output 展開時高度自適應
    const ro = new ResizeObserver(() => {
      if (output.style.display === "block" && getComputedStyle(output).maxHeight === "none") {
        // 若內容變化，暫時重設 max-height 以自適應
        output.style.maxHeight = output.scrollHeight + "px";
        requestAnimationFrame(() => {
          output.style.maxHeight = "none";
        });
      }
    });
    ro.observe(output);
  });
});