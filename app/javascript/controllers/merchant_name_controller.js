import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["helpText", "name", "icon" ]

  connect() {
    this.helpTextTarget.textContent = ''
  }

  change() {
    this.clear();
    if (this.name.length > 3) {
      setTimeout(() => { this.search() }, 600)
    }
  }

  search() {
    fetch(this.url)
      .then(response => response.json())
      .then(json => {
        if (json.available) {
          this.setUniq()
        } else {
          this.clear()
        }
      })
  }

  setUniq() {
    this.helpTextTarget.classList.add('is-success')
    this.nameTarget.classList.add('is-success')
    this.iconTarget.classList.remove('is-hidden')
    this.helpTextTarget.textContent = '¡Felicidades! eres el primero que se regista con este nombre'
  }

  clear(){
    this.helpTextTarget.classList.remove('is-success')
    this.nameTarget.classList.remove('is-success')
    this.iconTarget.classList.add('is-hidden')
    this.helpTextTarget.textContent = ``
  }

  get name() {
    return this.nameTarget.value
  }

  get url() {
    return `${this.data.get("url")}?name=${encodeURI(this.name)}`
  }
}
