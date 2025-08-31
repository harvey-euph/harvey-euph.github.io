document.addEventListener("DOMContentLoaded", function () {
  const toggles = document.querySelectorAll(".execute-toggle");
  toggles.forEach(toggle => {
    const header = toggle.querySelector(":scope > .execute-header");
    const content = toggle.querySelector(":scope > .execute-content");
    if (!header || !content) return;

    content.style.overflow = "hidden";
    content.style.transition = "max-height 0.28s ease";
    content.style.maxHeight = "0px";

    header.addEventListener("click", function () {
      const isOpening = !toggle.classList.contains("open");
      if (isOpening) {
        toggle.classList.add("open");
        requestAnimationFrame(() => {
          content.style.maxHeight = content.scrollHeight + "px";
        });
        content.addEventListener("transitionend", function te(e) {
          if (e.propertyName === "max-height" && toggle.classList.contains("open")) {
            content.style.maxHeight = "none";
            content.removeEventListener("transitionend", te);
          }
        });
      } else {
        if (getComputedStyle(content).maxHeight === "none") {
          content.style.maxHeight = content.scrollHeight + "px";
          content.offsetHeight; // force reflow
        }
        toggle.classList.remove("open");
        content.style.maxHeight = "0px";
      }
    });
  });
});
