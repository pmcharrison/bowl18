expand_harmonics <- function(x, max_freq) {
  UseMethod("expand_harmonics")
}

expand_harmonics.rational_chord <- function(x, max_freq) {
  purrr::map(seq_len(ncol(x)),
             ~ expand_harmonics(fraction(x[, .]), max_freq)) %>%
    Reduce(union, .)
}

expand_harmonics.fraction <- function(x, max_freq) {
  stopifnot(is(max_freq, "fraction"))
  n <- 0L
  res <- new.env()
  while (TRUE) {
    n <- n + 1L
    harmonic <- phonTools::reduce.fraction(x * c(n, 1L))
    if ((harmonic[1] / harmonic[2]) >
        (max_freq[1] / max_freq[2])) break
    res[[as.character(n)]] <- as.character(harmonic)
  }
  res <- as.character(as.list(res))
  names(res) <- NULL
  res
}
