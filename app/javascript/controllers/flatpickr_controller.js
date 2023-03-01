import { Controller } from "@hotwired/stimulus"
// Import flatpickr function
import flatpickr from "flatpickr"
// The range plugin is also needed in order to use two inputs
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {

  static targets = [ 'startDateInput', 'endDateInput', 'priceHolder']
  static values = { price: Number }

  connect() {
    flatpickr(this.startDateInputTarget, {
      mode: 'range',
      inline: true,

      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
      })
  }

}
