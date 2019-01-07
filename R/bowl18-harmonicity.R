#' Harmonicity
#'
#' Computes the harmonicity of a chord using the
#' percentage similarity measure of Gill & Purves (2009).
#'
#' @details
#' This percentage similarity measure corresponds to the percentage of the harmonics
#' that the chord holds in common with a harmonic series rooted on
#' the chord's fundamental frequency.
#'
#' While \insertCite{Gill2009;textual}{bowl18} originally presented this measure
#' to quantify the harmonicity of two-note chords (dyads)
#' \insertCite{Bowling2018;textual}{bowl18} subsequently demonstrated the application
#' of this measure to chords of arbitrary sizes.
#'
#' @note
#' The algorithm assumes that chord pitches are precisely
#' tuned to the just-tuned scale provided by Bowling et al. (2018).
#' This scale can be found at \code{\link{rational_scale}}.
#'
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
#' gill09_harmonicity(c(60, 64, 67))
#' gill09_harmonicity("60 64 67")
#' gill09_harmonicity(hrep::pi_chord(c(60, 64, 67)))
#' @export
gill09_harmonicity <- function(x, tonic = 0L) {
  checkmate::qassert(tonic, "X1")
  x <- hrep::pi_chord(x)
  chord <- rationalise_chord(x, tonic)
  fundamental <- gcd(chord)
  max_freq <- lcm(chord)
  chord_harmonics <- expand_harmonics(chord, max_freq)
  fundamental_harmonics <- expand_harmonics(fundamental, max_freq)
  mean(fundamental_harmonics %in% chord_harmonics)
}
