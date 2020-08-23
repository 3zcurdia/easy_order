import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["merchants", "sections", "products", "orders", "transactions"]

  connect() {
    this.load()
  }

  load() {
    fetch(this.data.get("url"))
    .then(response => response.json())
    .then(json => {
      this.merchantsTarget.textContent = json.merchants
      this.sectionsTarget.textContent = json.sections
      this.productsTarget.textContent = json.products
      this.ordersTarget.textContent = json.orders
      this.transactionsTarget.textContent = `$ ${(json.transactions.cents/100.0).toFixed(2)}`
    })
  }
}
