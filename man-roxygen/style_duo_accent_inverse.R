#' @title Duotone Accent Inverse Theme
#' @description An "inverted" default xaringan theme with a two colors used
#'   for color accents on select elements (headers, bold text, etc.).
#' @examples
#' # Create a xaringan style in a temporary file
#' xaringan_themer_css <- tempfile("xaringan-themer-", fileext = ".css")
#'
#' style_duo_accent_inverse(
#'   primary_color = "#006747",
#'   secondary_color = "#cfc493",
#'   outfile = xaringan_themer_css # omit in your slides to write the
#'                                 # styles to xaringan-themer.css
#' )
#'
#' # View the CSS:
#' # file.edit(xaringan_themer_css)
