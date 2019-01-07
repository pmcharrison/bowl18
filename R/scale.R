#' Rational scale
#'
#' This defines the rational scale used when computing harmonicity with
#' \code{\link{gill09_harmonicity}}.
#' It is a matrix with 2 rows and 12 columns,
#' where the first row corresponds to fraction numerators,
#' and the second row corresponds to fraction denominators.
#' Column i identifes the interval of size (i - 1) semitones.
#' For example, column 8 identifies the perfect fifth
#' (7 semitones) as a 3:2 ratio.
#'
#' @docType data
#' @keywords data
rational_scale <- matrix(
  c(1, 16, 9, 6, 5, 4, 7, 3, 8, 5, 9, 15,
    1, 15, 8, 5, 4, 3, 5, 2, 5, 3, 5, 8),
  nrow = 2,
  byrow = TRUE
)
