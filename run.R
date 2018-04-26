library(shiny)

port <- Sys.getenv('PORT')
gobal <- new.env()

shiny::runApp(
  appDir = "~/",
  host = '0.0.0.0',
  port = as.numeric(port)
)
