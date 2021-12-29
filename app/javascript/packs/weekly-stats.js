console.log("hello from daily_stats")
divDay = document.getElementsByName('day')
divInvis = document.getElementsByName('invis')
/*
divDay.forEach(element =>
  element.addEventListener('mouseover', displayStats) 
);
  
let menuCondition = false
  

function displayStats(event) {
  console.log(event.target)

  divInvis.forEach(element => {
    if (element.id == event.target.id) {
      console.log(element)
      element.style.display = "block";
    }
  });
}
*/
/*
divDay.forEach(div => {
 
  div.addEventListener('mouseover', (event) => {
    console.log(event.target)
    var test = event.querySelector('.day-invis')
    console.log(test)

    // invis.style.opacity = 1;
  })
})
*/


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

/*
divDay = document.getElementsByName('day')
divInvis = document.getElementsByName('invis')

divDay.forEach (element =>console.log(element.innerHTML))

divDay.forEach(element =>
  element.addEventListener('mouseover', unhideDiv) 
);
  
divDay.forEach(element =>
  element.addEventListener('mouseout', hideDiv) 
  );
  

function unhideDiv(event) {
  console.log(event.target)

  event.stopPropagation();
  event.target.style.display = "block";

}


function hideDiv(event) {
  console.log(event.target)
  event.stopPropagation();
  event.target.style.display = "none";


}

*/