function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}
document.onreadystatechange =  function() {
    if (document.readyState !== "complete") { 
        document.getElementById("panelTitle").style.display = 'none';
        document.querySelector("body").style.visibility = "hidden"; 
        document.querySelector("#loader").style.visibility = "visible";
        
        sleep(3000).then(() => {
        if (document.readyState == "complete") { 
          document.querySelector("#loader").style.display = "none"; 
          document.getElementById("panelTitle").style.display = 'block'; 
          document.querySelector("body").style.visibility = "visible"; 
        }
        });
         
    }
}; 


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










