# bowl18_small_interval
#' @export
bowl18_harmonicity <- function(x, verbose = FALSE, ...) {
  UseMethod("bowl18_harmonicity")
}

#' @export
bowl18_harmonicity.default <- function(x, verbose = FALSE, ...) {
  bowl18_harmonicity(hrep::pi_chord(x), ...)
}

#' @export
bowl18_harmonicity.pi_chord <- function(x, verbose = FALSE, ...) {
  chord <- rationalise_chord(x, verbose)
  fundamental <- gcd(chord, verbose)
  max_freq <- lcm(chord, verbose)
  chord_harmonics <- expand_harmonics(chord, max_freq)
  fundamental_harmonics <- expand_harmonics(fundamental, max_freq)
  mean(fundamental_harmonics %in% chord_harmonics)
}
