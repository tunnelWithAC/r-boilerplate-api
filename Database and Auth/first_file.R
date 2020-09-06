library(openssl)
library(jose)

# Enable Cross-origin Resource Sharing

#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  plumber::forward()
}


#* @get /login
login <- function(username="",password="") {
  if(username=="admin" && password=="1234") {
    # Create a JSON Web Token
    claim <- jwt_claim(username = username, session_key = 123456)
    key <- charToRaw("SuperSecret")
    jwt <- jwt_encode_hmac(claim, secret = key)
    list(token=jwt)
  } else {
    # Failed log in logic here
    list(message="Failed to log in")
  }
}
