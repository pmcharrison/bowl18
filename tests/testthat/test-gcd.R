context("test-gcd")

test_that("examples", {
  x <- rational_chord(matrix(c(4, 5, 6,
                               1, 1, 1),
                             nrow = 2, byrow = TRUE))
  expect_equal(bowl18:::gcd(x), fraction(c(1, 1)))

  x <- rational_chord(matrix(c(3, 4, 5,
                               2, 3, 4),
                             nrow = 2, byrow = TRUE))

  expect_equal(bowl18:::gcd(x), fraction(c(1, 12)))
})
