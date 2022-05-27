import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="footer"
export default class extends Controller {
  connect() {
    console.log("more than toys is saying hallo")
  }

  updateFooter() {
    // if (window.scrollY >= 200) {
    //   this.element.classList.add("footer")
    // } else {
    //   this.element.classList.remove("footer")
    // }
  }
}
