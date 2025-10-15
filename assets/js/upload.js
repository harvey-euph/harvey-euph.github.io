document.addEventListener("DOMContentLoaded", () => {
  const fileInput = document.getElementById("fileInput");
  const selectBtn = document.getElementById("selectBtn");
  const uploadBtn = document.getElementById("uploadBtn");
  const fileList = document.getElementById("fileList");
  const uploadStatus = document.getElementById("uploadStatus");

  let selectedFiles = [];

  // 點擊「Select Files」按鈕打開檔案選擇視窗
  selectBtn.addEventListener("click", () => fileInput.click());

  // 顯示選擇的檔案清單
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

  // 上傳邏輯
  uploadBtn.addEventListener("click", async () => {
    uploadBtn.disabled = true;
    uploadBtn.textContent = "Uploading...";
    uploadStatus.textContent = "";

    try {
      for (const file of selectedFiles) {
        // 向你的後端 API 要一個 presigned URL
        const res = await fetch(`/api/presign?filename=${encodeURIComponent(file.name)}&type=${encodeURIComponent(file.type)}`);
        if (!res.ok) throw new Error("Failed to get presigned URL");

        const { url } = await res.json();

        // 實際 PUT 檔案上 S3
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
