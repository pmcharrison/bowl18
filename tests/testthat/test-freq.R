context("test-freq")

test_that("triads", {
  df <- read.csv(system.file("reformatted-data/triads.csv", package = "bowl18"),
                 stringsAsFactors = FALSE)
  chords <- purrr::pmap(list(df$pc_1, df$pc_2, df$pc_3),
                        ~ hrep::pi_chord(c(..1, ..2, ..3)))
  fr <- purrr::pmap(list(df$f_1, df$f_2, df$f_3),
                      ~ c(..1, ..2, ..3))
  fr_new <- purrr::map(chords, freq) %>%
    purrr::map(~ . * hrep::midi_to_freq(60) / mean(.))

  for (i in seq_along(fr)) {
    expect_equal(fr[i], fr_new[i], tolerance = 1e-2)
  }
})
