#' @section Usage: To use the styles created by this theme function, make sure
#'   that you use `xaringan-themer.css` as your CSS file in your slides' YAML
#'   header. If you change the name of the output file using the `outfile`
#'   argument, use that name instead of the default file name.
#'
#' ```yaml
#' output:
#' xaringan::moon_reader:
#'   css: xaringan-themer.css
#' ````
#'
#' @return The CSS styles are written to the file path provided in `outfile`
#'   (by default to `xaringan-themer.css`). If `outfile` is `NULL`, the CSS is
#'   returned directly as a character string.
#'
