#' Train Machine Learning Models
#'
#' Trains multiple machine learning models using the caret package.
#' @param data A dataframe or matrix of input features.
#' @param target The target variable for prediction.
#' @return List of trained models.
#' @import caret
#' @export
train_ml_models <- function(data, target) {
  control <- trainControl(method = "cv", number = 10)
  models <- list()
  models$rf <- train(
    as.formula(paste(target, "~ .")),
    data = data,
    method = "rf",
    trControl = control
  )
  models$svm <- train(
    as.formula(paste(target, "~ .")),
    data = data,
    method = "svmRadial",
    trControl = control
  )
  models$rpart <- train(
    as.formula(paste(target, "~ .")),
    data = data,
    method = "rpart",
    trControl = control
  )
  #models$lda <- train(
  #  as.formula(paste(target, "~ .")),
  #  data = data,
  #  method = "lda",
  #  trControl = control
  #)
  models$gbm <- train(
    as.formula(paste(target, "~ .")),
    data = data,
    method = "gbm",
    trControl = control
  )
  return(models)
}
