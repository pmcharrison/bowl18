#' @export
bowl18_min_freq_int <- function(x) {
  UseMethod("bowl18_min_freq_int")
}

#' @export
bowl18_min_freq_int.default <- function(x) {
  bowl18_min_freq_int(hrep::fr_chord(x))
}

#' @export
bowl18_min_freq_int.fr_chord <- function(x) {
  if (length(x) < 2L)
    as.numeric(NA) else
      min(diff(as.numeric(x)))
}
