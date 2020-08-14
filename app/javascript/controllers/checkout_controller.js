import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["menuItem", "totalValue"]

  connect() {
    var cart = []
  }

  updateCart(){
    this.cart = []
    this.menuItemTargets.forEach((item) => { this.appendItem(item)})
    this.calculateTotal()
  }

  calculateTotal() {
    var valueCents = 0
    this.cart.forEach((item) => {
      valueCents += item.price * item.quantity
    })
    this.totalValueTarget.innerHTML = `$ ${(valueCents/100.0).toFixed(2)}`
  }

  appendItem(item) {
    let quantity = item.getAttribute('data-numeric-input-value')
    if (quantity) {
      let name = item.getAttribute('data-name')
      let price = item.getAttribute('data-price')
      this.cart.push({ name: name, price: price, quantity: quantity })
    }
  }
}
