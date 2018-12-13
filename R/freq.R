freq <- function(x) {
  UseMethod("freq")
}

freq.pi_chord <- function(x) {
  ratios <- rationalise_chord(x)
  bass_freq <- hrep::midi_to_freq(x[1])
  bass_freq * ratios[1, ] / ratios[2, ]
}
