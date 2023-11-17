var side = document.querySelector(".left_menu");
var toggleBtn = document.getElementById("togglebutton");
toggleBtn.addEventListener("click", () => {
  side.classList.toggle("closed");
});
