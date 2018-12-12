gcd <- function(x, verbose = FALSE) {
  UseMethod("gcd")
}

gcd.rational_chord <- function(x, verbose = FALSE) {
  y <- c(numbers::mGCD(x[1, ]),
         numbers::mLCM(x[2, ]))
  y <- fraction(y)
  if (verbose) message("- Fundamental frequency: ",
                       paste0(y[1], "/", y[2]), ".")
  y
}
