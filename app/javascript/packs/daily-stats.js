console.log("hello from daily_stats")


divDay = document.getElementsByName('day')
divInvis = document.getElementsByName('invis')


divDay.forEach(element =>
  element.addEventListener('mouseover', unhideDiv) 
);
  
divDay.forEach(element =>
  element.addEventListener('mouseout', hideDiv) 
  );
  

function unhideDiv(event) {
  var res = event.target.querySelector('.day-invis');
  console.log(res)
  console.log(event.target)

  res.style.opacity = 1;
}

function hideDiv(event) {
  var res = event.target.querySelector('.day-invis');
    console.log(res)
    console.log(event.target)

    res.style.opacity = 0;
}