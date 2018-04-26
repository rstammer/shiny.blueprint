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

  entered_password <- parseQueryString(isolate(session$clientData$url_search))["token"] %>% toString
  token            <- Sys.getenv("USER_TOKEN")

  if (entered_password == token) {
    # Here you might establish a db connection
    # global$db <- db_connection()
    router(input, output)
  } else {
    output$flash <- renderText({ "Authentication failed" })
  }

})
