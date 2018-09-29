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
      tags$li(a(class = "item", href = route_link("pirates"), "Pirates")),
      tags$li(a(class = "item", href = route_link("monkeys"), "Monkeys")),
      tags$li(a(class = "item", href = route_link("logout"), "Logout"))
    )
  )
)

not_authenticated <- (
  fluidPage(
    head,
    tags$nav(class = "navbar navbar-dark navbar-fixed-top", role = "navigation",
      tags$div(class = "navbar-header",
        tags$span(class = "navbar-brand",
          "M&P"
        )
      )
    ),
    tags$div(class = "flash",
      "Restricted Access. Please login."
    ),
    fluidRow(
			column(12,
        tags$div(class = 'centered login',
          wellPanel(
            textInput("login", label = "Login")
          )
        )
      )
    )
  )
)

ui <- shinyUI(
        fluidPage(
          title = "Monkeys & Pirates",
          tags$div(id = 'login'),
          router_ui()
        )
      )
