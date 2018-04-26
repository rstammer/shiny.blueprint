library(shiny.router)

source('uis/home.R')
source('uis/monkeys.R')
source('uis/pirates.R')

source('actions/monkeys.R')
source('actions/pirates.R')

router <- make_router(
  route("/",        home_ui),
  route("/pirates", pirates_ui, pirates_action),
  route("/monkeys", monkeys_ui, monkeys_action)
)
