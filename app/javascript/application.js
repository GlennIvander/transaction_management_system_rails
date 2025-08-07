import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("DOMContentLoaded", () => {
  const flashNotice = document.getElementById("flash-notice");

  if (flashNotice) {
    setTimeout(() => {
      flashNotice.classList.add("opacity-0");
      setTimeout(() => flashNotice.remove(), 500);
    }, 3000);
  }
});
