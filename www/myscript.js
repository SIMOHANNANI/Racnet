/*document.body.style.backgroundColor = "skyblue";*/
/*document.querySelector("#loader").style.visibility = "hidden";*/
// When recalculating starts, show loading screen 
/* $(document).on('shiny:recalculating', function(event) {
$('div#divLoading').addClass('show');
});*/

// When new value or error comes in, hide loading screen 
/*$(document).on('shiny:value shiny:error', function(event) {
$('div#divLoading').removeClass('show');
});


document.onreadystatechange = function() { 
    if (document.readyState !== "complete") { 
        document.querySelector( 
          "body").style.visibility = "hidden"; 
        document.querySelector( 
          "#loader").style.visibility = "visible"; 
    } else { 
        document.querySelector( 
          "#loader").style.display = "none"; 
        document.querySelector( 
          "body").style.visibility = "visible"; 
    } 
}; 

window.addEventListener('load', function () {
  alert("It's loaded!")
})*/

function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}
document.onreadystatechange =  function() {
    if (document.readyState !== "complete") { 
        document.querySelector("body").style.visibility = "hidden"; 
        document.querySelector("#loader").style.visibility = "visible";
        sleep(1000).then(() => {
        if (document.readyState == "complete") { 
          document.querySelector("#loader").style.display = "none"; 
          document.querySelector("body").style.visibility = "visible"; 
        }
        });
         
    }
}; 
