
let listOfAlerts = document.querySelectorAll('.alert-messages-2')

listOfAlerts.forEach(element => {
  var alert = element.querySelector('.alert-alert-2')
  var closeBtn = element.querySelector('.span-close-alert')
  
  closeBtn.addEventListener("click", () => {
    alert.style.display = "none"
    element.style.display = "none"
  })
  
})

