import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "header"]

  updateName(event){
    this.nameTarget.textContent = event.target.value;
  }

  updateHeader(event){
    this.headerTarget.setAttribute("style", "background: " + event.target.value + ";")
  }
}
