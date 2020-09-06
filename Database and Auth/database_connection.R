library(RPostgreSQL)
library(dplyr)
library(dbplyr)

user = Sys.getenv("DB_USER")
password = Sys.getenv("DB_PASSWORD")
dbname = Sys.getenv("DB_NAME")
host = Sys.getenv("DB_HOST")
port = Sys.getenv("DB_PORT")

dbConnection <- function(.) {
  # create a connection
  # loads the PostgreSQL driver
  drv <- PostgreSQL()
  
  # optional - close existing connections
  all_cons <- dbListConnections(PostgreSQL())
  for(con in all_cons)
    dbDisconnect(con)
  
  print(paste(length(all_cons), " connections killed."))
  
  # creates a connection to the postgres database
  # note that "con" will be used later in each connection to the database
  con = dbConnect(drv, 
      dbname = dbname,
      host = host,
      port = port,
      user = user,
      password = pw
    )
  
  all_cons <- dbListConnections(PostgreSQL())
  print(all_cons)
  return(con)
}

#' @serializer unboxedJSON
#' @get /db
db_example <- function(my_event_id, con) {
  con = dbConnection()
  # on.exit(dbDisconnect(con))
  res <- tbl(con, "tweet") %>%
    collect()
  
  r <- as.data.frame(res) %>% tbl_df
  dbDisconnect(con)
  return(list(result=r))
  
}


dbSafeNames = function(names) {
  names = gsub('[^a-z0-9]+','_',tolower(names))
  names = make.names(names, unique=TRUE, allow_=TRUE)
  names = gsub('.','_',names, fixed=TRUE)
  names
}
# colnames(iris) = dbSafeNames(colnames(iris))

#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  plumber::forward()
}
