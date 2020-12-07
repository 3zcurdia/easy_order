import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["merchants", "sections", "products", "orders", "transactions"]
  static values = { url: String }

  connect() {
    this.load()
  }

  load() {
    fetch(this.urlValue)
    .then(response => response.json())
    .then(json => {
      if (json.merchants != null) {
        this.merchantsTarget.textContent = json.merchants
      }
      this.sectionsTarget.textContent = json.sections
      this.productsTarget.textContent = json.products
      this.ordersTarget.textContent = json.orders
      var ammount = 0.0
      if (json.transactions != null && json.transactions.cents != null) {
        ammount = json.transactions.cents / 100.0
      }
      this.transactionsTarget.textContent = `$ ${ammount.toFixed(2)}`
    })
  }
}
