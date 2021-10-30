import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dismiss() {
    this.element.parentNode.removeChild(this.element);
  }
}
