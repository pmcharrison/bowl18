fraction <- function(x, ...) {
  UseMethod("fraction")
}

fraction.numeric <- function(x, ...) {
  checkmate::qassert(x, "X2")
  class(x) <- "fraction"
  x
}

as.character.fraction <- function(x, ...) {
  paste0(x[1], "/", x[2])
}

half <- function(x) {
  UseMethod("half")
}

half.fraction <- function(x) {
  if (x[1] %% 2L == 0L) x[1] <- x[1] / 2L else x[2] <- x[2] * 2L
  x
}

double <- function(x) {
  UseMethod("double")
}

double.fraction <- function(x) {
  if (x[2] %% 2L == 0L) x[2] <- x[2] / 2L else x[1] <- x[1] * 2L
  x
}
