import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


flatpickr("#range_start", {
  altInput: true,
  minDate: "today",
  disable: [],
  plugins: [new rangePlugin({ input: "#range_end"})]
})
