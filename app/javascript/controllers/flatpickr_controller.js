import { Controller } from "@hotwired/stimulus"
// Import flatpickr function
import flatpickr from "flatpickr"
// The range plugin is also needed in order to use two inputs
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {
// retrieve the targets from the DOM
static targets = [ 'startDateInput', 'endDateInput' ]
// On controller's connection, call the flatpickr
// function in order to build the calendars
  connect() {
    flatpickr(this.startDateInputTarget, {
    mode: 'range',
    inline: true,

    "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    })
  }
}

export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput', 'priceHolder' ]
  // retrieve the pokemon's price_per_day value
  static values = { price: Number }
  updatePrice() {
  const startDate = this.startDateInputTarget.value
  const endDate = this.endDateInputTarget.value
  const days = this.#diffInDays(startDate, endDate)
  const totalValue = this.#totalValue(days)
  this.#setPriceValue(totalValue)
  }
  #setPriceValue(value) {
  // Replace the text inside the priceHolder target with the value argument
  this.priceHolderTarget.innerText = value
  }
  #diffInDays(startDate, endDate) {
  // Calculate the difference between the two dates only if they both
  // are defined (they are undefined if an input has no value)
  if (startDate && endDate) {
  // retrieve the difference between the two dates in milliseconds
  const diffTime = (Date.parse(endDate) - Date.parse(startDate))
  // Turn milliseconds to days
  var days = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
  } else {
  var days = 0
  }
  // Add 1 day by default
  return days + 1
  }
  #totalValue(days) {
  // Multiply the pokemon's price_per_day by the number of days
  return (days) * this.priceValue
