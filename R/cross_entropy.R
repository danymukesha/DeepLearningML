#' Cross Entropy Loss
#'
#' Calculates the cross entropy loss between the input and output layers.
#' @param x The input data.
#' @param z The predicted output data.
#' @return Cross entropy value.
#' @export
cross_entropy <- function(x, z) {
  epsilon <- 1e-10
  loss <- -sum(x * log(z + epsilon) + (1 - x) * log(1 - z + epsilon)) / nrow(x)
  return(loss)
}
