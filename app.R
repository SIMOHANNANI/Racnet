library(shiny)
library(bootstraplib)
bs_theme_new(bootswatch = "sketchy")
# define the UI :
ui <- fluidPage(
    titlePanel(
        windowTitle = "Racnet",
        title = tags$head(tags$link(rel="shortcut icon",
                                    href="img/favicon.png",
        ))),
  theme = 'stylesheet.css',
  windowTitle = "NOAA",
  title = tags$head(
    tags$link(rel="stylesheet",
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css",
              type="image/vnd.microsoft.icon")
  ),
  bootstrap(),
  tags$div(class="container"),
  ## Logo for my website :
  navbarPage(title = tagList(a(img(src="img/logo.jpeg",height="50px"),target="_Blank",
                               href="https://racnet.shinyapps.io/racnet/"),),

             tabPanel("Home",icon = icon("home","fa-2x"),),
             tabPanel("About",icon = icon("address-card","fa-2x")),
             tabPanel(
               div(
                 id = "img-id",
                 a(img(id = "github",src = "img/github.png") ,target="_Blank"
                   ,href="https://github.com/SIMOHANNANI/ACNet"),
               ),
             )
  ),


  # titlePanel("shiny "),
  sidebarLayout(
    sidebarPanel(h1("APRIORI INPUTS"),id="panelTitle"
                 ,hr(),
                 numericInput("n", "Control the number of row to display", value = 5, min = 1, step = 1),
                 hr()
                 ),
                
    
    mainPanel(
      tabsetPanel(
        tabPanel(title = "Getting the data",icon = icon("database"),
                   tags$div(id="uploadFiles",
                            fileInput("file", "Choose CSV File",
                                      multiple = TRUE,
                                      accept = c("text/csv",
                                                 "text/comma-separated-values,text/plain",
                                                 ".csv"))
                   )

                 ),
        tabPanel(title = "Viewing the data",icon = icon("eye"),
                 mainPanel(tableOutput("Viewing_the_data"))),
        tabPanel(title = "visualizing the data",icon = icon("chart-bar"),
                 tableOutput("visualizing_the_data"))
      )
    ),
  )
)
# define the server logic :
server <- function(input, output){
  data <- reactive({
    req(input$file)
    
    ext <- tools::file_ext(input$file$name)
    switch(ext,
           csv = vroom::vroom(input$file$datapath, delim = ","),
           tsv = vroom::vroom(input$file$datapath, delim = "\t"),
           validate("Invalid file; Please upload a .csv or .tsv file")
    )
  })
  
  output$Viewing_the_data <- renderTable({
    head(data(), input$n)
  })
}
shinyApp(ui = ui, server = server)




























# library(shinydashboard)
# # user interface :
# 
# ui <- dashboardPage(
#   # dashboard header :
#   dashboardHeader(title="Racnet"),
#   # dashboard sidebar:
#   dashboardSidebar(
#     sidebarMenu(
#       menuItem("Getting the data",tabName ="Getting_the_data" ,icon = icon("database")),
#       menuItem("Viewing the data",tabName ="Viewing_the_data" ,icon = icon("eye")),
#       menuItem("visualizing the data",tabName ="visualizing_the_data" ,icon = icon("chart-bar"))
#       # menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
#       # menuItem("Widgets", tabName = "widgets", icon = icon("th"))
#     )
#   ),
#   # dashboard body :
#   dashboardBody(
#     # tabItems(
#     #   tabItem(
#     #     tabName = "Getting_the_data",
#     #     fluidRow(
#     #       box(plotOutput("plot1", height = 250)),
#     #       
#     #       box(
#     #         title = "Controls",
#     #         sliderInput("slider", "Number of observations:", 1, 100, 50)
#     #       )
#     #     )
#     #   ),
#     #   tabItem(
#     #     tabName = "Viewing_the_data",
#     #     fluidRow(
#     #       box(plotOutput("plot1", height = 250)),
#     #       
#     #       box(
#     #         title = "Controls",
#     #         sliderInput("slider", "Number of observations:", 1, 100, 50)
#     #       )
#     #     )
#     #   ),
#     #   tabItem(
#     #     tabName = "visualizing_the_data",
#     #     fluidRow(
#     #       box(plotOutput("plot1", height = 250)),
#     #       
#     #       box(
#     #         title = "Controls",
#     #         sliderInput("slider", "Number of observations:", 1, 100, 50)
#     #       )
#     #     )
#     #   ),
#     # )
#     tabItems(
#       # First tab content
#       tabItem(tabName = "Getting_the_data",
#           fluidRow(
#             box(
#               fileInput("uplaodFile", "Upload Files:", multiple = T, 
#                         accept = c(".xls", "text/csv", "text/comma-separated-values, text/plain", ".csv")),
#               helpText(paste("Please upload a file.  Supported file types are:  .txt, .csv and .xls"))
#             )
#           )
#       ),
#       
#       # Second tab content
#       tabItem(
#           tabName = "Viewing_the_data",
#           mainPanel(
#             tableOutput("Viewing_the_data")
#           )
#       ),
#       tabItem(
#         tabName = "visualizing_the_data",
#         fluidRow(
#           box(
#             title = "Controls",
#             sliderInput("slider", "Number of observations:", 1, 100, 50)
#           )
#           
#         )
#       )
#     )
#     
#   )
# )
# 
# # server logic:
# server <- function (input,output){
#   output$Viewing_the_data <- renderTable({
#     req(input$uplaodFile)
#     read.csv(input$uplaodFile$datapath)
#     
#   })
# }
# # running the app :
# shinyApp(ui,server)





























