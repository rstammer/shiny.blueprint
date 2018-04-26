monkeys_action <- function(input, output, session) {

  output$keepAlive <- renderText({
    req(input$count)
    paste("keep alive ", input$count)
  })

  df.bananas <- function(input_env) {
    dates <- seq(as.Date(input_env$timeframe_start), as.Date(input_env$timeframe_end), by = 1)
    types <- replicate(1, sample(c("chimp", "bonobo", "gorilla"), length(dates), rep=TRUE))
    bananas <-replicate(1, sample(1:20, length(dates), rep=TRUE))

    data.frame(dates = dates,
               types = types,
               bananas = bananas)
  }

  output$bananas <- renderPlot({
    input %>%
    df.bananas %>%
    filter(types == input$type) %>%
    group_by(dates) %>%
    summarize(bananas = sum(bananas)) %>%
    ggplot(aes(x = dates,
               y = bananas)) +

    geom_area(position = "stack",
              stat     = "identity",
              alpha    = .8) +

    theme(axis.text.x = element_text(angle = 60,
                                     hjust = 1))
  })
}
