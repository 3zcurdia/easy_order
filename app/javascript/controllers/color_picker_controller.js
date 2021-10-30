import { Controller } from "@hotwired/stimulus"
import piklor from "piklor.js"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    let that = this;
    var pk = new piklor.Piklor(".color-picker", this.colors, {open: ".picker-wrapper .button" });
    pk.colorChosen(function(color) { that.update(color); });
  }

  update(color) {
    this.inputTarget.value = color;
  }

  get colors() {
    return [
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
  }
}
