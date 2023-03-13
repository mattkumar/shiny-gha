library(shiny)
library(bslib)
library(bsicons)

ui <- page_fluid(
  theme = bslib::bs_theme(
    base_font = font_google("Atkinson Hyperlegible")
  ),
  br(),
  layout_column_wrap(
    width = "300px",
    class = "mt-3",
    value_box(
      title = "Shiny and GHA",
      value = textOutput("date"),
      br(),
      em(p("This app was automatically deployed to shinyapps.io using GHA")),
      showcase = bsicons::bs_icon("cloud-upload-fill", size = "100%"),
      full_screen = TRUE
    )
  )
)

server <- function(input, output) {
  output$date <- renderText({
    paste0("Last updated: ", Sys.time())
  })
}

shinyApp(ui, server)
