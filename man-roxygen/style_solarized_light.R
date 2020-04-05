#' @title Solarized Light Theme
#' @description A light theme based around on the solarized color scheme.
#'   Works well with "\code{highlightStyle: solarized-dark}" or
#'   "\code{highlighStyle: solarized-light}".
#' @references \url{http://ethanschoonover.com/solarized}
#' @examples
#' # Create a xaringan style in a temporary file
#' xaringan_themer_css <- tempfile("xaringan-themer-", fileext = ".css")
#'
#' style_solarized_light(
#'   outfile = xaringan_themer_css # omit in your slides to write the
#'                                 # styles to xaringan-themer.css
#' )
#'
#' # View the CSS:
#' # file.edit(xaringan_themer_css)
