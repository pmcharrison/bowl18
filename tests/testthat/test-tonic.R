context("test-tonic")

test_that("examples", {
  expect_gt(bowl18_harmonicity(c(0, 4, 7) + 0),
            bowl18_harmonicity(c(0, 4, 7) + 2))

  expect_equal(bowl18_harmonicity(c(0, 4, 7) + 0),
               bowl18_harmonicity(c(0, 4, 7) + 2, tonic = 2))

  for (i in seq_len(10)) {
    tonic <- sample(11, 1)
    x1 <- sample(40, size = 3) %>% hrep::pi_chord()
    x2 <- x1 + tonic
    expect_equal(
      bowl18_harmonicity(x1),
      bowl18_harmonicity(x2, tonic = tonic)
    )
  }
})
