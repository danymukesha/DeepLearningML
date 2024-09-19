test_that("evaluate_models computes AUC correctly", {
  skip_if_not_installed("pROC")

  # Dummy data
  data <- data.frame(x1 = rnorm(100), x2 = rnorm(100), y = sample(0:1, 100, replace = TRUE))
  models <- list(
    rf = train(y ~ ., data = data, method = "rf"),
    svm = train(y ~ ., data = data, method = "svmRadial")
  )

  auc_values <- evaluate_models(models, data, "y")

  expect_length(auc_values, 2)
  expect_true(all(auc_values > 0 & auc_values <= 1))
})
