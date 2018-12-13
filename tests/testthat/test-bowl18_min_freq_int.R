context("test-bowl18_min_freq_dist")

test_that("regression tests: dyads", {
  df <- read.csv(system.file("reformatted-data/dyads.csv", package = "bowl18"),
                 stringsAsFactors = FALSE)
  fr <- purrr::pmap(list(df$f_1, df$f_2),
                    ~ hrep::fr_chord(c(..1, ..2)))
  min_fr_int_old <- df$bowling_min_freq_int
  min_fr_int_new <- purrr::map_dbl(fr, bowl18_min_freq_dist)

  for (i in seq_along(fr)) {
    expect_equal(min_fr_int_old[i],
                 min_fr_int_new[i])
  }
})

test_that("regression tests: triads", {
  df <- read.csv(system.file("reformatted-data/triads.csv", package = "bowl18"),
                 stringsAsFactors = FALSE)
  fr <- purrr::pmap(list(df$f_1, df$f_2, df$f_3),
                    ~ hrep::fr_chord(c(..1, ..2, ..3)))
  min_fr_int_old <- df$bowling_min_freq_int
  min_fr_int_new <- purrr::map_dbl(fr, bowl18_min_freq_dist)

  for (i in seq_along(fr)) {
    expect_equal(min_fr_int_old[i],
                 min_fr_int_new[i])
  }
})

test_that("regression tests: tetrads", {
  df <- read.csv(system.file("reformatted-data/tetrads.csv", package = "bowl18"),
                 stringsAsFactors = FALSE)
  fr <- purrr::pmap(list(df$f_1, df$f_2, df$f_3, df$f_4),
                    ~ hrep::fr_chord(c(..1, ..2, ..3, ..4)))
  min_fr_int_old <- df$bowling_min_freq_int
  min_fr_int_new <- purrr::map_dbl(fr, bowl18_min_freq_dist)

  for (i in seq_along(fr)) {
    expect_equal(min_fr_int_old[i],
                 min_fr_int_new[i])
  }
})
