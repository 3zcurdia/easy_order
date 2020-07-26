import { Controller } from "stimulus"
import { Sortable } from "sortablejs"

export default class extends Controller {
  static targets = ["item"]

  connect() {
    let that = this
    var sortable = Sortable.create(
      this.element,
      {
        handle: '.handle',
        onEnd: function (event) { that.update(event); },
      }
    )
  }

  update(event) {
    fetch(this.url, {
      body: JSON.stringify(this.newPositions()),
      method: 'PUT',
      credentials: "same-origin",
      headers: this.headers
    })
  }

  newPositions() {
    var list = []
    this.itemTargets.forEach((item, i) => {
      list.push({
        id: item.getAttribute('data-item-id'),
        position: i
      })
    })
    return { sorted: { menu_items: list } }
  }

  get url() {
    return this.data.get('url')
  }

  get headers() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "X-CSRF-Token": this.token
    }
  }

  get token() {
    return document.head.querySelector(`meta[name="csrf-token"]`).getAttribute("content")
  }
}
