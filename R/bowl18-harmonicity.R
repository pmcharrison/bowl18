#' Harmonicity
#'
#' Computes the harmonicity of a chord using the algorithm of
#' Bowling et al. (2018).
#' The algorithm assumes that chord pitches are precisely
#' tuned to the just-tuned scale provided by Bowling et al. (2018).
#' @param x Chord to analyse.
#' The default method assumes that the chord is expressed
#' as a numeric vector of MIDI note numbers.
#' This can be made explicit by using the \code{\link[hrep:pi_chord]{pi_chord}}
#' function from the \code{hrep} package.
#' @return (Numeric scalar)
#' The chord's harmonicity, defined as the proportion of harmonics
#' of the chord's fundamental frequency that coincide with the
#' harmonics of the chord tones.
#' @references
#' \insertRef{Bowling2018}{bowl18}
#' @rdname bowl18_harmonicity
#' @examples bowl18_harmonicity(hrep::pi_chord(c(60, 64, 67)))
#' @export
bowl18_harmonicity <- function(x) {
  UseMethod("bowl18_harmonicity")
}

#' @rdname bowl18_harmonicity
#' @method bowl18_harmonicity default
#' @export
bowl18_harmonicity.default <- function(x) {
  bowl18_harmonicity(hrep::pi_chord(x))
}

#' @rdname bowl18_harmonicity
#' @method bowl18_harmonicity pi_chord
#' @export
bowl18_harmonicity.pi_chord <- function(x) {
  chord <- rationalise_chord(x)
  fundamental <- gcd(chord)
  max_freq <- lcm(chord)
  chord_harmonics <- expand_harmonics(chord, max_freq)
  fundamental_harmonics <- expand_harmonics(fundamental, max_freq)
  mean(fundamental_harmonics %in% chord_harmonics)
}
