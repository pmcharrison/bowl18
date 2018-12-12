lcm <- function(x, verbose = FALSE) {
  UseMethod("lcm")
}

lcm.rational_chord <- function(x, verbose = FALSE) {
  y <- c(numbers::mLCM(x[1, ]),
         numbers::mGCD(x[2, ]))
  y <- fraction(y)
  if (verbose) message("- Maximum frequency: ", paste0(y[1], "/", y[2]), ".")
  y
}
