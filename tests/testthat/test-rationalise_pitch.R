context("test-rational_pitch")

test_that("examples", {
  expect_equal(rationalise_pitch(7), fraction(c(3, 2)))
  expect_equal(rationalise_pitch(0), fraction(c(1, 1)))
  expect_equal(rationalise_pitch(12), fraction(c(2, 1)))
  expect_equal(rationalise_pitch(12 + 7), fraction(c(3, 1)))
  expect_equal(rationalise_pitch(12 + 6), fraction(c(14, 5)))
})
