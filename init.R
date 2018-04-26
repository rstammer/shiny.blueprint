# Install and load devtools, which provides
# further installation tooling
install.packages("devtools")
library(devtools)


# Packages from GitHub
#
#
devtools::install_github('tidyverse/lubridate')
devtools::install_github('neumanrq/shiny.router')

# CRAN packages
#
#
additional_packages = c("shiny",
                        "RPostgreSQL",
                        "dplyr",
                        "magrittr",
                        "ggplot2",
                        "magrittr")

install_if_missing = function(package) {
  if (package %in% rownames(installed.packages()) == FALSE) {
    install.packages(package, dependencies = TRUE)
  }
  else {
    cat(paste("Skipping already installed package:", package, "\n"))
  }
}

invisible(sapply(additional_packages, install_if_missing))

# local packages
#
# install.packages("/app/PackageName-Version.tar.gz", repos=NULL, type="source")

# Application preparation
#
#

library(shiny)
Sys.setenv(TZ = 'UTC')
