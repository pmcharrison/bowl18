#' @export
bowl18_harmonicity <- function(x) {
  UseMethod("bowl18_harmonicity")
}

#' @export
bowl18_harmonicity.default <- function(x) {
  bowl18_harmonicity(hrep::pi_chord(x))
}

#' @export
bowl18_harmonicity.pi_chord <- function(x) {
  chord <- rationalise_chord(x)
  fundamental <- gcd(chord)
  max_freq <- lcm(chord)
  chord_harmonics <- expand_harmonics(chord, max_freq)
  fundamental_harmonics <- expand_harmonics(fundamental, max_freq)
  mean(fundamental_harmonics %in% chord_harmonics)
}
