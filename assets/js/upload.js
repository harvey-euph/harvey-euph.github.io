document.addEventListener("DOMContentLoaded", () => {
  const fileInput = document.getElementById("fileInput");
  const selectBtn = document.getElementById("selectBtn");
  const uploadBtn = document.getElementById("uploadBtn");
  const fileList = document.getElementById("fileList");
  const uploadStatus = document.getElementById("uploadStatus");
  const themeToggle = document.getElementById("themeToggle");

  let selectedFiles = [];

  /* ---------- 🌗 深色 / 淺色 模式 ---------- */
  const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
  const currentTheme = localStorage.getItem("theme") || (prefersDark ? "dark" : "light");
  document.documentElement.setAttribute("data-theme", currentTheme);

  themeToggle.addEventListener("click", () => {
    const newTheme = document.documentElement.getAttribute("data-theme") === "dark" ? "light" : "dark";
    document.documentElement.setAttribute("data-theme", newTheme);
    localStorage.setItem("theme", newTheme);
  });

  /* ---------- 檔案選擇 ---------- */
  selectBtn.addEventListener("click", () => {
    // 清除舊狀態
    fileInput.value = "";
    fileList.innerHTML = "";
    uploadStatus.textContent = "";
    uploadBtn.textContent = "Upload Files";
    uploadBtn.disabled = true;
    selectedFiles = [];

    fileInput.click();
  });

  fileInput.addEventListener("change", (e) => {
    selectedFiles = Array.from(e.target.files);
    fileList.innerHTML = "";

    if (selectedFiles.length === 0) {
      uploadBtn.disabled = true;
      return;
    }

    selectedFiles.forEach((file) => {
      const li = document.createElement("li");
      li.textContent = file.webkitRelativePath || file.name;
      fileList.appendChild(li);
    });

    uploadBtn.disabled = false;
    uploadStatus.textContent = "";
  });

  /* ---------- 上傳檔案 ---------- */
  uploadBtn.addEventListener("click", async () => {
    uploadBtn.disabled = true;
    uploadBtn.textContent = "Uploading...";
    uploadStatus.textContent = "";

    try {
      for (const file of selectedFiles) {
        // 1️⃣ 呼叫 AWS Lambda 取得 presigned URL
        const api = "https://your-lambda-endpoint.amazonaws.com/api/presign";
        const res = await fetch(`${api}?filename=${encodeURIComponent(file.name)}&type=${encodeURIComponent(file.type)}`);
        if (!res.ok) throw new Error("Failed to get presigned URL");

        const { url } = await res.json();

        // 2️⃣ PUT 檔案上 S3
        const uploadRes = await fetch(url, {
          method: "PUT",
          body: file,
          headers: {
            "Content-Type": file.type || "application/octet-stream",
          },
        });

        if (!uploadRes.ok) throw new Error(`Upload failed for ${file.name}`);
      }

      uploadStatus.textContent = "✅ Succeed";
      uploadBtn.textContent = "Succeed";
      uploadBtn.className = "btn btn-success";
    } catch (err) {
      console.error(err);
      uploadStatus.textContent = "❌ Failed";
      uploadBtn.textContent = "Failed";
      uploadBtn.className = "btn btn-danger";
    }
  });
});
