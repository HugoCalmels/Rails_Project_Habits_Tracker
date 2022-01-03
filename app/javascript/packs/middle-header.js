
var selectionDiv = document.querySelector('.middle-navbar-cycle-seleciton')

var menuCondition = false

selectionDiv.addEventListener('click', (event) => {
  var res = selectionDiv.querySelector('.spe-body')
  var res2 = selectionDiv.querySelector('.navbar-link-2')
  if (menuCondition == false) {
    res2.style.textDecoration = 'underline'
    res2.style.fontWeight = 'bold'
    res.style.display = 'block'
    menuCondition = true
  } else if (menuCondition == true) {
    res2.style.textDecoration = 'none'
    res2.style.fontWeight = 500
    res.style.display = 'none'
    menuCondition = false
  }
})

const target = document.querySelector('.middle-navbar-cycle-seleciton')

document.addEventListener('click', (event) => {
  const withinBoundaries = event.composedPath().includes(target)
  var res = selectionDiv.querySelector('.spe-body')
  var res2 = selectionDiv.querySelector('.navbar-link-2')
  if (withinBoundaries) {

  } else {
    res2.style.textDecoration = 'none'
    res2.style.fontWeight = 500
    res.style.display = 'none'
    menuCondition = false
  } 
})








var selectionDiv2 = document.querySelector('.middle-navbar-cycle-seleciton-2')

var menuCondition2 = false

selectionDiv2.addEventListener('click', (event) => {
  console.log("alo ?")
  var res = selectionDiv2.querySelector('.spe-body-2')
  var res2 = selectionDiv2.querySelector('.navbar-link-2')
  console.log("alo ?")
  console.log(menuCondition2)
  if (menuCondition2 == false) {
    res2.style.textDecoration = 'underline'
    res2.style.fontWeight = 'bold'
    res.style.display = 'block'
    menuCondition2 = true
  } else if (menuCondition2 == true) {
    res2.style.textDecoration = 'none'
    res2.style.fontWeight = 500
    res.style.display = 'none'
    menuCondition2 = false
  }
})

const target2 = document.querySelector('.middle-navbar-cycle-seleciton-2')

document.addEventListener('click', (event) => {
  const withinBoundaries = event.composedPath().includes(target2)
  var res = selectionDiv2.querySelector('.spe-body-2')
  var res2 = selectionDiv2.querySelector('.navbar-link-2')
  if (withinBoundaries) {

  } else {
    res2.style.textDecoration = 'none'
    res2.style.fontWeight = 500
    res.style.display = 'none'
    menuCondition2 = false
  } 
})


