% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color.R
\name{lighten_darken_color}
\alias{lighten_darken_color}
\alias{lighten_color}
\alias{darken_color}
\title{Generate lighter or darker version of a color}
\usage{
lighten_color(color_hex, strength = 0.7)

darken_color(color_hex, strength = 0.8)
}
\arguments{
\item{color_hex}{A character string representing a hex color}

\item{strength}{The "strength" of the blend with white or black,
where 0 is entirely the original color and 1 is entirely white
(\code{lighten_color()}) or black (\code{darken_color()}).}
}
\value{
A character string with the lightened or darkened color in
hexadecimal format.
}
\description{
Produces a linear blend of the color with white or black.
}
\examples{
blue <- "#0e6ba8"
blue_light <- lighten_color(blue, strength = 0.33)
blue_dark <- darken_color(blue, strength = 0.33)

if (requireNamespace("scales", quietly = TRUE)) {
  scales::show_col(c(blue_light, blue, blue_dark))
}
}
