library(shiny.router)

source('uis/home.R')
source('uis/monkeys.R')
source('uis/pirates.R')
source('uis/logout.R')

source('actions/home.R')
source('actions/monkeys.R')
source('actions/pirates.R')
source('actions/logout.R')

router <- make_router(
  route("/",        home_ui,    home_action),
  route("pirates", pirates_ui, pirates_action),
  route("monkeys", monkeys_ui, monkeys_action),
  route("logout",  logout_ui,  logout_action)
)
