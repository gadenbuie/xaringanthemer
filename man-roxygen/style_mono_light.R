#' @title Monotone Light Theme
#' @description A light monotone theme based around a single color.
#' @examples
#' # Create a xaringan style in a temporary file
#' xaringan_themer_css <- tempfile("xaringan-themer-", fileext = ".css")
#'
#' style_mono_light(
#'   base_color = "#23395b",
#'   outfile = xaringan_themer_css # omit in your slides to write the
#'                                 # styles to xaringan-themer.css
#' )
#'
#' # View the CSS:
#' # file.edit(xaringan_themer_css)
