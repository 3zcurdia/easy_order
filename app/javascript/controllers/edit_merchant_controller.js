import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["merchanName"]

  updateName(event){
    this.merchanNameTarget.textContent = event.target.value
  }
}
