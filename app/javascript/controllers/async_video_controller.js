import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["source"]
  static values = { url: String }

  connect() {
    this.sourceTarget.setAttribute('src', this.urlValue)
  }
}
