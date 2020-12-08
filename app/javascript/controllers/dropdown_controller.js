import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [ "active" ]

  toggle() {
    this.element.classList.toggle(this.activeClass);
  }
}
