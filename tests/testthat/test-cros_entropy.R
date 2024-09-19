test_that("cross_entropy computes correct loss", {
  x <- matrix(c(0, 1, 1, 0), nrow = 2)
  z <- matrix(c(0.1, 0.9, 0.8, 0.2), nrow = 2)

  loss <- cross_entropy(x, z)

  epsilon <- 1e-10
  expected_loss <- -sum(x * log(z + epsilon) + (1 - x) * log(1 - z + epsilon)) / nrow(x)
  expect_equal(loss, expected_loss)
})

