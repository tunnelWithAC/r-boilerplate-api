#* @filter cors_message
function() {
  print("I'm missing CORS!")
  plumber::forward()
}

#### Specifying input data type ####

#* @get /user_id/<id:int>
function(id){
  list(id=id, data_type=typeof(id))
}

#* @get /user_name/<name:character>
function(name){
  list(name=name, data_type=typeof(name))
}
