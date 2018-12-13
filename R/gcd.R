gcd <- function(x) {
  UseMethod("gcd")
}

gcd.rational_chord <- function(x) {
  y <- c(numbers::mGCD(x[1, ]),
         numbers::mLCM(x[2, ]))
  fraction(y)
}
