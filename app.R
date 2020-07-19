library(shiny)
library(shinycssloaders)
library(arulesViz, warn.conflicts = FALSE)
library(bootstraplib)
library(DT)
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
# Options for Spinner
options(spinner.color="#f96f0c", spinner.color.background="#ffffff", spinner.size=0.6)
shinyOptions(plot.autocolor=TRUE)
# define the UI :
ui <- fluidPage(
  tags$script(src = "myscript.js"),
  # shiny::HTML(
  # "<div id='loader' class='center'></div>
  # "),
  
  titlePanel(windowTitle = "Racnet",
             title = tags$head(
               tags$link(rel = "shortcut icon",
                         href = "img/favicon.png", )
             )),
  theme = 'stylesheet.css',
  # the page title :
  tags$head(tags$title("Racnet"),),
  bootstrap(),
  tags$div(id='loader',class='center'),
  # tag$div(
  #   id='loader',class='center',
  #   tag$div(class=''),
  # 
  # ),
  # <div class="lds-roller"><div></div><div></div><div></div><div></div><div>
  #   </div><div></div><div></div><div></div></div>
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
            min = 0.1,
            max = 0.9,
            value = 0.1,
            step = 0.1
          ),
          hr(),
          sliderInput(
            "min_supp",
            h4("min-support"),
            min = 0.1,
            max = 0.9,
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
            
            conditionalPanel( condition = "output.nrows",
                              tags$div(sliderInput(
                                "toDisply",
                                h3("Control the number of row to display"),
                                value = 5,
                                min = 1,
                                step = 1,
                                max = 50
                              ),
                              ),
            ),
            withSpinner(tableOutput("Viewing_the_data"), type = 6),
          ),
          
          
          tabPanel(
            title = "visualizing the data",
            style = "overflow:scroll; height: 464px",
            icon = icon("chart-area"),
            
            
            tabsetPanel(
              id = "subTabPanel1",
              tabPanel(
                "item frequency ",
                icon = icon("signal"),
                
                withSpinner(plotOutput("frequencychart",
                                       height = "415px"), type = 6),
              ),
              tabPanel(
                "graph plot",
                icon = icon("project-diagram"),
                withSpinner(plotOutput("graphChart",
                                       height = "415px"), type = 6),
                
              ),
              tabPanel(
                "association rules",
                icon = icon("project-diagram"),
                # tableOutput("TBL")
                withSpinner(DT::dataTableOutput("mytable"), type = 6),
                
              ),
              tabPanel(
                "scatter plot",
                icon = icon("chart-line"),
                conditionalPanel( condition = "output.nrows",
                                  tags$div(sliderInput(
                                    "cex",
                                    h3("control the size of points"),
                                    value = .5,
                                    min = 0.1,
                                    step = .1,
                                    max = 2
                                  ), ),),
                withSpinner(plotOutput("scatterChart",
                                       width = "80%",
                                       height = "294px"), type = 6),
                
                
              ),
              tabPanel(
                "matrix plot",
                icon = icon("chart-pie"),
                withSpinner(plotOutput("matrixChart",
                                       height = "415px"), type = 6),
                
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
  rules2df <- function(rules, list=F){
    df <- as(rules, 'data.frame')
    df[,1] <- as.character(df[,1])
    df$lhs <- sapply(df[,1], function(x) strsplit(x, split=' => ')[[1]][1])
    df$rhs <- sapply(df[,1], function(x) strsplit(x, split=' => ')[[1]][2])
    df$lhs <- gsub(pattern='\\{', replacement='', x=df$lhs)
    df$lhs <- gsub(pattern='}', replacement='', x=df$lhs)
    df$rhs <- gsub(pattern='\\{', replacement='', x=df$rhs)
    df$rhs <- gsub(pattern='}', replacement='', x=df$rhs)
    return(df)
  }
  
  options(shiny.maxRequestSize = 200 * 1024 ^ 2)
  data <- reactive({
    # if(is.null(input$files)) return(NULL)
    validate(
      need(input$file, "Please choose a data set")
    )
    # req(input$file)
    # validate(need(input$file, message = FALSE))
    ext <- tools::file_ext(input$file$name)
    switch(
      ext,
      csv = read.csv(input$file$datapath),
      validate("Invalid file; Please upload a .csv or .tsv file")
    )
  })
  
  output$nrows <- reactive({
    nrow(data())
  })
  
  outputOptions(output, "nrows", suspendWhenHidden = FALSE)  
  
  
  
  
  
  output$Viewing_the_data <- renderTable({
    Sys.sleep(1) 
    head(data(), input$toDisply)
  }, spacing = "s", bordered = TRUE)
  rules <- reactive({
    validate(
      need(input$file, "Please choose a data set")
    )
    # head(read.csv(input$file$datapath), input$visualization)
    transactions = read.transactions(
      file = file(input$file$datapath),
      format = "basket",
      sep = ","
    )
    minValue <- min(length(transactions),input$visualization)
    
    # print(minValue)
    
    rules <-
      apriori(transactions[0:minValue],
              parameter = list(
                support = input$min_supp,
                confidence = input$min_conf
              ))
    print(length(transactions[0:minValue]))
    return(rules)
  })
  output$graphChart <- renderPlot({
    Sys.sleep(2) 
    validate(
      need(input$file, "Please choose a data set")
    )
    set.seed(42)
    # validate(
    #   need(length(rules()) == 0, "zero rules")
    # )
    
    tryCatch({
      plot(rules(), method = "graph",)
    })
    error = function(condition){
      print('there was an error')
    }
    
    
    # else{
    #   return "no found rules";
    # }
  })
  
  
  
  
  
  # df <- rules2df(rules)
  # output$TBL <- renderTable({
  #   df()
  # })
  
  output$mytable = DT::renderDataTable({
    Sys.sleep(2) 
    rules2df(rules())
  })
  
  
  
  output$scatterChart <- renderPlot({
    Sys.sleep(2) 
    plot(rules(), col  = rainbow(25), cex  = input$cex)
  })
  output$matrixChart <- renderPlot({
    Sys.sleep(2) 
    plot(rules(), method = "matrix",)
    
  })
  output$frequencychart <-  renderPlot({
    Sys.sleep(2) 
    validate(
      need(input$file, "Please choose a data set")
    )
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

















# library(shiny)
# library(shinycssloaders)
# library(arulesViz, warn.conflicts = FALSE)
# library(bootstraplib)
# library(DT)
# bs_theme_new(bootswatch = "sketchy")
# #-------------------------------------------------------------
# # loadingBar <- tags$div(class="progress progress-striped active",
# #                        tags$div(class="bar", style="width: 100%;"))
# # # Code for loading message
# # loadingMsg <- tags$div(class="modal", tabindex="-1", role="dialog",
# #                        "aria-labelledby"="myModalLabel", "aria-hidden"="true",
# #                        tags$div(class="modal-header",
# #                                 tags$h3(id="myModalHeader", "Loading...")),
# #                        tags$div(class="modal-footer",
# #                                 loadingBar))
# # # The conditional panel to show when shiny is busy
# # loadingPanel <- conditionalPanel(paste("input.goButton > 0 &&",
# #                                        "$('html').hasClass('shiny-busy')"),
# #                                  loadingMsg)
# #------------------------------------------------------------
# # Options for Spinner
# options(spinner.color="#f96f0c", spinner.color.background="#ffffff", spinner.size=0.6)
# shinyOptions(plot.autocolor=TRUE)
# # define the UI :
# ui <- fluidPage(
#   shiny::HTML(
#   "<div id='loader' class='center'></div>
#   "),
#   
#   titlePanel(windowTitle = "Racnet",
#      title = tags$head(
#        tags$link(rel = "shortcut icon",
#                  href = "img/favicon.png", )
#    )),
#   theme = 'stylesheet.css',
#   # the page title :
#   tags$head(tags$title("Racnet"),),
#   bootstrap(),
#   tags$div(id='loader',class='center'),
#   # tag$div(
#   #   id='loader',class='center',
#   #   tag$div(class=''),
#   # 
#   # ),
#   # <div class="lds-roller"><div></div><div></div><div></div><div></div><div>
#   #   </div><div></div><div></div><div></div></div>
#   tags$div(class = "container"),
#   ## Logo for my website :
#   navbarPage(
#     title = tagList(
#       a(
#         img(src = "img/logo.jpeg", height = "50px"),
#         target = "_Blank",
#         href = "https://racnet.shinyapps.io/racnet/"
#       ),
#     ),
#     tabPanel(
#       "Home",
#       icon = icon("home", "fa-2x"),
#       sidebarLayout(
#         sidebarPanel(
#           h1("APRIORI INPUTS"),
#           id = "panelTitle"
#           ,
#           hr(),
#           sliderInput(
#             "visualization",
#             h4("number of row"),
#             value = 5,
#             min = 1,
#             step = 1,
#             max = 50
#           ),
#           hr(),
#           sliderInput(
#             "min_conf",
#             h4("min-confidence"),
#             min = 0.1,
#             max = 0.9,
#             value = 0.1,
#             step = 0.1
#           ),
#           hr(),
#           sliderInput(
#             "min_supp",
#             h4("min-support"),
#             min = 0.1,
#             max = 0.9,
#             value = 0.1,
#             step = 0.1
#           ),
#         ),
#         
#         
#         
#         mainPanel(tabsetPanel(
#           tabPanel(
#             title = "Getting the data",
#             icon = icon("database"),
#             tags$div(
#               id = "uploadFiles",
#               fileInput(
#                 "file",
#                 "Choose CSV File",
#                 width = "80%",
#                 multiple = TRUE,
#                 accept = c("text/csv",
#                            "text/comma-separated-values,text/plain",
#                            ".csv")
#               )
#             )
#             
#           ),
#           
#           
#           tabPanel(
#             title = "Viewing the data",
#             style = "overflow:scroll; height: 464px",
#             icon = icon("eye"),
#            
#             conditionalPanel( condition = "output.nrows",
#                   tags$div(sliderInput(
#                     "toDisply",
#                     h3("Control the number of row to display"),
#                     value = 5,
#                     min = 1,
#                     step = 1,
#                     max = 50
#                   ),
#              ),
#             ),
#                 withSpinner(tableOutput("Viewing_the_data"), type = 6),
#           ),
#           
#           
#           tabPanel(
#             title = "visualizing the data",
#             style = "overflow:scroll; height: 464px",
#             icon = icon("chart-area"),
# 
#             
#             tabsetPanel(
#               id = "subTabPanel1",
#               tabPanel(
#                 "item frequency ",
#                 icon = icon("signal"),
#                 
#                 withSpinner(plotOutput("frequencychart",
#                                        height = "415px"), type = 6),
#               ),
#             tabPanel(
#               "graph plot",
#               icon = icon("project-diagram"),
#               withSpinner(plotOutput("graphChart",
#                                      height = "415px"), type = 6),
#               
#             ),
#               tabPanel(
#                 "association rules",
#                 icon = icon("project-diagram"),
#                 # tableOutput("TBL")
#                 withSpinner(DT::dataTableOutput("mytable"), type = 6),
#                 
#               ),
#               tabPanel(
#                 "scatter plot",
#                 icon = icon("chart-line"),
#                 conditionalPanel( condition = "output.nrows",
#                 tags$div(sliderInput(
#                   "cex",
#                   h3("control the size of points"),
#                   value = .5,
#                   min = 0.1,
#                   step = .1,
#                   max = 2
#                 ), ),),
#                 withSpinner(plotOutput("scatterChart",
#                                        width = "80%",
#                                        height = "294px"), type = 6),
#                 
#                 
#               ),
#               tabPanel(
#                 "matrix plot",
#                 icon = icon("chart-pie"),
#                 withSpinner(plotOutput("matrixChart",
#                                        height = "415px"), type = 6),
#                 
#               )
#             )
#           )
#         )),
#       )
#     ),
#     # ------About tab------
#     
#     tabPanel(
#       "About Us",
#       icon = icon("address-card", "fa-2x"),
#       shiny::HTML(
#         "
# 
#       <div class='header'>
#    <div class='header__bg'></div>
# </div>
# 
# <div class='about'>
#    <div class='about__title'>
#       <h2 class='about__title--text'>Who we are?</h2>
#    </div>
#    <div class='about__text'>
#       <p class='about__text--content'>
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          <br>
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
# 
#          <br>
# 
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          ......................................................................................
#          </p>
#    </div>
# </div>
#       "
#       )
#       
#     ),
#     tabPanel(
#       "Contact Us",
#       icon = icon("file-signature", "fa-2x"),
#       
#       shiny::HTML(
#         "
#         <div class='container mw-50' id='contact'>
#     			<div class='section-content'>
#     				 <div class='contact-image'>
#                 <img src='img/launch.svg' alt='rocket_contact'/>
#             </div>
#             <h1 class='section-header'>Give us a shout</h1>
#     			</div>
#     			<div class='container'>
#     				<form  id='form_contact'>
#     					<div class='container'>
#     			  			<div class='form-group'>
#     			  				<label for='exampleInputUsername'>Your name</label>
#     					    	<input type='text' class='form-control' id='' placeholder=' Enter Your Name'>
#     				  		</div>
#     				  		<div class='form-group'>
#     					    	<label for='exampleInputEmail'>Email Address</label>
#     					    	<input type='email'' class='form-control' id='exampleInputEmail' placeholder=' Enter Your Email'>
#     					  	</div>
#     			  		</div>
#     			  		<div class='container'>
#     			  			<div class='form-group'>
#     			  				<label for ='description'>Message</label>
#     			  			 	<textarea  class='form-control' id='description' placeholder='Enter Your Message'></textarea>
#     			  			</div>
#     			  			<div>
#     			  				<button type='button' class='btn btn-default submit'><i class='fa fa-paper-plane' aria-hidden='true'></i>  Send Message</button>
#     			  			</div>
#     					</div>
#     				</form>
#     			</div>
# 		  </div>
#                  "
#       ),
#       
#     ),
#     tabPanel(div(
#       id = "img-id",
#       a(
#         img(id = "github", src = "img/github.png") ,
#         target = "_Blank"
#         ,
#         href = "https://github.com/SIMOHANNANI/Racnet"
#       ),
#     ), )
#   ),
#   
#   # titlePanel("shiny "),
#   tags$head(tags$script(src="myscript.js")),
#   # tags$script(src = "myscript.js"),
# )
# # define the server logic :
# server <- function(input, output) {
#   rules2df <- function(rules, list=F){
#     df <- as(rules, 'data.frame')
#     df[,1] <- as.character(df[,1])
#     df$lhs <- sapply(df[,1], function(x) strsplit(x, split=' => ')[[1]][1])
#     df$rhs <- sapply(df[,1], function(x) strsplit(x, split=' => ')[[1]][2])
#     df$lhs <- gsub(pattern='\\{', replacement='', x=df$lhs)
#     df$lhs <- gsub(pattern='}', replacement='', x=df$lhs)
#     df$rhs <- gsub(pattern='\\{', replacement='', x=df$rhs)
#     df$rhs <- gsub(pattern='}', replacement='', x=df$rhs)
#     return(df)
#   }
#   
#   options(shiny.maxRequestSize = 200 * 1024 ^ 2)
#   data <- reactive({
#     # if(is.null(input$files)) return(NULL)
#     validate(
#       need(input$file, "Please choose a data set")
#     )
#     # req(input$file)
#     # validate(need(input$file, message = FALSE))
#     ext <- tools::file_ext(input$file$name)
#     switch(
#       ext,
#       csv = read.csv(input$file$datapath),
#       validate("Invalid file; Please upload a .csv or .tsv file")
#     )
#   })
#   
#   output$nrows <- reactive({
#     nrow(data())
#   })
#   
#   outputOptions(output, "nrows", suspendWhenHidden = FALSE)  
#   
#   
# 
#   
#   
#   output$Viewing_the_data <- renderTable({
#     Sys.sleep(1) 
#     head(data(), input$toDisply)
#   }, spacing = "s", bordered = TRUE)
#   rules <- reactive({
#     validate(
#       need(input$file, "Please choose a data set")
#     )
#     # head(read.csv(input$file$datapath), input$visualization)
#     transactions = read.transactions(
#       file = file(input$file$datapath),
#       format = "basket",
#       sep = ","
#     )
#     minValue <- min(length(transactions),input$visualization)
#     
#     # print(minValue)
#     
#     rules <-
#       apriori(transactions[0:minValue],
#               parameter = list(
#                 support = input$min_supp,
#                 confidence = input$min_conf
#               ))
#     print(length(transactions[0:minValue]))
#     return(rules)
#   })
#   output$graphChart <- renderPlot({
#     Sys.sleep(2) 
#     validate(
#       need(input$file, "Please choose a data set")
#     )
#     set.seed(42)
#     # validate(
#     #   need(length(rules()) == 0, "zero rules")
#     # )
#       
#       tryCatch({
#         plot(rules(), method = "graph",)
#       })
#     error = function(condition){
#       print('there was an error')
#     }
#       
# 
#     # else{
#     #   return "no found rules";
#     # }
#   })
#   
#   
#   
#   
# 
#   # df <- rules2df(rules)
#   # output$TBL <- renderTable({
#   #   df()
#   # })
#   
#   output$mytable = DT::renderDataTable({
#     Sys.sleep(2) 
#    rules2df(rules())
#   })
#   
#   
#   
#   output$scatterChart <- renderPlot({
#     Sys.sleep(2) 
#     plot(rules(), col  = rainbow(25), cex  = input$cex)
#   })
#   output$matrixChart <- renderPlot({
#     Sys.sleep(2) 
#     plot(rules(), method = "matrix",)
#     
#   })
#   output$frequencychart <-  renderPlot({
#     Sys.sleep(2) 
#     validate(
#       need(input$file, "Please choose a data set")
#     )
#     transactions = read.transactions(
#       file = file(input$file$datapath),
#       format = "basket",
#       sep = ","
#     )
#     minValue <- min(length(transactions),input$visualization)
#     barplot(itemFrequency(transactions[0:minValue],
#                           type = "absolute"),col="#fff95a",
#                           main="frequency per product",
#                           xlab="products",
#                           ylab="frequency",
#                           beside=TRUE
#             )
#   })
# }
# 
# # run the application :
# shinyApp(ui = ui, server = server)






