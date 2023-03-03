import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showmap"
export default class extends Controller {
  static targets = ["map", "ctamap", "form"]

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

  // New Method

  displayCurrentPosition() {
    navigator.geolocation.getCurrentPosition((data) => {
      const lat = data.coords.latitude;
      const lon = data.coords.longitude;
      const url = `https://sportify-thomas-beguin.osc-fr1.scalingo.io/?current_position%5Blat%5D=${lat}&current_position%5Blon%5D=${lon}&commit=current_location`;
      window.location.href = url ;
    });

  }
}
