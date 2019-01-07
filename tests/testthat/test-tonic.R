context("test-tonic")

test_that("examples", {
  expect_gt(gill09_harmonicity(c(0, 4, 7) + 0),
            gill09_harmonicity(c(0, 4, 7) + 2))

  expect_equal(gill09_harmonicity(c(0, 4, 7) + 0),
               gill09_harmonicity(c(0, 4, 7) + 2, tonic = 2))

  for (i in seq_len(10)) {
    tonic <- sample(11, 1)
    x1 <- sample(40, size = 3) %>% hrep::pi_chord()
    x2 <- x1 + tonic
    expect_equal(
      gill09_harmonicity(x1),
      gill09_harmonicity(x2, tonic = tonic)
    )
  }
})
