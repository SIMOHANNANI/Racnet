library(shiny)
library(arulesViz, warn.conflicts = FALSE)
library(bootstraplib)
bs_theme_new(bootswatch = "sketchy")
#-------------------------------------------------------------
# loadingBar <- tags$div(class="progress progress-striped active",
#                        tags$div(class="bar", style="width: 100%;"))
# # Code for loading message
# loadingMsg <- tags$div(class="modal", tabindex="-1", role="dialog",
#                        "aria-labelledby"="myModalLabel", "aria-hidden"="true",
#                        tags$div(class="modal-header",
#                                 tags$h3(id="myModalHeader", "Loading...")),
#                        tags$div(class="modal-footer",
#                                 loadingBar))
# # The conditional panel to show when shiny is busy
# loadingPanel <- conditionalPanel(paste("input.goButton > 0 &&",
#                                        "$('html').hasClass('shiny-busy')"),
#                                  loadingMsg)
#------------------------------------------------------------
shinyOptions(plot.autocolor=TRUE)
# define the UI :
ui <- fluidPage(
  
  titlePanel(windowTitle = "Racnet",
             title = tags$head(
               tags$link(rel = "shortcut icon",
                         href = "img/favicon.png", )
             )),
  theme = 'stylesheet.css',
  # the page title :
  tags$head(tags$title("Racnet"),),
  bootstrap(),
  tags$div(class = "container"),
  ## Logo for my website :
  navbarPage(
    title = tagList(
      a(
        img(src = "img/logo.jpeg", height = "50px"),
        target = "_Blank",
        href = "https://racnet.shinyapps.io/racnet/"
      ),
    ),
    
    tabPanel(
      "Home",
      icon = icon("home", "fa-2x"),
      sidebarLayout(
        sidebarPanel(
          h1("APRIORI INPUTS"),
          id = "panelTitle"
          ,
          hr(),
          sliderInput(
            "visualization",
            h4("number of row"),
            value = 5,
            min = 1,
            step = 1,
            max = 50
          ),
          hr(),
          sliderInput(
            "min_conf",
            h4("min-confidence"),
            min = 0.0,
            max = 1.0,
            value = 0.1,
            step = 0.1
          ),
          hr(),
          sliderInput(
            "min_supp",
            h4("min-support"),
            min = 0.0,
            max = 1.0,
            value = 0.1,
            step = 0.1
          ),
        ),
        
        
        
        mainPanel(tabsetPanel(
          tabPanel(
            title = "Getting the data",
            icon = icon("database"),
            tags$div(
              id = "uploadFiles",
              fileInput(
                "file",
                "Choose CSV File",
                width = "80%",
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")
              )
            )
            
          ),
          
          
          tabPanel(
            title = "Viewing the data",
            style = "overflow:scroll; height: 464px",
            icon = icon("eye"),
            tags$div(sliderInput(
              "toDisply",
              h3("Control the number of row to display"),
              value = 5,
              min = 1,
              step = 1,
              max = 50
            ), ),
            tableOutput("Viewing_the_data")
          ),
          
          
          tabPanel(
            title = "visualizing the data",
            style = "overflow:scroll; height: 464px",
            icon = icon("chart-area"),
            
            tabsetPanel(
              id = "subTabPanel1",
              tabPanel(
                "item frequency visualization",
                icon = icon("signal"),
                plotOutput("frequencychart",
                           height = "415px"),
              ),
              tabPanel(
                "graph visualization",
                icon = icon("project-diagram"),
                plotOutput("graphChart",
                           height = "415px")
              ),
              tabPanel(
                "scatter visualization",
                icon = icon("chart-line"),
                tags$div(sliderInput(
                  "cex",
                  h3("control the size of points"),
                  value = .5,
                  min = 0.1,
                  step = .1,
                  max = 2
                ), ),
                plotOutput("scatterChart",
                           width = "80%",
                           height = "294px")
                
              ),
              tabPanel(
                "matrix visualization",
                icon = icon("chart-pie"),
                plotOutput("matrixChart",
                           height = "415px")
              )
            )
          )
        )),
      )
    ),
    # ------About tab------
    tabPanel(
      "About Us",
      icon = icon("address-card", "fa-2x"),
      shiny::HTML(
        "

      <div class='header'>
   <div class='header__bg'></div>
</div>

<div class='about'>
   <div class='about__title'>
      <h2 class='about__title--text'>Who we are?</h2>
   </div>
   <div class='about__text'>
      <p class='about__text--content'>
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         <br>
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................

         <br>

         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         ......................................................................................
         </p>
   </div>
</div>
      "
      )
      
    ),
    tabPanel(
      "Contact Us",
      icon = icon("file-signature", "fa-2x"),
      
      shiny::HTML(
        "
        <div class='container mw-50' id='contact'>
    			<div class='section-content'>
    				 <div class='contact-image'>
                <img src='img/launch.svg' alt='rocket_contact'/>
            </div>
            <h1 class='section-header'>Give us a shout</h1>
    			</div>
    			<div class='container'>
    				<form  id='form_contact'>
    					<div class='container'>
    			  			<div class='form-group'>
    			  				<label for='exampleInputUsername'>Your name</label>
    					    	<input type='text' class='form-control' id='' placeholder=' Enter Your Name'>
    				  		</div>
    				  		<div class='form-group'>
    					    	<label for='exampleInputEmail'>Email Address</label>
    					    	<input type='email'' class='form-control' id='exampleInputEmail' placeholder=' Enter Your Email'>
    					  	</div>
    			  		</div>
    			  		<div class='container'>
    			  			<div class='form-group'>
    			  				<label for ='description'>Message</label>
    			  			 	<textarea  class='form-control' id='description' placeholder='Enter Your Message'></textarea>
    			  			</div>
    			  			<div>
    			  				<button type='button' class='btn btn-default submit'><i class='fa fa-paper-plane' aria-hidden='true'></i>  Send Message</button>
    			  			</div>
    					</div>
    				</form>
    			</div>
		  </div>
                 "
      ),
      
    ),
    tabPanel(div(
      id = "img-id",
      a(
        img(id = "github", src = "img/github.png") ,
        target = "_Blank"
        ,
        href = "https://github.com/SIMOHANNANI/Racnet"
      ),
    ), )
  ),
  
  # titlePanel("shiny "),
  
)
# define the server logic :
server <- function(input, output) {
  options(shiny.maxRequestSize = 200 * 1024 ^ 2)
  data <- reactive({
    req(input$file)
    ext <- tools::file_ext(input$file$name)
    switch(
      ext,
      csv = read.csv(input$file$datapath),
      validate("Invalid file; Please upload a .csv or .tsv file")
    )
  })
  output$Viewing_the_data <- renderTable({
    head(data(), input$toDisply)
  }, spacing = "s", bordered = TRUE)
  rules <- reactive({
    head(read.csv(input$file$datapath), input$visualization)
    transactions = read.transactions(
      file = file(input$file$datapath),
      format = "basket",
      sep = ","
    )
    minValue <- min(length(transactions),input$visualization)
    
    print("hello")
    print(minValue)
    
    rules <-
      apriori(transactions[0:minValue],
              parameter = list(
                support = input$min_supp,
                confidence = input$min_conf
              ))
    return(rules)
  })
  output$graphChart <- renderPlot({
    set.seed(42)
    plot(rules(), method = "graph",)
  })
  output$scatterChart <- renderPlot({
    plot(rules(), col  = rainbow(25), cex  = input$cex)
  })
  output$matrixChart <- renderPlot({
    plot(rules(), method = "matrix",)
    
  })
  output$frequencychart <-  renderPlot({
    transactions = read.transactions(
      file = file(input$file$datapath),
      format = "basket",
      sep = ","
    )
    minValue <- min(length(transactions),input$visualization)
    barplot(itemFrequency(transactions[0:minValue],
                          type = "absolute"),col="#fff95a",
                          main="frequency per product",
                          xlab="products",
                          ylab="frequency",
                          beside=TRUE
            )
  })
}

# run the application :
shinyApp(ui = ui, server = server)
