#' @title Duotone Theme
#' @description A duotone theme designed to work well with two complementary
#'   colors.
#' @examples
#' # Create a xaringan style in a temporary file
#' xaringan_themer_css <- tempfile("xaringan-themer-", fileext = ".css")
#'
#' style_duo(
#'   primary_color = "#1f4257",
#'   secondary_color = "#f97b64",
#'   outfile = xaringan_themer_css # omit in your slides to write the
#'                                 # styles to xaringan-themer.css
#' )
#'
#' # View the CSS:
#' # file.edit(xaringan_themer_css)
