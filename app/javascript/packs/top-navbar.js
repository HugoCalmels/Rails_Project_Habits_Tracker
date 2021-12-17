const hamburger = document.querySelector(".hamburger");
let listMenu = document.querySelector('.list-hamburger')

hamburger.addEventListener("click", mobileMenu);

let menuCondition = false

function mobileMenu() {
    if (menuCondition == true) {
        listMenu.style.display = "none"
        menuCondition = false
      } else if (menuCondition == false) {
        listMenu.style.display = "block"
        menuCondition = true
      }
}


  var button = document.getElementById( 'menu-toggle' );

  // Click the button.
  button.onclick = function() {
      
    // Toggle class "opened". Set also aria-expanded to true or false.
    if ( -1 !== button.className.indexOf( 'opened' ) ) {
      button.className = button.className.replace( ' opened', '' );
      button.setAttribute( 'aria-expanded', 'false' );
    } else {
       button.className += ' opened';
      button.setAttribute( 'aria-expanded', 'true' );
     }
      
  };
   

  // just to close the opened menu when up re
function myFunction(x) {
    if (x.matches) { // If media query matches
        
    } else {
        listMenu.style.display = "none"
        button.className = button.className.replace( ' opened', '' );
        button.setAttribute('aria-expanded', 'false');
        menuCondition = false
    }
  }
  var x = window.matchMedia("(max-width: 700px)")
  myFunction(x) // Call listener function at run time
x.addListener(myFunction) // 
  
