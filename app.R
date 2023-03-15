library(shiny)
library(bslib)
library(bsicons)
library(dplyr)
library(readr)

ui <- page_fluid(
  theme = bslib::bs_theme(
    base_font = font_google("Atkinson Hyperlegible")
  ),
  br(),
  layout_column_wrap(
    width = "200px",
    class = "mt-3",
    value_box(
      title = "Deploy",
      p("This app was automatically deployed to shinyapps.io from github using GHA"),
      showcase = bsicons::bs_icon("cloud-upload-fill", size = "100%"),
      full_screen = TRUE
    ),
    value_box(
      title = "Source",
      p("This app github repo is located", strong(a(href = "https://github.com/mattkumar/shiny-gha", "here"))),
      showcase = bsicons::bs_icon("github", size = "100%"),
      full_screen = TRUE,
      theme_color = "success"
    ),
    value_box(
      title = "Update",
      value = textOutput("date"),
      showcase = bsicons::bs_icon("calendar-week", size = "100%"),
      full_screen = TRUE,
      theme_color = "danger"
    )
  )
)

server <- function(input, output) {
  
  output$date <- renderText({
    
    last_time <- readr::read_csv("time.csv") %>%
      slice_tail() %>%
      pull(time)
    
    paste0("This app was last deployed on ", last_time)
  })
}

shinyApp(ui, server)
