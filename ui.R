library(shiny)
library(shiny.router)

head <- tags$head(
          tags$link(rel  = "stylesheet",
                    type = "text/css",
                    href = "stylesheet.css")
        )

flash <- tags$div(class = "flash",
           textOutput("flash")
				 )

footer <- column(12,
            hr(),
            tags$div(class = "centered",
              "Made with Bananas in Berlin | 2018"
            ),
            HTML(
                "
                <script>
                  var socket_timeout_interval;
                  var n = 0;

                  $(document).on('shiny:idle', function(event) {
                    Shiny.onInputChange('count', n++);
                  });
                </script>
                "
            ),
            tags$div(class = "keep-alive",
              textOutput("keepAlive")
            )
          )

menu <- (
  tags$nav(class = "navbar navbar-dark navbar-fixed-top", role = "navigation",
    tags$div(class = "navbar-header",
      tags$span(class = "navbar-brand",
        "M&P"
      )
    ),
    tags$ul(class="nav navbar-nav",
      tags$li(a(class = "item", href = "/", "Home")),
      tags$li(a(class = "item", href = "/pirates", "Pirates")),
      tags$li(a(class = "item", href = "/monkeys", "Monkeys"))
    )
  )
)

ui <- shinyUI(fluidPage(
  title = "Monkeys & Pirates",
  router_ui()
))
