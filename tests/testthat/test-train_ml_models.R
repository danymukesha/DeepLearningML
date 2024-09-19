test_that("train_ml_models trains multiple models", {
  skip_if_not_installed("caret")

  # Create some dummy data
  data <- data.frame(x1 = rnorm(100), x2 = rnorm(100), y = sample(0:1, 100, replace = TRUE))

  models <- train_ml_models(data, "y")

  expect_true("rf" %in% names(models))
  expect_true("svm" %in% names(models))
  expect_true("rpart" %in% names(models))
  expect_true(is(models$rf, "train"))
  expect_true(is(models$svm, "train"))
  expect_true(is(models$rpart, "train"))
})
