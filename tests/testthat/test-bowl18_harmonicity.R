context("test-bowl18_harmonicity")

test_that("regression tests: dyads", {
  df <- read.csv(system.file("reformatted-data/dyads.csv", package = "bowl18"),
                 stringsAsFactors = FALSE)
  chords <- purrr::pmap(list(df$pc_1, df$pc_2), ~ hrep::pi_chord(c(..1, ..2)))

  for (i in seq_along(chords)) {
    expect_equal(df$bowling_harm_sim[i],
                 bowl18_harmonicity(chords[[i]]),
                 tolerance = 1e-3)
  }
})

test_that("regression tests: triads", {
  df <- read.csv(system.file("reformatted-data/triads.csv", package = "bowl18"),
                 stringsAsFactors = FALSE)
  chords <- purrr::pmap(list(df$pc_1, df$pc_2, df$pc_3),
                        ~ hrep::pi_chord(c(..1, ..2, ..3)))

  set.seed(1)
  ind <- sample(length(chords), size = 20L)
  for (i in ind) {
    expect_equal(df$bowling_harm_sim[i],
                 bowl18_harmonicity(chords[[i]]),
                 tolerance = 1e-3)
  }
})

test_that("regression tests: tetrads", {
  df <- read.csv(system.file("reformatted-data/tetrads.csv", package = "bowl18"),
                 stringsAsFactors = FALSE)
  chords <- purrr::pmap(list(df$pc_1, df$pc_2, df$pc_3, df$pc_4),
                        ~ hrep::pi_chord(c(..1, ..2, ..3, ..4)))

  set.seed(1)
  ind <- sample(length(chords), size = 20L)
  for (i in ind) {
    expect_equal(df$bowling_harm_sim[i],
                 bowl18_harmonicity(chords[[i]]),
                 tolerance = 1e-3)
  }
})
