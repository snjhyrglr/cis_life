import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-hide-textbox"
export default class extends Controller {
  static targets = ["textbox"]

  connect() {
    this.toggleTextbox()
  }

  toggleTextbox() {
    const radioBtn = this.element.querySelector(`input[name="${this.radioBtnId}"]:checked`)
    const textbox = this.textboxTarget

    if (radioBtn && textbox) {
      if (radioBtn.value === "true") {
        textbox.classList.remove("d-none")
      } else {
        textbox.classList.add("d-none")
      }
    }
  }

  get radioBtnId() {
    return this.data.get("radioBtnId")
  }
}
