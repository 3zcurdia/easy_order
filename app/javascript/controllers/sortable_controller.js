import { Controller } from "stimulus"
import { Sortable } from "sortablejs"

export default class extends Controller {
  static targets = ["item"]

  connect() {
    var sortable = Sortable.create(
      this.element,
      {
        handle: '.handle',
        onEnd: this.update,
      }
    );
  }

  update(event) {
    let token = document.head.querySelector(`meta[name="csrf-token"]`).getAttribute("content")
    let url = event.item.getAttribute('data-url')
    let data = { position: event.newIndex }
    let headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "X-CSRF-Token": token
    }
    fetch(url, {
      body: JSON.stringify(data),
      method: 'PUT',
      credentials: "same-origin",
      headers: headers
    })
    .then(response => response.json())
    .then(result => {
      console.log('Success:', result)
    })
    .catch((error) => {
      console.error('Error:', error)
    })
  }
}
