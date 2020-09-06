#* @get /data
#* @param msg The message to echo
echo <- function(msg=""){
  values <- c(10,12,22,16,24)
  labels <- c('First','Second','Third','Fourth','Fifth')
  list(values=values,labels=labels)
}


#  Serve index.html
#* @assets ./static /
list()

