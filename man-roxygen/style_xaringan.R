#' @title Write A Customized Xaringan Theme
#' @description Creates a customized Xaringan theme CSS file.
#' @examples
#' # Create a xaringan style in a temporary file
#' xaringan_themer_css <- tempfile("xaringan-themer-", fileext = ".css")
#'
#' style_xaringan(
#'   text_color = "#002b3",
#'   inverse_background_color = "#31b09e",
#'   inverse_text_color = "#002b3",
#'   outfile = xaringan_themer_css # omit in your slides to write the
#'                                 # styles to xaringan-themer.css
#' )
#'
#' # View the CSS:
#' # file.edit(xaringan_themer_css)
