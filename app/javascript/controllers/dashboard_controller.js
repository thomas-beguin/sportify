import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {

  static targets = ["client","owner", "btnClient", "btnOwner"]

  connect() {
  }

  client() {
    this.clientTarget.classList.remove("d-none")
    this.ownerTarget.classList.add("d-none")
    this.btnClientTarget.classList.remove("btn-outline-primary")
    this.btnClientTarget.classList.add("active btn-primary text-white font-weight-bold")
    this.btnOwnerTarget.classList.remove("active btn-primary text-white font-weight-bold")
    this.btnOwnerTarget.classList.add("btn-outline-primary")
  }

  owner() {
    this.clientTarget.classList.add("d-none")
    this.ownerTarget.classList.remove("d-none")
    this.btnClientTarget.classList.remove("active btn-primary text-white font-weight-bold")
    this.btnClientTarget.classList.add("btn-outline-primary")
    this.btnOwnerTarget.classList.remove("btn-outline-primary")
    this.btnOwnerTarget.classList.add("active btn-primary text-white font-weight-bold")
  }
}
