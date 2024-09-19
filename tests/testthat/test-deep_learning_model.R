test_that("deep_learning_model computes correct activation", {
  x <- matrix(c(1, 2, 3, 4), nrow = 2)
  W <- matrix(c(0.5, 0.5, 0.5, 0.5), nrow = 2)
  b <- c(0, 0)

  y <- deep_learning_model(x, W, b)

  expected_y <- 1 / (1 + exp(-(x %*% W + b)))
  expect_equal(y, expected_y)
})
