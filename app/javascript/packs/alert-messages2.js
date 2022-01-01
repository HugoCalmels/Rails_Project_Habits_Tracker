console.log("hello from alerts2")

/*
let divElement = document.querySelector('.alert-messages')
let closeButton = document.querySelector('.span-close-alert')
*/

let listOfAlerts = document.querySelectorAll('.alert-messages-2')

listOfAlerts.forEach(element => {
  var alert = element.querySelector('.alert-alert-2')
  var closeBtn = element.querySelector('.span-close-alert')
  
  closeBtn.addEventListener("click", () => {
   
    alert.style.display = "none"
    element.style.display = "none"
  })
  
})

/*
closeButton.addEventListener("click", closeDiv)

function closeDiv() {
  divElement.style.display = "none"
}
*/