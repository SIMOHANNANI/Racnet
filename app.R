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
# define the UI :
ui <- fluidPage(
  titlePanel(windowTitle = "Racnet",
             title = tags$head(
               tags$link(rel = "shortcut icon",
                         href = "img/favicon.png",)
             )),
  theme = 'stylesheet.css',
  windowTitle = "NOAA",
  title = tags$head(
    tags$link(rel = "stylesheet",
              href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css",
              type = "image/vnd.microsoft.icon")
  ),
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
            max = 20
          ),
          hr(),
          sliderInput(
            "min_conf",
            h4("min-confidence"),
            min = 0,
            max = 1,
            value = 0.1,
            step = 0.1
          ),
          hr(),
          sliderInput(
            "min_supp",
            h4("min-support"),
            min = 0,
            max = 1,
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
            style = "overflow:scroll; max-height: 460px",
            icon = icon("eye"),
            tags$div(sliderInput(
              "toDisply",
              h3("Control the number of row to display"),
              value = 5,
              min = 1,
              step = 1,
              max = 20
            ),),
            tableOutput("Viewing_the_data")
          ),
          
          
          tabPanel(
            title = "visualizing the data",
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
                ),),
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
    tabPanel("About", icon = icon("address-card", "fa-2x")),
    tabPanel("Contact us",icon=icon("file-signature","fa-2x")),
    tabPanel(div(
      id = "img-id",
      a(
        img(id = "github", src = "img/github.png") ,
        target = "_Blank"
        ,
        href = "https://github.com/SIMOHANNANI/Racnet"
      ),
    ),)
  ),
  
  # titlePanel("shiny "),
  
)
# define the server logic :
server <- function(input, output) {
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
    rules <-
      apriori(transactions,
              parameter = list(
                support = input$min_supp,
                confidence = input$min_conf
              ))
    return(rules)
  })
  output$graphChart <- renderPlot({
    plot(rules(), method = "graph", )
  })
  output$scatterChart <- renderPlot({
    plot(rules(), col  = rainbow(25), cex  = input$cex)
  })
  output$matrixChart <- renderPlot({
    plot(rules(), method = "matrix", )
  })
  output$frequencychart <- renderPlot({
    transactions = read.transactions(
      file = file(input$file$datapath),
      format = "basket",
      sep = ","
    )
    barplot(itemFrequency(transactions, type = "absolute"))
  })
}

# run the application :
shinyApp(ui = ui, server = server)
