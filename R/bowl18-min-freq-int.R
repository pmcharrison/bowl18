#' Minimum frequency distance
#'
#' This function returns the minimum distance between
#' the fundamental frequencies of a chord,
#' after Bowling et al. (2018).
#' It makes no assumptions about the chord's tuning.
#' @param x Chord to analyse.
#' The default method assumes that the chord is expressed
#' as a numeric vector of frequencies.
#' This can be made explicit by using the \code{\link[hrep:pi_chord]{fr_chord}}
#' function from the \code{hrep} package.
#' @return (Numeric scalar)
#' The minimum distance between the fundamental frequencies of the chord,
#' in Hz.
#' @references
#' \insertRef{Bowling2018}{bowl18}
#' @rdname bowl18_min_freq_dist
#' @examples bowl18_min_freq_dist(hrep::fr_chord(c(220, 440, 560)))
#' @export
bowl18_min_freq_dist <- function(x) {
  UseMethod("bowl18_min_freq_dist")
}

#' @rdname bowl18_min_freq_dist
#' @export
bowl18_min_freq_dist.default <- function(x) {
  bowl18_min_freq_dist(hrep::fr_chord(x))
}

#' @rdname bowl18_min_freq_dist
#' @export
bowl18_min_freq_dist.fr_chord <- function(x) {
  if (length(x) < 2L)
    as.numeric(NA) else
      min(diff(as.numeric(x)))
}
