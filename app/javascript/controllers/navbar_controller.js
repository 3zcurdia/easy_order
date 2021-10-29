import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggleMenu(event) {
    event.target.classList.toggle('is-active');
    this.menuTarget.classList.toggle('is-active');
  }
}
