library(shiny)
library(shiny.router)
library(magrittr)
library(RPostgreSQL)
library(ggplot2)
library(dplyr)
library(magrittr)
library(lubridate)

source('helpers.R')
source('routes.R')
source('ui.R')
source('global.R')

server <- shinyServer(function(input, output, session) {
  session$userData$token <- Sys.getenv("USER_TOKEN")
  global$authenticated   <- FALSE

  if (!(global$authenticated == TRUE)) {
    insertUI(selector = "#login", ui = not_authenticated)
  }

  observeEvent(input$login, {
    if (!(global$authenticated == TRUE)) {
      global$authenticated <- (input$login == session$userData$token)
    }

    if (global$authenticated == TRUE) {
      removeUI(selector = "#login", immediate = TRUE)
      router(input, output)
    }
  })
})
