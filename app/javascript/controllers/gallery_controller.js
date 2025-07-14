import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  static values = { modal: String, carousel: String }

  connect() {
    this.galleryModal = new bootstrap.Modal(document.getElementById(this.modalValue));

    this.galleryCarouselElement = document.getElementById(this.carouselValue);
    this.galleryCarouselElement.addEventListener("slide.bs.carousel", _ => {
      const activePicture = this.galleryCarouselElement.querySelector(".carousel-item.active");
      this.loadNeighborPictures(activePicture);
    });

    document.getElementById(this.modalValue).querySelector(".gallery-download").addEventListener("click", _ => {
      const pictureUrl = document.getElementById(this.modalValue).querySelector(".carousel-item.active img").dataset.pictureUrl;

      var link = document.createElement("a");
      link.href = pictureUrl;
      link.download = "";
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    });
  }

  pictureClick(event) {
    const currentImage = event.target;
    const pictureId = currentImage.dataset.pictureId;
    const wrapper = this.galleryCarouselElement.querySelector(".carousel-inner");

    wrapper.querySelectorAll(".carousel-item").forEach(e => e.classList.remove("active"));

    const wrapperImg = wrapper.querySelector(`img[data-picture-id="${pictureId}"]`);
    wrapperImg.closest(".carousel-item").classList.add("active");
    this.loadPicture(wrapperImg.parentElement);
    
    this.galleryModal.show();
  }

  loadNeighborPictures(carouselItem) {
    if(carouselItem.previousElementSibling) {
      this.loadPicture(carouselItem.previousElementSibling);
    }
    this.loadPicture(carouselItem);
    if(carouselItem.nextElementSibling) {
      this.loadPicture(carouselItem.nextElementSibling);
    }
  }

  loadPicture(carouselItem) {
    const img = carouselItem.querySelector("img");
    if(img.attributes.src === undefined) {
      img.src = img.dataset.pictureUrl;
    }
  }
}
