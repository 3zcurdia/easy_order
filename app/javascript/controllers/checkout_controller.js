import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["menuItem", "whatsappOrder", "totalValue"]

  connect() {
    var cart = []
  }

  updateCart(){
    this.cart = []
    this.menuItemTargets.forEach((item) => { this.appendItem(item)})
    this.calculateTotal()
    this.updateWhatsappMessage()
  }

  calculateTotal() {
    var valueCents = 0
    this.cart.forEach((item) => {
      valueCents += item.price * item.quantity
    })
    this.totalValueTarget.innerHTML = `$ ${(valueCents/100.0).toFixed(2)}`
  }

  updateWhatsappMessage() {
    let url = `https://wa.me/${this.merchantPhone}?text=${encodeURIComponent(this.orderMessage)}`
    this.whatsappOrderTarget.setAttribute("href", url)
  }

  get orderMessage() {
    var textOutput = "Hola vi su menu en linea y me gustaria ordenar:\n"
    this.cart.forEach((item) => {
      textOutput += `${item.quantity} x ${item.name}\n`
    })
    return textOutput
  }

  get merchantPhone() {
    this.data.get('merchantPhone')
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
