# load the model
source("model.R")

#* @get /predict
#* @serializer unboxedJSON
get_predict_petal_length <- function(petal_width=1){
    # convert the input to a number
    petal_width <- as.numeric(petal_width)
    # create the prediction data frame
    input_data <- data.frame(Petal.Width=as.numeric(petal_width))
    # create the prediction
    predicted_length <- predict(model,input_data)
    list(predicted_length=predicted_length)
}

