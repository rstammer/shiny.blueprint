library(shiny)
source('ui.R')

pirates_ui <- shinyUI(
  fluidPage(
    head,
    menu,
    flash,
    fluidRow(
      column(12,
        titlePanel("Pirates")
      ),
      column(2,
        dateInput("timeframe_start", "From", value = floor_date(Sys.Date() - 30, "week"))
      ),
      column(2,
        dateInput("timeframe_end", "To", value = floor_date(Sys.Date(), "week"))
      )
    ),
    footer
  )
)
