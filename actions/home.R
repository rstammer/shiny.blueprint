home_action <- function(input, output, session) {

  output$keepAlive <- renderText({
    req(input$count)
    paste("keep alive ", input$count)
  })

}
