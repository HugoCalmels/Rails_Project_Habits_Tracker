
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
    console.log('in')
    res.style.opacity = 1;
  }
  
  function hideDiv(event) {
    var res = event.target.querySelector('.day-invis');
    console.log('out')
    res.style.opacity = 0;
  }