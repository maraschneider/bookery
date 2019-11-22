import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
import flatpickr from "flatpickr";
import "flatpickr/dist/themes/airbnb.css";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#start-date", {
  altInput: true,
  "plugins": [new rangePlugin({ input: "#end-date" })]
});

flatpickr(".disable-dates", {
  dateFormat: "Y-m-d",
  disable: [
  {
    from: "2019-12.01",
    to: "2019-12-07"
   }
  ]
});
