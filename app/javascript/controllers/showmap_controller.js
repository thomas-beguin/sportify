import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showmap"
export default class extends Controller {
  static targets = ["map", "ctamap"]

  connect() {
    console.log("coucou")
  }

  show() {
    console.log("show")
    this.mapTarget.classList.toggle("hide-map");
    if (this.ctamapTarget.innerHTML == "Afficher la carte") {
      this.ctamapTarget.innerHTML = "Afficher la liste"
    } else {
      this.ctamapTarget.innerHTML = "Afficher la carte"
    }
  }
}
