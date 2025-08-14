document.addEventListener("DOMContentLoaded", function () {
  const toggles = document.querySelectorAll(".toggle");
  if (!toggles.length) return;

  toggles.forEach(function (toggle) {
    const header = toggle.querySelector(".toggle-header");
    if (header) {
      header.addEventListener("click", function () {
        toggle.classList.toggle("open");
      });
    }
  });
});