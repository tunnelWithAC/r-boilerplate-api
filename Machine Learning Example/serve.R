library(plumber)
r <- plumb("api.R")
r$run(port=8008)

