#' Harmonicity
#'
#' Computes the harmonicity of a chord using the algorithm of
#' Bowling et al. (2018).
#' The algorithm assumes that chord pitches are precisely
#' tuned to the just-tuned scale provided by Bowling et al. (2018).
#' @param x Chord to analyse,
#' expressed as an integerish vector of MIDI note numbers,
#' or more generally as any valid input to \code{\link[hrep:pi_chord]{pi_chord}}.
#' @param tonic (Integerish scalar, default = 0L)
#' Tonic to use when defining the just-tuned scale.
#' @return (Numeric scalar)
#' The chord's harmonicity, defined as the proportion of harmonics
#' of the chord's fundamental frequency that coincide with the
#' harmonics of the chord tones.
#' @references
#' \insertRef{Bowling2018}{bowl18}
#' @examples
#' bowl18_harmonicity(c(60, 64, 67))
#' bowl18_harmonicity("60 64 67")
#' bowl18_harmonicity(hrep::pi_chord(c(60, 64, 67)))
#' @export
bowl18_harmonicity <- function(x, tonic = 0L) {
  checkmate::qassert(tonic, "X1")
  x <- hrep::pi_chord(x)
  chord <- rationalise_chord(x, tonic)
  fundamental <- gcd(chord)
  max_freq <- lcm(chord)
  chord_harmonics <- expand_harmonics(chord, max_freq)
  fundamental_harmonics <- expand_harmonics(fundamental, max_freq)
  mean(fundamental_harmonics %in% chord_harmonics)
}
