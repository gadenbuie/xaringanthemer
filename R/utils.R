`%||%` <- function(x, y) if (is.null(x)) y else x

#' @export
lighten_color <- function(color_hex, strength = 0.7) {
  stopifnot(strength >= 0 && strength <= 1)
  color_rgb <- col2rgb(color_hex)[, 1]
  color_rgb <- (1 - strength) * color_rgb + strength * 255
  rgb(color_rgb[1], color_rgb[2], color_rgb[3], maxColorValue = 255)
}

#' @export
darken_color <- function(color_hex, strength = 0.8) {
  stopifnot(strength >= 0 && strength <= 1)
  color_rgb <- col2rgb(color_hex)[, 1]
  color_rgb <- (1 - strength) * color_rgb
  rgb(color_rgb[1], color_rgb[2], color_rgb[3], maxColorValue = 255)
}

adjust_value_color <- function(color_hext, strength = 0.5) {
  color_hsv <- rgb2hsv(col2rgb(color_hex))[, 1]
  color_hsv['v'] <- strength
  hsv(color_hsv[1], color_hsv[2], color_hsv[3])
}

#' @keywords internal
call_write_xaringan_theme <- function() {
  paste0("write_xaringan_theme(",
         paste(template_variables$variable, collapse = ", "),
         ")")
}

#' Specify Google Font
#'
#' Builds Google Fonts URL from family name. Extra weights are given in the
#' `...` parameters. Languages can be specified in `langauges` and must one or
#' more of the language codes as given by `google_language_codes()`.
#'
#' @examples
#' google_font("Josefin Sans", "400", "400i", "600i", "700")
#' google_font("Josefin Sans", languages = c("latin-ext", "vietnamese"))
#' @param family Font family
#' @param ... Font weights to include, example "400", "400i"
#' @param languages Font languages to include (dependent on the font.) See
#'   [google_language_codes()].
#' @export
google_font <- function(family, ..., languages = NULL) {
  base = "https://fonts.googleapis.com/css?family="
  weights <- if (length(list(...))) paste(c(...), collapse = ",")
  languages <- if (!is.null(languages)) paste(google_language_codes(languages), collapse = ",")
  structure(list(
    family = family,
    weights = weights,
    languages = languages,
    url = paste0(
      base, stringr::str_replace_all(family, " ", "+"),
      if (!is.null(weights)) paste0(":", weights),
      if (!is.null(languages)) paste0("&subset=", languages)
    )
  ), class = "google_font")
}

#' @export
google_language_codes <- function(
  x = c("latin", "latin-ext", "sinhala", "greek", "hebrew", "vietnamese",
        "cyrillic", "cyrillic-ext", "devanagari", "arabic", "khmer",
        "tamil", "greek-ext", "thai", "bengali", "gujarati", "oriya",
        "malayalam", "gurmukhi", "kannada", "telugu", "myanmar")
) {
  unique(match.arg(x, several.ok = TRUE))
}

print.google_font <- function(x) {
  cat(
    "Family: ", x$family,
    if (!is.null(x$weights)) paste("\nWeights:", x$weights),
    if (!is.null(x$languages)) paste("\nLangs:  ", x$languages),
    "\nURL:    ", x$url
  )
}

quote_elements_w_spaces <- function(x) {
  x <- stringr::str_split(x, ", ?")[[1]]
  has_space <- stringr::str_detect(x, "\\w \\w")
  not_quoted <- stringr::str_detect(x, "^\\w.+\\w$")
  x[has_space & not_quoted] <- paste0("'", x[has_space & not_quoted], "'")
  paste(x, collapse = ", ")
}
