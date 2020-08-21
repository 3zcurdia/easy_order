import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["header", "merchanName"]

  updateName(event){
    this.merchanNameTarget.textContent = event.target.value
  }
}
