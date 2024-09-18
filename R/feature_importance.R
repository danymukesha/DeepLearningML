#' Feature Importance
#'
#' Ranks the features based on their importance in the trained models.
#' @param model A trained model.
#' @return A dataframe of feature importance.
#' @import caret
#' @export
feature_importance <- function(model) {
  importance <- varImp(model)
  return(importance)
}
