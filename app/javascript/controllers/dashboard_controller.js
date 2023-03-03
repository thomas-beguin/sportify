// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="dashboard"
// export default class extends Controller {

//   static targets = ["client","owner", "btnClient", "btnOwner"]

//   connect() {
//   }

//   client() {
//     this.clientTarget.classList.remove("d-none")
//     this.ownerTarget.classList.add("d-none")

//     this.btnClientTarget.classList.add("active-button")
//     this.btnClientTarget.classList.remove("inactive-button")

//     this.btnOwnerTarget.classList.add("inactive-button")
//     this.btnOwnerTarget.classList.remove("active-button")
//   }

//   owner() {
//     this.clientTarget.classList.add("d-none")
//     this.ownerTarget.classList.remove("d-none")

//     this.btnClientTarget.classList.add("inactive-button")
//     this.btnClientTarget.classList.remove("active-button")

//     this.btnOwnerTarget.classList.remove("inactive-button")
//     this.btnOwnerTarget.classList.add("active-button")
//   }
// }
