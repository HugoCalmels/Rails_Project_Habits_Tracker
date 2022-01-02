
const openModalButtons = document.querySelectorAll('[data-modal-target]') // new way to catch elements :D
const closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay')
let listOfModals = document.querySelectorAll('.modal')
var menuCondition = false

openModalButtons.forEach(button => {
  button.addEventListener('click', () =>{
    const modal = document.querySelector(button.dataset.modalTarget)
    openModal(modal)
  })
})
closeModalButtons.forEach(button => {
  button.addEventListener('click', () =>{
    const modal = button.closest('.modal')
    closeModal(modal)
  })
})


function openModal(modal) {
  var edit = modal.querySelector('.edit-habit')
  var deleteHabit = modal.querySelector('.delete-habit')
  var show = modal.querySelector('.special-checkboxes')
  if (modal == null) return
  modal.classList.add('active')
  show.style.display = 'grid';
  edit.style.display = 'none';
  deleteHabit.style.display = 'none';
  menuCondition = false
  overlay.classList.add('active')
}
function closeModal(modal) {
  if (modal == null) return
  modal.classList.remove('active')
  overlay.classList.remove('active')
}

overlay.addEventListener('click', () => {
  const modals = document.querySelectorAll('.modal.active')
  modals.forEach(modal => {
    closeModal(modal)
  })
})




listOfModals.forEach(modal => {
  var editBtn = modal.querySelector('.modal-menu .gh-edit')
  var deleteBtn = modal.querySelector('.modal-menu .gh-delete')
  

  editBtn.addEventListener('click', function (event) {
    console.log("editBtn lancé")
    event.preventDefault();
    var edit = modal.querySelector('.edit-habit')
    var show = modal.querySelector('.special-checkboxes')
    var deleteHabit = modal.querySelector('.delete-habit')
    if (menuCondition == false) {
      edit.style.display = 'flex';
      show.style.display = 'none';
      deleteHabit.style.display = 'none';
      menuCondition = true
    } else if (menuCondition == true) {
      edit.style.display = 'none';
      show.style.display = 'grid';
      deleteHabit.style.display = 'none';
      menuCondition = false
    }

  })

  deleteBtn.addEventListener('click', function (event) {
    console.log("deleteBtn lancé")
    event.preventDefault();
    var edit = modal.querySelector('.edit-habit')
    var deleteHabit = modal.querySelector('.delete-habit')
    var show = modal.querySelector('.special-checkboxes')
    if (menuCondition == false) {
      deleteHabit.style.display = 'flex';
      edit.style.display = 'none';
      show.style.display= 'none';
      menuCondition = true
    } else if (menuCondition == true) {
      deleteHabit.style.display = 'none';
      edit.style.display = 'none';
      show.style.display = 'grid';
      menuCondition = false
    }
  })

  
})


// percentages for card divs

var parentEl = document.querySelectorAll('#infos-wrapper')


parentEl.forEach(element => {
  var res = element.querySelector('.invis-percentages')
  element.addEventListener('mouseover', () => {
      res.style.display = 'block'
  })
})


parentEl.forEach(element => {
  var res = element.querySelector('.invis-percentages')
  element.addEventListener('mouseout', () => {
      res.style.display = 'none'
  })
})