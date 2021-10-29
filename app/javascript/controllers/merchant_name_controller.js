import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["helpText", "name", "icon"]
  static values = { url: String }
  static classes = [ "success", "hidden" ]

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
        if (json.exists) {
          this.clear()
        } else {
          this.setUniq()
        }
      })
  }

  setUniq() {
    this.helpTextTarget.classList.add(this.successClass)
    this.nameTarget.classList.add(this.successClass)
    this.iconTarget.classList.remove(this.hiddenClass)
    this.helpTextTarget.textContent = '¡Felicidades! eres el primero que se regista con este nombre'
  }

  clear(){
    this.helpTextTarget.classList.remove(this.successClass)
    this.nameTarget.classList.remove(this.successClass)
    this.iconTarget.classList.add(this.hiddenClass)
    this.helpTextTarget.textContent = ``
  }

  get name() {
    return this.nameTarget.value
  }

  get url() {
    return `${this.urlValue}?name=${encodeURI(this.name)}`
  }
}
