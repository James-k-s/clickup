// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "@rails/ujs"
import "bootstrap"

document.addEventListener("DOMContentLoaded", () => {
  const container = document.querySelector('.home-container');
  const emojis = document.querySelectorAll('.floating-emojis .emoji');
  const containerHeight = container.offsetHeight;
  const containerWidth = container.offsetWidth;

  emojis.forEach((emoji) => {
    // Random horizontal and vertical position within the container
    emoji.style.left = `${Math.random() * 100}%`;
    emoji.style.top = `${Math.random() * 90}%`;
    // Optional: random size
    emoji.style.fontSize = `${2 + Math.random() * 3}rem`;
    // Optional: no animation on load, or add animation as you wish
  });
});
