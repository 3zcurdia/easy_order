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
    let url = event.item.getAttribute('data-url')
    let data = { position: event.newIndex }
    fetch(url, {
      body: JSON.stringify(data),
      method: 'PUT',
      credentials: "same-origin",
      headers: this.headers
    })
    .then(response => response.json())
    .then(result => {
      console.log('Success:', result)
    })
    .catch((error) => {
      console.error('Error:', error)
    })
  }

  get headers(){
    return {
      'Content-Type': 'application/json',
      "X-CSRF-Token": this.getMetaValue("csrf-token")
    }
  }

  getMetaValue(value) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
