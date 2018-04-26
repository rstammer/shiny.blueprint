library(shiny)
source('ui.R')

home_ui <- shinyUI(
  fluidPage(
    head,
    menu,
    flash,
    fluidRow(
			column(12,
        titlePanel("Monkeys & Pirates"),
        p(class = "centered", "Important insights about hidden relationships between monkeys and pirates.")
      )
    ),
    footer
  )
)
