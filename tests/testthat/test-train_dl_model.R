test_that("train_dl_model trains a deep learning model", {
  skip_if_not_installed("h2o")
  skip()

  # Load required package
  library(h2o)
  h2o.init()

  # Create some dummy data
  data <- data.frame(x1 = rnorm(100), x2 = rnorm(100), y = sample(0:1, 100, replace = TRUE))

  # Train model
  model <- train_dl_model(data, "y", epochs = 1)

  expect_true(is(model, "H2ODeepLearningModel"))

  h2o.shutdown(prompt = FALSE)
})
