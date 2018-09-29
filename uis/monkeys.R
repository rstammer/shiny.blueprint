library(shiny)
source('ui.R')
source('helpers.R')

monkeys_ui <- shinyUI(
  fluidPage(
    head,
    menu,
    flash,
    fluidRow(
      column(12,
        titlePanel("Monkeys")
      ),
      column(2,
        dateInput("timeframe_start", "From", value = floor_date(Sys.Date() - 30, "week"))
      ),
      column(2,
        dateInput("timeframe_end", "To", value = floor_date(Sys.Date(), "week"))
      ),
      column(2,
        selectInput(
          "type",
          "Type",
          list(
            "Chimp" = "chimp",
            "Bonobo" = "bonobo",
            "Gorilla" = "gorilla"
          ),
          selected = "Chimp",
          multiple = FALSE,
          selectize = TRUE,
          width = NULL,
          size = NULL
        )
      ),
      column(12,
        tags$h3("Bananas per week"),
        withSpinner(plotOutput("bananas"))
      )
    ),
    footer
  )
)
