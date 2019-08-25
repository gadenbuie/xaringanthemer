`%||%` <- function(x, y) if (is.null(x)) y else x

`%??%` <- function(x, y) if (!is.null(x)) y else NULL

#' @title Generate lighter or darker version of a color
#' @description Produces a linear blend of the color with white or black.
#' @param color_hex A character string representing a hex color
#' @param strength The "strength" of the blend with white or black,
#'   0 low to 1 high.
#' @name lighten_darken_color
NULL

#' @rdname lighten_darken_color
#' @export
lighten_color <- function(color_hex, strength = 0.7) {
  stopifnot(strength >= 0 && strength <= 1)
  color_rgb <- col2rgb(color_hex)[, 1]
  color_rgb <- (1 - strength) * color_rgb + strength * 255
  rgb(color_rgb[1], color_rgb[2], color_rgb[3], maxColorValue = 255)
}

#' @rdname lighten_darken_color
#' @export
darken_color <- function(color_hex, strength = 0.8) {
  stopifnot(strength >= 0 && strength <= 1)
  color_rgb <- col2rgb(color_hex)[, 1]
  color_rgb <- (1 - strength) * color_rgb
  rgb(color_rgb[1], color_rgb[2], color_rgb[3], maxColorValue = 255)
}

#' @title Add alpha to hex color
#' @description Applies alpha (or opacity) to a color in hexadecimal form by
#'   converting opacity in the `[0, 1]` range to hex in the `[0, 255]` range
#'   and appending to the hex color.
#' @inheritParams lighten_darken_color
#' @param opacity Desired opacity of the output color
#' @export
apply_alpha <- function(color_hex, opacity = 0.5) {
  paste0(color_hex, as.hexmode(round(255 * opacity, 0)))
}

adjust_value_color <- function(color_hex, strength = 0.5) {
  color_hsv <- rgb2hsv(col2rgb(color_hex))[, 1]
  color_hsv["v"] <- strength
  hsv(color_hsv[1], color_hsv[2], color_hsv[3])
}

#' Choose dark or light color
#'
#' Takes a color input as `x` and returns either the black or white color (or
#' expression) if dark or light text should be used over the input color for
#' best contrast. Follows W3C Recommendations.
#'
#' @references <https://stackoverflow.com/a/3943023/2022615>
#' @param x The background color (hex)
#' @param black Text or foreground color, e.g. "#222" or
#' `substitute(darken_color(x, 0.8))`, if black text provides the best contrast.
#' @param white Text or foreground color or expression, e.g. "#EEE" or
#' `substitute(lighten_color(x, 0.8))`, if white text provides the best contrast.
#' @export
choose_dark_or_light <- function(x, black = "#000000", white = "#FFFFFF") {
  if (is_light_color(x)) eval(black) else eval(white)
}

is_light_color <- function(x) {
  # this function returns TRUE if the given color
  # is light-colored and requires dark text
  color_rgb <- col2rgb(x)[, 1]
  # from https://stackoverflow.com/a/3943023/2022615
  color_rgb <- color_rgb / 255
  color_rgb[color_rgb <= 0.03928] <- color_rgb[color_rgb <= 0.03928] / 12.92
  color_rgb[color_rgb > 0.03928] <- ((color_rgb[color_rgb > 0.03928] + 0.055) / 1.055)^2.4
  lum <- t(c(0.2126, 0.7152, 0.0722)) %*% color_rgb
  lum[1, 1] > 0.179
}

#' @keywords internal
call_style_xaringan <- function() {
  paste0(
    "style_xaringan(",
    paste(names(formals(style_xaringan)), collapse = ", "),
    ")"
  )
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
  base <- "https://fonts.googleapis.com/css?family="
  weights <- if (length(list(...))) paste(c(...), collapse = ",")
  languages <- if (!is.null(languages)) paste(google_language_codes(languages), collapse = ",")
  structure(
    list(
      family = family,
      weights = weights,
      languages = languages,
      url = paste0(
        base,
        gsub(" ", "+", family),
        if (!is.null(weights)) paste0(":", weights),
        if (!is.null(languages)) paste0("&subset=", languages)
      )
    ),
    class = "google_font"
  )
}

#' @title List Valid Google Language Codes
#' @description Gives a list of valid Language Codes for Google Fonts, or
#'   validates that the language codes given are valid.
#' @seealso [google_font()]
#' @param language_codes Vector of potential Google language codes
#' @export
google_language_codes <- function(
  language_codes = c(
    "latin",
    "latin-ext",
    "sinhala",
    "greek",
    "hebrew",
    "vietnamese",
    "cyrillic",
    "cyrillic-ext",
    "devanagari",
    "arabic",
    "khmer",
    "tamil",
    "greek-ext",
    "thai",
    "bengali",
    "gujarati",
    "oriya",
    "malayalam",
    "gurmukhi",
    "kannada",
    "telugu",
    "myanmar"
  )) {
  unique(match.arg(language_codes, several.ok = TRUE))
}

print.google_font <- function(x) {
  cat(
    "Family: ",
    x$family,
    if (!is.null(x$weights)) paste("\nWeights:", x$weights),
    if (!is.null(x$languages)) paste("\nLangs:  ", x$languages),
    "\nURL:    ",
    x$url
  )
}

quote_elements_w_spaces <- function(x) {
  x <- strsplit(x, ", ?")[[1]]
  has_space <- grepl("\\w \\w", x)
  not_quoted <- grepl("^\\w.+\\w$", x)
  x[has_space & not_quoted] <- paste0("'", x[has_space & not_quoted], "'")
  paste(x, collapse = ", ")
}
