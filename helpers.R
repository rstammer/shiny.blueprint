db.env <- function() {
  env = new.env()

  env$user     <- Sys.getenv("DATABASE_USER")
  env$password <- Sys.getenv("DATABASE_PASSWORD")
  env$db_name  <- Sys.getenv("DATABASE_NAME")
  env$host     <- Sys.getenv("DATABASE_HOST")

  env
}

db_connection <- function() {
  db <- db.env()

  dbDriver("PostgreSQL") %>% dbConnect(user     = db$user,
                                       password = db$password,
                                       host     = db$host,
                                       dbname   = db$db_name)
}
