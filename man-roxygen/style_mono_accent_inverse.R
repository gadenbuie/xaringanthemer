#' @title Monotone Accent Inverse Theme
#' @description An "inverted" default xaringan theme with a single color used
#'   for color accents on select elements (headers, bold text, etc.).
#' @examples
#' # Create a xaringan style in a temporary file
#' xaringan_themer_css <- tempfile("xaringan-themer-", fileext = ".css")
#'
#' style_mono_accent_inverse(
#'   base_color = "#3c989e",
#'   outfile = xaringan_themer_css # omit in your slides to write the
#'                                 # styles to xaringan-themer.css
#' )
#'
#' # View the CSS:
#' # file.edit(xaringan_themer_css)
