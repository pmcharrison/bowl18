lcm <- function(x) {
  UseMethod("lcm")
}

lcm.rational_chord <- function(x) {
  y <- c(numbers::mLCM(x[1, ]),
         numbers::mGCD(x[2, ]))
  fraction(y)
}
