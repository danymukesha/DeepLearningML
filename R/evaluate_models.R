#' Evaluate Models
#'
#' Evaluates the performance of models using ROC and AUC.
#' @param models List of trained models.
#' @param data The test data.
#' @param target The target variable in the test data.
#' @return AUC values for each model.
#' @importFrom pROC roc auc
#' @export
evaluate_models <- function(models, data, target) {
  auc_values <- sapply(models, function(model) {
    preds <- predict(model, data)
    roc_obj <- roc(data[[target]], preds)
    return(auc(roc_obj))
  })
  return(auc_values)
}
