library(shiny)
library(bootstraplib)
bs_theme_new(bootswatch = "sketchy")
# define the UI :
ui <- fluidPage(
    theme = 'stylesheet.css',
    windowTitle = "NOAA",
    title = tags$head(
        # tags$link(rel="shortcut icon", 
        # href="https://fontawesome.com/icons/registered?style=solid", 
        # type="image/vnd.microsoft.icon"),
        tags$link(rel="stylesheet", 
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css", 
        type="image/vnd.microsoft.icon")
        ),
    bootstrap(), 
    tags$div(class="container"),
    ## Logo for my website :
    navbarPage(title = tagList(img(src="img/github.png",height="45px"),),

       tabPanel("Home",icon = icon("home")),
       tabPanel("About",icon = icon("address-card")),
       tabPanel(
           div(
               id = "img-id",
               a(img(id = "github",src = "img/github.png") ,target="_Blank",href="https://github.com/SIMOHANNANI/ACNet"),
           ),
       )
    ),
    
   
    titlePanel("shiny "),
    sidebarLayout(
        sidebarPanel("this the sidebar"),
        mainPanel(
            tabsetPanel(
                tabPanel(title = "Getting the data",icon = icon("database"), plotOutput("plot")), 
                tabPanel(title = "Viewing the data",icon = icon("eye"), verbatimTextOutput("summary")), 
                tabPanel(title = "visualizing the data",icon = icon("chart-bar"), tableOutput("table"))
            )
        ),
    )
)
# define the server logic :
server <- function(input, output){
    
}
shinyApp(ui = ui, server = server)
