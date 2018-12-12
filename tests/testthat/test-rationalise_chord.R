context("test-rationalise_chord")

test_that("examples", {
  expect_equal(
    rationalise_chord(hrep::pi_chord(c(0, 4, 7))),
    rational_chord(matrix(c(1, 5, 3,
                            1, 4, 2),
                          nrow = 2, byrow = TRUE))
  )

  expect_equal(
    rationalise_chord(hrep::pi_chord(c(60, 64, 67))),
    rational_chord(matrix(c(1, 5, 3,
                            1, 4, 2),
                          nrow = 2, byrow = TRUE))
  )

  expect_equal(
    rationalise_chord(hrep::pi_chord(c(60, 64, 67 + 12))),
    rational_chord(matrix(c(1, 5, 3,
                            1, 4, 1),
                          nrow = 2, byrow = TRUE))
  )
})
