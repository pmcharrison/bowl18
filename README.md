
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bowl18: Implementation of Bowling et al.’s (2018) Vocal Similarity Algorithms

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

The `bowl18` R package implements Bowling et al.’s (2018) vocal
similarity algorithms.

## Installation

Within R, you can install the current version of `bowl18` from Github as
follows:

``` r
if (!require(devtools)) install.packages("devtools")
devtools::install_github("bowl18")
```

## Usage

Bowling et al. (2018) formalise two aspects of a musical chord’s ‘vocal
similarity’:

1)  Its similarity to the harmonic series, assessed with the
    `gill09_harmonicity()` function;
2)  The absence of small frequency intervals, assessed with the
    `bowl18_min_freq_dist()` function.

### gill09\_harmonicity

`gill09_harmonicity()` measures a chord’s similarity to a harmonic
series, after Gill & Purves (2009). It assumes that chord pitches are
precisely aligned with the just-tuned scale provided by Bowling et al.
(2018).

By default, `gill09_harmonicity` assumes that the input is a vector of
MIDI pitch numbers. We recommend using the `hrep` package to clarify
this input format, as follows:

``` r
library(bowl18)
library(hrep)

# Constructing chords with pi_chord()
pi_chord(c(60, 64, 67)) # C major chord
#> Pitch chord: 60 64 67

# Major chord
gill09_harmonicity(pi_chord(c(60, 64, 67)))
#> [1] 0.4666667

# Diminished chord
gill09_harmonicity(pi_chord(c(60, 63, 66)))
#> [1] 0.4285714

# Augmented chord
gill09_harmonicity(pi_chord(c(60, 64, 68)))
#> [1] 0.105
```

### bowl18\_min\_freq\_dist

`bowl18_min_freq_dist()` returns the minimum frequency distance between
the fundamental frequencies of a chord. It makes no assumptions about
the chord’s tuning.

By default, `bowl18_min_freq_dist()` assumes that the input is a vector
of frequencies. We recommend using the `hrep` package to clarify this
input format, as follows:

``` r
library(bowl18)
library(hrep)

# Constructing chords with pi_chord() and fr_chord()
x <- pi_chord(c(60, 64, 67)) # C major chord
fr_chord(x) 
#> Frequency chord: 261.626 Hz, 329.628 Hz, 391.995 Hz

# Major chord
bowl18_min_freq_dist(fr_chord(pi_chord(c(60, 64, 67))))
#> [1] 62.36788

# Cluster chord
bowl18_min_freq_dist(fr_chord(pi_chord(c(60, 61, 62))))
#> [1] 15.55707
```

Bowling et al. (2018) argue that, in particular, frequency differences
smaller than 50 Hz contribute negatively to consonance.

## References

Bowling, D. L., Purves, D., & Gill, K. Z. (2018). Vocal similarity
predicts the relative attraction of musical chords. Proceedings of the
National Academy of Sciences, 115(1), 216–221.
<https://doi.org/10.1073/pnas.1713206115>

Gill, K. Z., & Purves, D. (2009). A biological rationale for musical
scales. PLoS ONE, 4(12), 1–9.
<https://doi.org/10.1371/journal.pone.0008144>
