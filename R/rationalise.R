# These functions assume that we are in the key of C
# (i.e. pitch-class 0 is the tonic).

rational_chord <- function(x) {
  stopifnot(is.matrix(x), is.numeric(x), nrow(x) == 2L)
  class(x) <- "rational_chord"
  x
}

rationalise_chord <- function(x, tonic) {
  UseMethod("rationalise_chord")
}

rationalise_chord.pi_chord <- function(x, tonic) {
  x <- hrep::tp(x, - tonic)
  octave <- floor(hrep::get_bass_pi(x) / 12)
  x <- hrep::tp(x, - 12 * octave)
  sapply(x, rationalise_pitch) %>% rational_chord
}

rationalise_pitch <- function(x) {
  checkmate::qassert(x, "X1")
  octave <- floor(x / 12)
  pitch_class <- x %% 12
  fraction <- rationalise_pitch_class(pitch_class)
  while (octave != 0) {
    if (octave < 0) {
      fraction <- half(fraction)
      octave <- octave + 1L
    } else if (octave > 0) {
      fraction <- double(fraction)
      octave <- octave - 1L
    }
  }
  fraction
}

rationalise_pitch_class <- function(pc) {
  checkmate::qassert(pc, "X1[0,12)")
  fraction(rational_scale[, pc + 1L])
}
