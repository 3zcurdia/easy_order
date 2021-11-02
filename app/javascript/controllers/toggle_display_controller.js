import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-display"
export default class extends Controller {
  static targets = [ "element" ]
  static classes = [ "hidden" ]

  toggleElement(event) {
    event.preventDefault();
    for (var element of this.elementTargets) {
      if (element.getAttribute("id") === event.params["id"]) {
        element.classList.toggle(this.hiddenClass);
      }
    }
  }
}
