import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["source"]

  connect() {
    let url = this.sourceTarget.getAttribute('data-url')
    this.sourceTarget.setAttribute('src', url)
  }
}
