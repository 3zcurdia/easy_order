import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["number"]

  add() {
    this.value++
  }

  sub() {
    if (this.value <= 0) {
      return
    } 
    this.value--
  }

  get value() {
    return this.numberTarget.value 
  }

  set value(new_value) {
    this.numberTarget.value = new_value
  }
}
