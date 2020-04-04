#' @title Generate lighter or darker version of a color
#' @description Produces a linear blend of the color with white or black.
#' @param color_hex A character string representing a hex color
#' @param strength The "strength" of the blend with white or black,
#'   where 0 is entirely the original color and 1 is entirely white
#'   (`lighten_color()`) or black (`darken_color()`).
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

prepare_colors <- function(colors = NULL) {
  if (is.null(colors) || length(colors) < 1) return(NULL)

  if (is.null(names(colors))) {
    stop(
      "`colors` must have names corresponding to valid CSS classes",
      call. = FALSE
    )
  }

  if (any(grepl("\\s", names(colors)))) {
    stop(
      "Color names in `colors` must be valid CSS classes",
      " and cannot contain spaces",
      call. = FALSE)
  }

  if (any(grepl("[^[:alpha:]_-]", names(colors)))) {
    stop("Color names in `colors` must be valid CSS classes", call. = FALSE)
  }

  whisker::iteratelist(colors, "color_name")
}

full_length_hex <- function(x) {
  varname <- substitute(x)
  stop_not_hex <- function() {
    stop(str_wrap(
      "`", deparse(varname), "` is not a hexadecimal color: ", x, ". ",
      "If you used valid CSS colors in your xaringan theme, please convert ",
      "these colors to hexadecimal form, as this is the format required by ",
      "ggplot2."
    ), call. = FALSE)
  }
  if (!grepl("^#", x) || grepl("[^#0-9a-fA-F]", x)) {
    stop_not_hex()
  }
  x <- sub("^#", "", x)
  if (nchar(x) == 3) {
    x <- strsplit(x, character(0))[[1]]
    x <- rep(x, each = 2)
    x <- paste(x, collapse = "")
  } else if (nchar(x) != 6) {
    stop_not_hex()
  }
  paste0("#", x)
}