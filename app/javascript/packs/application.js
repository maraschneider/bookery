import "bootstrap";
import flatpickr from "flatpickr";
import "flatpickr/dist/themes/airbnb.css";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#start-date", {
  altInput: true,
  "plugins": [new rangePlugin({ input: "#end-date" })]
});
