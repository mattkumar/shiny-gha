library(shiny)

# Define UI 
ui <- fluidPage(

    # Application title
    titlePanel("Shiny and GHA"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
           verbatimTextOutput("update"),
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
    
    output$update <- renderText(paste("This app was last updated", Sys.time())
      )
}

# Run the application 
shinyApp(ui = ui, server = server)
