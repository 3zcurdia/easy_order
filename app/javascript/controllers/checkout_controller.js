import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["menuItem", "whatsapp"]

  connect() {
    console.log("ready to checkout")
  }
}
