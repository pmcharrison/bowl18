% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bowl18-min-freq-int.R
\name{bowl18_min_freq_dist}
\alias{bowl18_min_freq_dist}
\alias{bowl18_min_freq_dist.default}
\alias{bowl18_min_freq_dist.fr_chord}
\title{Minimum frequency distance}
\usage{
bowl18_min_freq_dist(x)

\method{bowl18_min_freq_dist}{default}(x)

\method{bowl18_min_freq_dist}{fr_chord}(x)
}
\arguments{
\item{x}{Chord to analyse.
The default method assumes that the chord is expressed
as a numeric vector of frequencies.
This can be made explicit by using the \code{\link[hrep:pi_chord]{fr_chord}}
function from the \code{hrep} package.}
}
\value{
(Numeric scalar)
The minimum distance between the fundamental frequencies of the chord,
in Hz.
}
\description{
This function returns the minimum distance between
the fundamental frequencies of a chord,
after Bowling et al. (2018).
It makes no assumptions about the chord's tuning.
}
\examples{
bowl18_min_freq_dist(hrep::fr_chord(c(220, 440, 560)))
}
\references{
\insertRef{Bowling2018}{bowl18}
}