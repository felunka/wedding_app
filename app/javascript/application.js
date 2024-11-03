// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "cocoon-js-vanilla"
import BootstrapTooltips from "components/bootstrap_tooltips"

// Fix popperjs
window.process = {};
window.process.env = {};
window.process.env.NODE_ENV = "production";

document.addEventListener("turbo:load", function() {
  BootstrapTooltips.setup();
  const rsvpButton = document.getElementById("hotel-rsvp-button")
  rsvpButton.addEventListener("click", (_) => {
    rsvpButton.classList.add("d-none")
  });
});
