context("test-rational_pitch_class")

test_that("examples", {
  expect_equal(rationalise_pitch_class(0), fraction(c(1, 1)))
  expect_equal(rationalise_pitch_class(7), fraction(c(3, 2)))
})
