console.log("hello from alerts")


let divElement = document.querySelector('.alert-messages')
let closeButton = document.querySelector('.span-close-alert')

closeButton.addEventListener("click", closeDiv)

function closeDiv() {
  divElement.style.display = "none"
}