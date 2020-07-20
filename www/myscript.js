$("body").css('background-color',"#2c302d");
$("body").css('visibility',  "hidden");  
function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}
document.onreadystatechange =  function() {
    if (document.readyState !== "complete"){
        $("body").css('background-color',"#2c302d");
        $("#panelTitle").css('display',  "none");
        $("body").css('visibility',  "hidden");  
        $("#loader").css('visibility',  "visible"); 
        $("#loader").css("background-image", "https://cdn.dribbble.com/users/634508/screenshots/2172083/ebookdribbble7.gif");
    }
        sleep(5000).then(() => {
          if (document.readyState == "complete") { 
            $("#loader").css('display',  "none"); 
            $("#panelTitle").css('display',  "block"); 
            $("body").css('visibility',  "visible"); 
            $("body").css('background-color',  "#f2f2de"); 
          }
        });
         
    
}; 
document.querySelector("body").style.backgroundColor = "#f2f2de"; 

/*function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}
document.onreadystatechange =  function() {
    if (document.readyState !== "complete") { 

        document.querySelector("body").style.visibility = "hidden";
        document.getElementById("panelTitle").style.display = 'none'; 
        document.querySelector("#loader").style.visibility = "visible";

        
        sleep(2000).then(() => {
          if (document.readyState == "complete") { 
            document.getElementById("panelTitle").style.display = 'block'; 
            document.querySelector("#loader").style.visibility = "hidden"; 
            document.querySelector("body").style.visibility = "visible"; 

          }
        });
         
    }
}; 

document.querySelector("body").style.backgroundColor = "#f2f2de"; */










