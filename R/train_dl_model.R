#' Train Deep Learning Model
#'
#' Trains the deep learning model using the h2o package.
#' @param data A dataframe or matrix of input features.
#' @param target The target variable for prediction.
#' @param epochs The number of training epochs.
#' @param l1 The L1 regularization parameter.
#' @param l2 The L2 regularization parameter.
#' @param input_dropout_ratio The dropout ratio for the input layer.
#' @return Trained h2o model.
#' @importFrom h2o h2o.deeplearning
#' @export
train_dl_model <- function(data, target, epochs = 100,
                           l1 = 0.001, l2 = 0.001,
                           input_dropout_ratio = 0.2) {
  h2o.init()
  train_h2o <- as.h2o(data)
  model <- h2o.deeplearning(x = names(data)[-which(names(data) == target)],
                            y = target,
                            training_frame = train_h2o,
                            epochs = epochs,
                            l1 = l1,
                            l2 = l2,
                            input_dropout_ratio = input_dropout_ratio)
  return(model)
}
