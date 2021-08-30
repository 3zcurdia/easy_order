import { Piklor } from "piklor.js"
window.addEventListener("turbo:load", () => {
  if (document.querySelector('.color-picker') == null) { return; }
  let colors = [
    "#1abc9c",
    "#2ecc71",
    "#3498db",
    "#34495e",
    "#16a085",
    "#27ae60",
    "#2980b9",
    "#9c6bad",
    "#2c3e50",
    "#f1c40f",
    "#e67e22",
    "#e74c3c",
    "#95a5a6",
    "#bdc3c7",
    "#7f8c8d",
    "#000000"
  ];
  var pk = new Piklor(".color-picker", colors, {open: ".picker-wrapper .button" });
  let input = document.querySelector(".picker-wrapper input");
  let preview = document.querySelector(".preview .hero");

  pk.colorChosen(function (color) {
      input.value = color;
      preview.setAttribute("style", "background: " + color + ";")
  });
});
