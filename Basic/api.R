# Function names do not have to match endpoint name, in fact functions do not need
# to be assigned a name at all as shown by the last function

#* Return the sum of two numbers
#* @serializer unboxedJSON
#' @param y Y param description
#' @param x X param description
#* @post /add
add <- function(x, y){
  return(as.numeric(x) + as.numeric(y))
}

#* Echo back the input
#* @get /echo
#* @param msg The message to echo
echo <- function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @get /plot
#* @png
function(){
  rand <- rnorm(100)
  hist(rand)
}