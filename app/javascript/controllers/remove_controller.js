import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="remove"
export default class extends Controller {
  static values = {
    timeout: Number
  }

  connect () {
    if (this.timeoutValue) {
      this.timeoutId = setTimeout(this.removeElement.bind(this), this.timeoutValue)
    }
  }

  disconnect () {
    if (this.timeoutValue) clearTimeout(this.timeoutId)
  }

  removeElement () {
    this.element.remove()
  }
}
