
#' A Plot Theme for ggplot2 by xaringanthemer
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' Creates \pkg{ggplot2} themes to match the xaringanthemer theme used in the
#' \pkg{xaringan} slides that seamlessly matches the "normal" slide colors and
#' styles. See `vignette("ggplot2-themes")` for more information and examples.
#'
#' @param text_color Color for text and foreground, inherits from `text_color`
#' @param background_color Color for background, inherits from
#'   `background_color`
#' @param accent_color Color for titles and accents, inherits from
#'   `header_color`
#' @param accent_secondary_color Color for secondary accents, inherits from
#'   `text_bold_color`
#' @param css_file Path to a \pkg{xaringanthemer} CSS file, from which the
#'   theme variables and values will be inferred. In general, if you use the
#'   \pkg{xaringathemer} defaults, you will not need to set this. This feature
#'   lets you create a \pkg{ggplot2} theme for your \pkg{xaringan} slides, even
#'   if you have only saved your theme CSS file and you aren't creating your
#'   CSS theme with \pkg{xaringanthemer} in your slides' source file.
#' @inheritParams theme_xaringan_base
#'
#' @examples
#' # Requires ggplot2
#' has_ggplot2 <- requireNamespace("ggplot2", quietly = TRUE)
#'
#' if (has_ggplot2) {
#'   # Because this is an example, we'll save the CSS to a temp file
#'   path_to_css_file <- tempfile(fileext = ".css")
#'
#'   # Create the xaringan theme: dark blue background with teal green accents
#'   style_duo(
#'     primary_color = "#002b36",
#'     secondary_color = "#31b09e",
#'     # Using basic fonts for this example, but the plot theme will
#'     # automatically use your theme font if you use Google fonts
#'     text_font_family = "sans",
#'     header_font_family = "serif",
#'     outfile = path_to_css_file
#'   )
#'
#'   library(ggplot2)
#'   ggplot(mpg) +
#'     aes(cty, hwy) +
#'     geom_point() +
#'     ggtitle("Fuel Efficiency of Various Cars") +
#'     theme_xaringan()
#' }
#' @return A ggplot2 theme
#' @family xaringanthemer ggplot2 themes
#' @export
theme_xaringan <- function(
  text_color = NULL,
  background_color = NULL,
  accent_color = NULL,
  accent_secondary_color = NULL,
  css_file = NULL,
  set_ggplot_defaults = TRUE,
  text_font = NULL,
  text_font_use_google = NULL,
  text_font_size = NULL,
  title_font = NULL,
  title_font_use_google = NULL,
  title_font_size = NULL,
  use_showtext = NULL
) {
  requires_xaringanthemer_env(css_file = css_file, try_css = TRUE)
  requires_package(fn = "xaringan_theme")

  background_color <- background_color %||% xaringanthemer_env$background_color
  text_color <- text_color %||% xaringanthemer_env$text_color
  accent_color <- accent_color %||% xaringanthemer_env$header_color
  accent_secondary_color <- accent_secondary_color %||% xaringanthemer_env$text_bold_color %||% accent_color

  theme_xaringan_base(
    text_color,
    background_color,
    accent_color = accent_color,
    accent_secondary_color = accent_secondary_color,
    set_ggplot_defaults = set_ggplot_defaults,
    text_font = text_font,
    text_font_use_google = text_font_use_google,
    text_font_size = text_font_size,
    title_font = title_font,
    title_font_use_google = title_font_use_google,
    title_font_size = title_font_size,
    use_showtext = use_showtext
  )
}

#' An Inverse Plot Theme for ggplot2 by xaringanthemer
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' A \pkg{ggplot2} xaringanthemer plot theme to seamlessly match the "inverse"
#' \pkg{xaringan} slide colors and styles as styled by [xaringanthemer]. See
#' `vignette("ggplot2-themes")` for more information and examples.
#'
#' @param text_color Color for text and foreground, inherits from `text_color`
#' @param background_color Color for background, inherits from
#'   `background_color`
#' @param accent_color Color for titles and accents, inherits from
#'   `header_color`
#' @param accent_secondary_color Color for secondary accents, inherits from
#'   `text_bold_color`
#' @inheritParams theme_xaringan
#' @inheritParams theme_xaringan_base
#'
#' @examples
#' # Requires ggplot2
#' has_ggplot2 <- requireNamespace("ggplot2", quietly = TRUE)
#'
#' if (has_ggplot2) {
#'   # Because this is an example, we'll save the CSS to a temp file
#'   path_to_css_file <- tempfile(fileext = ".css")
#'
#'   # Create the xaringan theme: dark blue background with teal green accents
#'   style_duo(
#'     primary_color = "#002b36",
#'     secondary_color = "#31b09e",
#'     # Using basic fonts for this example, but the plot theme will
#'     # automatically use your theme font if you use Google fonts
#'     text_font_family = "sans",
#'     header_font_family = "serif",
#'     outfile = path_to_css_file
#'   )
#'
#'   library(ggplot2)
#'   ggplot(mpg) +
#'     aes(cty, hwy) +
#'     geom_point() +
#'     ggtitle("Fuel Efficiency of Various Cars") +
#'     # themed to match the inverse slides: teal background with dark blue text
#'     theme_xaringan_inverse()
#' }
#' @return A ggplot2 theme
#' @family xaringanthemer ggplot2 themes
#' @export
theme_xaringan_inverse <- function(
  text_color = NULL,
  background_color = NULL,
  accent_color = NULL,
  accent_secondary_color = NULL,
  css_file = NULL,
  set_ggplot_defaults = TRUE,
  text_font = NULL,
  text_font_use_google = NULL,
  text_font_size = NULL,
  title_font = NULL,
  title_font_use_google = NULL,
  title_font_size = NULL,
  use_showtext = NULL
) {
  requires_xaringanthemer_env(css_file = css_file, try_css = TRUE)
  requires_package(fn = "xaringan_theme")

  background_color <- background_color %||% xaringanthemer_env$inverse_background_color
  text_color <- text_color %||% xaringanthemer_env$inverse_text_color
  accent_color <- accent_color %||% xaringanthemer_env$inverse_header_color
  accent_secondary_color <- accent_secondary_color %||% accent_color

  theme_xaringan_base(
    text_color,
    background_color,
    accent_color = accent_color,
    accent_secondary_color = accent_secondary_color,
    set_ggplot_defaults = set_ggplot_defaults,
    text_font = text_font,
    text_font_use_google = text_font_use_google,
    text_font_size = text_font_size,
    title_font = title_font,
    title_font_use_google = title_font_use_google,
    title_font_size = title_font_size,
    use_showtext = use_showtext
  )
}

#' The ggplot2 xaringanthemer base plot theme
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' Provides a base plot theme for \pkg{ggplot2} to match the \pkg{xaringan}
#' slide theme created by [xaringanthemer]. The theme is designed to create a
#' general plot style from two colors, a `background_color` and a `text_color`
#' (or foreground color). Also accepts an `accent_color` and an
#' `accent_secondary_color` that are [xaringanthemer] is not required for the
#' base theme. Use [theme_xaringan()] or [theme_xaringan_inverse()] in xaringan
#' slides styled by xaringanthemer for a plot theme that matches the slide
#' style.  See `vignette("ggplot2-themes")` for more information and examples.
#'
#' @param text_color Color for text and foreground
#' @param background_color Color for background
#' @param accent_color Color for titles and accents, inherits from
#'   `header_color` or `text_color`. Used for the `title` base setting in
#'   [ggplot2::theme()], and additionally for setting the `color` or `fill` of
#'   \pkg{ggplot2} geom defaults.
#' @param accent_secondary_color Color for secondary accents, inherits from
#'   `text_bold_color` or `accent_color`. Used only when setting \pkg{ggplot2} geom
#'   defaults.
#' @param set_ggplot_defaults Should defaults be set for \pkg{ggplot2} _geoms_?
#'   Defaults to TRUE. To restore ggplot's defaults, or the previously set geom
#'   defaults, see [theme_xaringan_restore_defaults()].
#' @param text_font Font to use for text elements, passed to
#'   [sysfonts::font_add_google()], if available and `text_font_use_google` is
#'   `TRUE`. Inherits from `text_font_family`. If manually specified, can be a
#'   [google_font()].
#' @param text_font_use_google Is `text_font` available on [Google
#'   Fonts](https://fonts.google.com)?
#' @param text_font_size Base text font size, inherits from `text_font_size`, or
#'   defaults to 11.
#' @param title_font Font to use for title elements, passed to
#'   [sysfonts::font_add_google()], if available and `title_font_use_google` is
#'   `TRUE`. Inherits from `title_font_family`. If manually specified, can be a
#'   [google_font()].
#' @param title_font_use_google Is `title_font` available on [Google
#'   Fonts](https://fonts.google.com)?
#' @param title_font_size Base text font size, inherits from `title_font_size`,
#'   or defaults to 14.
#' @param use_showtext If `TRUE` the \pkg{showtext} package will be
#'   used to register Google fonts. Set to `FALSE` to disable this feature
#'   entirely, which may result in errors during plotting if the fonts used are
#'   not available locally. The default is `TRUE` when the \pkg{showtext}
#'   package is installed.
#' @param ... Ignored
#'
#' @examples
#' # Requires ggplot2
#' has_ggplot2 <- requireNamespace("ggplot2", quietly = TRUE)
#'
#' if (has_ggplot2) {
#'   library(ggplot2)
#'
#'   plot1 <- ggplot(mpg) +
#'     aes(cty, hwy) +
#'     geom_point() +
#'     theme_xaringan_base(
#'       text_color = "#602f6b",       # imperial
#'       background_color = "#f8f8f8", # light gray
#'       accent_color = "#317873",     # myrtle green
#'       title_font = "sans",
#'       text_font = "serif",
#'       set_ggplot_defaults = TRUE
#'     ) +
#'     labs(
#'       title = "Fuel Efficiency of Various Cars",
#'       subtitle = "+ theme_xaringan_base()",
#'       caption = "xaringanthemer"
#'     )
#'
#'   print(plot1)
#'
#'   plot2 <- ggplot(mpg) +
#'     aes(hwy) +
#'     geom_histogram(binwidth = 2) +
#'     theme_xaringan_base(
#'       text_color = "#a8a9c8",       # light purple
#'       background_color = "#303163", # deep slate purple
#'       accent_color = "#ffff99",     # canary yellow
#'       title_font = "sans",
#'       text_font = "serif",
#'       set_ggplot_defaults = TRUE
#'     ) +
#'     labs(
#'       title = "Highway Fuel Efficiency",
#'       subtitle = "+ theme_xaringan_base()",
#'       caption = "xaringanthemer"
#'     )
#'
#'   print(plot2)
#' }
#' @return A ggplot2 theme
#' @family xaringanthemer ggplot2 themes
#' @export
theme_xaringan_base <- function(
  text_color,
  background_color,
  ...,
  set_ggplot_defaults = TRUE,
  accent_color = NULL,
  accent_secondary_color = NULL,
  text_font = NULL,
  text_font_use_google = NULL,
  text_font_size = NULL,
  title_font = NULL,
  title_font_use_google = NULL,
  title_font_size = NULL,
  use_showtext = NULL
) {
  text_color <- full_length_hex(text_color)
  background_color <- full_length_hex(background_color)

  blend <- color_blender(text_color, background_color)

  text_font_size <- text_font_size %||% web_to_point(xaringanthemer_env$text_font_size, scale = 1.25) %||% 11
  title_font_size <- title_font_size %||% web_to_point(xaringanthemer_env$header_h3_font_size, scale = 0.8) %||% 14

  text_font_use_google  <- text_font_use_google  %||% is_google_font(text_font)
  title_font_use_google <- title_font_use_google %||% is_google_font(title_font)

  if (is.null(use_showtext)) {
    use_showtext <- requires_package("showtext", "theme_xaringan", required = FALSE)
  }
  text_font <- if (!is.null(text_font)) {
    register_font(text_font, identical(text_font_use_google, TRUE) && use_showtext)
  } else {
    get_theme_font("text")
  }
  title_font <- if (!is.null(title_font)) {
    register_font(title_font, identical(title_font_use_google, TRUE) && use_showtext)
  } else {
    get_theme_font("header")
  }

  text_font  <- text_font %||% "sans"
  title_font <- title_font %||% "sans"

  if (set_ggplot_defaults) {
    accent_color <- accent_color %||% xaringanthemer_env$header_color %||% text_color
    accent_secondary_color <- accent_secondary_color %||% xaringanthemer_env$text_bold_color %||% accent_color
    accent_color <- full_length_hex(accent_color)
    accent_secondary_color <- full_length_hex(accent_secondary_color)
    theme_xaringan_set_defaults(
      text_color = text_color,
      background_color = background_color,
      accent_color = accent_color,
      accent_secondary_color = accent_secondary_color,
      text_font = text_font
    )
  }

  theme <- ggplot2::theme(
    line = ggplot2::element_line(color = blend(0.2)),
    rect = ggplot2::element_rect(fill = background_color),
    text = ggplot2::element_text(
      color = blend(0.1),
      family = text_font,
      size = text_font_size
    ),
    title = ggplot2::element_text(
      color = accent_color,
      family = title_font,
      size = title_font_size
    ),
    plot.background = ggplot2::element_rect(
      fill = background_color,
      color = background_color
    ),
    panel.background = ggplot2::element_rect(
      fill = background_color,
      color = background_color
    ),
    panel.grid.major = ggplot2::element_line(
      color = blend(0.8),
      inherit.blank = TRUE
    ),
    panel.grid.minor = ggplot2::element_line(
      color = blend(0.9),
      inherit.blank = TRUE
    ),
    axis.title = ggplot2::element_text(size = title_font_size * 0.8),
    axis.ticks = ggplot2::element_line(color = blend(0.8)),
    axis.text = ggplot2::element_text(color = blend(0.4)),
    legend.key = ggplot2::element_rect(fill = "transparent", colour = NA),
    plot.caption = ggplot2::element_text(
      size = text_font_size * 0.8,
      color = blend(0.3)
    )
  )

  if (utils::packageVersion("ggplot2") >= package_version("3.3.0")) {
    theme + ggplot2::theme(plot.title.position = "plot")
  } else theme
}

#' Set and Restore ggplot2 geom Defaults
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' Set \pkg{ggplot2} _geom_ defaults to match [theme_xaringan()] with
#' `theme_xaringan_set_defaults()` and restore the standard or previously-set
#' defaults with `theme_xaringan_restore_defaults()`. By default,
#' `theme_xaringan_set_defaults()` is run with [theme_xaringan()] or
#' [theme_xaringan_inverse()].
#'
#' @family xaringanthemer ggplot2 themes
#' @param text_font Font to use for text elements, passed to
#'   [sysfonts::font_add_google()], if available and `text_font_use_google` is
#'   `TRUE`. Inherits from `text_font_family`. Must be a length-one character.
#' @inheritParams theme_xaringan
#' @inheritParams theme_xaringan_base
#' @return Invisibly returns a list of the current ggplot2 geom defaults
#' @export
theme_xaringan_set_defaults <- function(
  text_color = NULL,
  background_color = NULL,
  accent_color = text_color,
  accent_secondary_color = accent_color,
  text_font = NULL
) {
  requires_package("ggplot2")

  blend <- color_blender(text_color, background_color)

  xaringan_theme_defaults <- list(
    "line"       = list(color = text_color),
    "vline"      = list(color = accent_secondary_color),
    "hline"      = list(color = accent_secondary_color),
    "abline"     = list(color = accent_secondary_color),
    "segment"    = list(color = text_color),
    "bar"        = list(fill  = accent_color),
    "col"        = list(fill  = accent_color),
    "boxplot"    = list(color = text_color),
    "contour"    = list(color = text_color),
    "density"    = list(color = text_color,
      fill  = text_color,
      alpha = 0.1),
    "dotplot"    = list(color = accent_color),
    "errorbarh"  = list(color = text_color),
    "crossbar"   = list(color = text_color),
    "errorbar"   = list(color = text_color),
    "linerange"  = list(color = text_color),
    "pointrange" = list(color = text_color),
    "map"        = list(color = text_color),
    "path"       = list(color = text_color),
    "line"       = list(color = text_color),
    "step"       = list(color = text_color),
    "point"      = list(color = accent_color),
    "polygon"    = list(color = accent_color,
      fill  = accent_color),
    "quantile"   = list(color = text_color),
    "rug"        = list(color = blend(0.5)),
    "segment"    = list(color = text_color),
    "smooth"     = list(fill  = blend(0.75),
      color = accent_secondary_color),
    "spoke"      = list(color = text_color),
    "label"      = list(color = text_color,
      family= text_font %||% get_theme_font("text")),
    "text"       = list(color = text_color,
      family= text_font %||% get_theme_font("text")),
    "rect"       = list(fill  = text_color),
    "tile"       = list(fill  = text_color),
    "violin"     = list(fill  = text_color),
    "sf"         = list(color = text_color)
  )

  geom_names <- purrr::set_names(names(xaringan_theme_defaults))

  previous_defaults <- lapply(
    geom_names,
    function(geom) safely_set_geom(geom, xaringan_theme_defaults[[geom]])
  )

  if (is.null(xaringanthemer_env$old_ggplot_defaults)) {
    xaringanthemer_env$old_ggplot_defaults <- previous_defaults
  }

  invisible(previous_defaults)
}

#' @describeIn theme_xaringan_set_defaults Restore previous or standard
#'   \pkg{ggplot2} _geom_ defaults.
#' @return Invisibly returns a list of the current ggplot2 geom defaults
#' @export
theme_xaringan_restore_defaults <- function() {
  requires_package("ggplot2")
  requires_xaringanthemer_env(try_css = FALSE, requires_theme = FALSE)

  if (is.null(xaringanthemer_env$old_ggplot_defaults)) {
    return(invisible())
  }

  old_default <- xaringanthemer_env$old_ggplot_defaults
  old_default_not_std <- vapply(old_default, function(x) length(x) > 0, logical(1))
  old_default <- old_default[old_default_not_std]

  restore_default <- utils::modifyList(xaringanthemer_env$std_ggplot_defaults, old_default)

  geom_names <- purrr::set_names(names(restore_default))
  previous_defaults <- lapply(
    geom_names,
    function(geom) safely_set_geom(geom, restore_default[[geom]])
  )

  invisible(previous_defaults)
}

safely_set_geom <- function(geom, new) {
  warn <- function(x) {
    warning(x$message, call. = TRUE, immediate. = TRUE)
    invisible()
  }
  tryCatch(
    {
      ggplot2::update_geom_defaults(geom, new)
    },
    error = warn,
    warning = warn
  )
}


# Color Scales ------------------------------------------------------------

#' Themed ggplot2 Scales
#'
#' @description
#'
#' `r lifecycle::badge("maturing")`
#'
#' Color and fill single-color scales for discrete and continuous values,
#' created using the primary accent color of the xaringanthemer styles.  See
#' `vignette("ggplot2-themes")` for more information and examples of
#' \pkg{xaringanthemer}'s \pkg{ggplot2}-related functions.
#'
#' @param ... Arguments passed on to either the \pkg{colorspace} scale
#'   functions — one of [colorspace::scale_color_discrete_sequential()],
#'   [colorspace::scale_color_continuous_sequential()],
#'   [colorspace::scale_fill_discrete_sequential()], or
#'   [colorspace::scale_fill_continuous_sequential()] — or to
#'   [ggplot2::continuous_scale] or [ggplot2::discrete_scale].
#' @param color A color value, in hex, to override the default color. Otherwise,
#'   the primary color of the resulting scale is chosen from the xaringanthemer
#'   slide styles.
#' @param inverse If `color` is not supplied and `inverse = TRUE`, a primary
#'   color is chosen to work well with the inverse slide styles, namely the
#'   value of `inverse_header_color`
#' @param direction Direction of the discrete scale. Use values less than 0 to
#'   reverse the direction, e.g. `direction = -1`.
#' @inheritParams colorspace::scale_color_continuous_sequential
#' @param aes_type The type of aesthetic to which the scale is being applied.
#'   One of "color", "colour", or "fill".
#'
#'
#' @examples
#' # Requires ggplot2
#' has_ggplot2 <- requireNamespace("ggplot2", quietly = TRUE)
#'
#' if (has_ggplot2) {
#'   library(ggplot2)
#'   # Saving the theme to a temp file because this is an example
#'   path_to_css_file <- tempfile(fileext = ".css")
#'
#'   # Create the xaringan theme: dark blue background with teal green accents
#'   style_duo(
#'     primary_color = "#002b36",
#'     secondary_color = "#31b09e",
#'     # Using basic fonts for this example, but the plot theme will
#'     # automatically use your theme font if you use Google fonts
#'     text_font_family = "sans",
#'     header_font_family = "serif",
#'     outfile = path_to_css_file
#'   )
#'
#'   # Here's some very basic example data
#'   ex <- data.frame(
#'     name = c("Couple", "Few", "Lots", "Many"),
#'     n = c(2, 3, 5, 7)
#'   )
#'
#'   # Fill color scales demo
#'   ggplot(ex) +
#'     aes(name, n, fill = n) +
#'     geom_col() +
#'     ggtitle("Matching fill scales") +
#'     # themed to match the slides: dark blue background with teal text
#'     theme_xaringan() +
#'     # Fill color matches teal text
#'     scale_xaringan_fill_continuous()
#'
#'   # Color scales demo
#'   ggplot(ex) +
#'     aes(name, y = 1, color = name) +
#'     geom_point(size = 10) +
#'     ggtitle("Matching color scales") +
#'     # themed to match the slides: dark blue background with teal text
#'     theme_xaringan() +
#'     # Fill color matches teal text
#'     scale_xaringan_color_discrete(direction = -1)
#' }
#' @name scale_xaringan
NULL

#' @rdname scale_xaringan
#' @export
scale_xaringan_discrete <- function(
  aes_type = c("color", "colour", "fill"),
  ...,
  color = NULL,
  direction = 1,
  inverse = FALSE
) {
  requires_package("ggplot2", "scale_xaringan_discrete")

  aes_type <- match.arg(aes_type)
  color <- hex2HCL(get_theme_accent_color(color, inverse))

  pal <- function(n) {
    colors <- colorspace::sequential_hcl(
      n = n,
      c1 = color[1, "C"],
      l1 = color[1, "L"],
      h1 = color[1, "H"],
      rev = direction >= 1
    )
  }

  ggplot2::discrete_scale(aes_type, "manual", pal, ...)
}

#' @rdname scale_xaringan
#' @export
scale_xaringan_fill_discrete <- function(
  ...,
  color = NULL,
  direction = 1,
  inverse = FALSE
) {
  scale_xaringan_discrete(
    "fill",
    ...,
    color = color,
    direction = direction,
    inverse = inverse
  )
}

#' @rdname scale_xaringan
#' @export
scale_xaringan_color_discrete <- function(
  ...,
  color = NULL,
  direction = 1,
  inverse = FALSE
) {
  scale_xaringan_discrete(
    "color",
    ...,
    color = color,
    direction = direction,
    inverse = inverse
  )
}

#' @rdname scale_xaringan
#' @export
scale_xaringan_colour_discrete <- scale_xaringan_color_discrete

#' @rdname scale_xaringan
#' @export
scale_xaringan_continuous <- function(
  aes_type = c("color", "colour", "fill"),
  ...,
  color = NULL,
  begin = 0,
  end = 1,
  inverse = FALSE
) {
  requires_package("ggplot2", "scale_xaringan_continuous")
  requires_package("scales", "scale_xaringan_continuous")
  aes_type <- match.arg(aes_type)
  color <- hex2HCL(get_theme_accent_color(color, inverse))

  colors <- suppressWarnings(colorspace::sequential_hcl(
    n = 12,
    c1 = color[1, "C"],
    l1 = color[1, "L"],
    h1 = color[1, "H"],
    rev = TRUE
  ))

  rescaler <- function(x, ...) {
    scales::rescale(x, to = c(begin, end), from = range(x, na.rm = TRUE))
  }

  ggplot2::continuous_scale(
    aes_type,
    "continuous_sequential",
    palette = scales::gradient_n_pal(colors, values = NULL),
    rescaler = rescaler,
    oob = scales::censor,
    ...
  )
}

#' @rdname scale_xaringan
#' @export
scale_xaringan_fill_continuous <- function(
  ...,
  color = NULL,
  begin = 0,
  end = 1,
  inverse = FALSE
) {
  scale_xaringan_continuous(
    "fill",
    ...,
    color = color,
    begin = begin,
    end = end,
    inverse = inverse
  )
}

#' @rdname scale_xaringan
#' @export
scale_xaringan_color_continuous <- function(
  ...,
  color = NULL,
  begin = 0,
  end = 1,
  inverse = FALSE
) {
  scale_xaringan_continuous(
    "color",
    ...,
    color = color,
    begin = begin,
    end = end,
    inverse = inverse
  )
}

#' @rdname scale_xaringan
#' @export
scale_xaringan_colour_continuous <- scale_xaringan_color_continuous

get_theme_accent_color <- function(color = NULL, inverse = FALSE) {
  color <-
    if (!inverse) {
      color %||%
        xaringanthemer_env[["header_color"]] %||%
        xaringanthemer_env[["text_color"]]
    } else {
      color %||% xaringanthemer_env[["inverse_header_color"]]
    }

  if (is.null(color)) {
    stop(
      call. = FALSE,
      "No color provided and no default available. ",
      "Have you forgotten to use a style function to set the xaringan theme?"
    )
  }

  color
}

blend_colors <- function(x, y, alpha = 0.5) {
  x <- colorspace::hex2RGB(x)
  y <- colorspace::hex2RGB(y)
  z <- colorspace::mixcolor(alpha, x, y)
  colorspace::hex(z)
}

color_blender <- function(x, y) function(alpha = 0.5) blend_colors(x, y, alpha)

hex2HCL <- function(x) {
  colorspace::coords(methods::as(colorspace::hex2RGB(x), "polarLUV"))
}


# Fonts -------------------------------------------------------------------

get_theme_font <- function(element = c("text", "header", "code"), use_showtext = TRUE) {
  element <- match.arg(element)

  element_family <- paste0(element, "_font_family")
  element_google <- paste0(element, "_font_google")
  element_is_google <- paste0(element, "_font_is_google")
  element_url <- paste0(element, "_font_url")

  family <- xaringanthemer_env[[element_family]]
  is_google_font <- xaringanthemer_env[[element_is_google]]
  if (is.null(is_google_font)) {
    is_google_font <- !is.null(xaringanthemer_env[[element_google]]) ||
      grepl("fonts.google", xaringanthemer_env[[element_url]], fixed = TRUE)
  }

  register_font(
    family,
    google = is_google_font,
    fn = sys.calls()[[max(1, sys.nframe() - 1)]][[1]],
    use_showtext = use_showtext
  )
}

register_font <- function(
  family,
  google = TRUE,
  fn = sys.calls()[[max(1, sys.nframe() - 1)]][[1]],
  ...,
  use_showtext = TRUE
) {
  if (is.null(family) || !use_showtext) {
    return(NULL)
  }
  if (is_google_font(family)) family <- family$family
  family <- gsub("['\"]", "", family)

  if (!identical(xaringanthemer_env$showtext_auto, TRUE)) {
    if (!requires_package(pkg = "showtext", fn, required = FALSE)) {
      return(family)
    }
    showtext::showtext_auto()
    xaringanthemer_env$showtext_auto <- TRUE
  }

  if (family %in% xaringanthemer_env[["registered_font_families"]] %||% "") {
    return(family)
  }

  if (!requires_package(pkg = "sysfonts", fn, required = FALSE)) {
    return(family)
  } else if (family == "Droid Serif") {
    dstmp <- download_tmp_droid_serif()
    if (!is.null(dstmp)) {
      sysfonts::font_add(
        family = "Droid Serif",
        regular = dstmp
      )
    }
  } else if (!family %in% sysfonts::font_families()) {
    is_default_font <- family %in% c(
      "Roboto",
      "Source Code Pro",
      "Yanone Kaffeesatz"
    )
    font_found <- family %in% sysfonts::font_families()
    is_google_font <- identical(google, TRUE) || (missing(google) && is_default_font)
    if (is_google_font) {
      tryCatch(
        {
          sysfonts::font_add_google(family, ...)
          font_found <- TRUE
        },
        error = function(e) {},
        warning = function(w) {}
      )
    }
    if (!font_found) { # warn user if font still not found
      msg <- if (is_google_font) glue::glue(
        "Font '{family}' not found in Google Fonts. ",
        "Please manually register the font using `sysfonts::font_add()`."
      ) else {
        glue::glue(
          "Font '{family}' must be manually registered using `sysfonts::font_add()`."
        )
      }
      warning(str_wrap(msg), call. = FALSE)
    } else {
      verify_fig_showtext(fn)
    }
  }
  xaringanthemer_env[["registered_font_families"]] <- c(
    xaringanthemer_env[["registered_font_families"]],
    family
  )
  family
}

download_tmp_droid_serif <- function() {
  if (isTRUE(xaringanthemer_env[["declined_droid_serif"]])) return(NULL)
  message(
    "Using 'Droid Serif' in `theme_xaringan()` requires downloading the font from Google Fonts into a temporary file. "
  )
  ok_to_download <- utils::askYesNo("Do you want to try to download this font now?")
  if (identical(ok_to_download, FALSE)) {
    xaringanthemer_env[["declined_droid_serif"]] <- TRUE
  }
  if (!isTRUE(ok_to_download)) {
    return(NULL)
  }
  dstmp <- tempfile("droid-serif", fileext = "ttf")
  utils::download.file(
    "https://github.com/google/fonts/raw/feb15862e0c66ec0e7531ca4c3ef2607071ea700/apache/droidserif/DroidSerif-Regular.ttf",
    dstmp,
    quiet = TRUE
  )
  dstmp
}

verify_fig_showtext <- function(fn = "theme_xaringan_base") {
  if (is.null(knitr::current_input())) return()
  # Try to set fig.showtext automatically
  if (isTRUE(knitr::opts_current$get("fig.showtext"))) {
    return()
  }
  stop(str_wrap(
    "To use ", fn, "() with knitr, you need to set the chunk option ",
    "`fig.showtext = TRUE` for this chunk. Or you can set this option ",
    "globally with `knitr::opts_chunk$set(fig.showtext = TRUE)`."
  ))
}

set_fig_showtext <- function() {
  if (!requireNamespace("showtext", quietly = TRUE)) {
    return(invisible())
  }

  curr_fst_chunk <- knitr::opts_current$get("fig.showtext")
  curr_fst <- curr_fst_chunk %||% knitr::opts_chunk$get("fig.showtext")

  if (!is.null(curr_fst) && identical(curr_fst, FALSE)) {
    return(invisible())
  }
  knitr::opts_chunk$set(fig.showtext = TRUE)
}

requires_xaringanthemer_env <- function(
  css_file = NULL,
  try_css = TRUE,
  requires_theme = TRUE
) {
  reload <- !is.null(css_file) && isTRUE(try_css)
  pkg_env_exists <- exists("xaringanthemer_env")
  missing_theme <- requires_theme && pkg_env_exists && is.null(xaringanthemer_env$header_color)
  if (reload || !pkg_env_exists || missing_theme) {
    if (try_css) {
      css_vars <- read_css_vars(css_file)
      for (css_var in names(css_vars)) {
        xaringanthemer_env[[css_var]] <- css_vars[[css_var]]
      }
      return(requires_xaringanthemer_env(try_css = FALSE))
    } else {
      stop("Please call a xaringanthemer theme function first.")
    }
  }
}

#' Get the Value of xaringanthemer Style Setting
#'
#' A helper function to retrieve the value of style settings as set by a
#' xaringanthemer style function, for use in plotting and other circumstances.
#'
#' @section Style Settings:
#' Style settings used by xaringanthemer include:
#'
#' - `background_color`
#' - `background_image`
#' - `background_position`
#' - `background_size`
#' - `blockquote_left_border_color`
#' - `code_font_family`
#' - `code_font_family_fallback`
#' - `code_font_google`
#' - `code_font_is_google`
#' - `code_font_size`
#' - `code_font_url`
#' - `code_highlight_color`
#' - `code_inline_background_color`
#' - `code_inline_color`
#' - `code_inline_font_size`
#' - `extra_css`
#' - `extra_fonts`
#' - `footnote_color`
#' - `footnote_font_size`
#' - `footnote_position_bottom`
#' - `header_background_auto`
#' - `header_background_color`
#' - `header_background_content_padding_top`
#' - `header_background_ignore_classes`
#' - `header_background_padding`
#' - `header_background_text_color`
#' - `header_color`
#' - `header_font_family`
#' - `header_font_google`
#' - `header_font_is_google`
#' - `header_font_url`
#' - `header_font_weight`
#' - `header_h1_font_size`
#' - `header_h2_font_size`
#' - `header_h3_font_size`
#' - `inverse_background_color`
#' - `inverse_header_color`
#' - `inverse_text_color`
#' - `inverse_text_shadow`
#' - `left_column_selected_color`
#' - `left_column_subtle_color`
#' - `link_color`
#' - `padding`
#' - `table_border_color`
#' - `table_row_border_color`
#' - `table_row_even_background_color`
#' - `text_bold_color`
#' - `text_color`
#' - `text_font_base`
#' - `text_font_family`
#' - `text_font_family_fallback`
#' - `text_font_google`
#' - `text_font_is_google`
#' - `text_font_size`
#' - `text_font_url`
#' - `text_font_weight`
#' - `text_slide_number_color`
#' - `text_slide_number_font_size`
#' - `title_slide_background_color`
#' - `title_slide_background_image`
#' - `title_slide_background_position`
#' - `title_slide_background_size`
#' - `title_slide_text_color`
#'
#' @param setting A xaringanthemer style setting
#' @inheritParams theme_xaringan
#' @examples
#' # Create a xaringanthemer style in a temporary file for this example
#' xaringan_themer_css <- tempfile("xaringan-themer", fileext = ".css")
#'
#' style_solarized_light(outfile = xaringan_themer_css)
#'
#' theme_xaringan_get_value("text_color")
#' theme_xaringan_get_value("background_color")
#' theme_xaringan_get_value("header_color")
#' theme_xaringan_get_value("text_bold_color")
#' @return The value of the xaringanthemer style parameter.
#' @export
theme_xaringan_get_value <- function(setting, css_file = NULL) {
  requires_xaringanthemer_env(css_file = css_file)
  if (length(setting) > 1) {
    ret <- list()
    for (var in setting) {
      ret[[var]] <- xaringanthemer_env[[var]]
    }
    return(ret)
  }

  xaringanthemer_env[[setting]]
}

web_to_point <- function(x, px_per_em = NULL, scale = 0.75) {
  if (is.null(x)) {
    return(NULL)
  }
  px_per_em <- px_per_em %||% get_base_font_size()
  if (grepl("pt$", x)) {
    return(as.numeric(sub("pt$", "", x)))
  } else if (grepl("px$", x)) {
    x <- as.numeric(sub("px$", "", x))
    return(x * scale)
  } else if (grepl("r?em$", x)) {
    x <- as.numeric(sub("r?em$", "", x))
    return(x * px_per_em * scale)
  } else {
    return()
  }
}

get_base_font_size <- function() {
  base_size <- xaringanthemer_env[["base_font_size"]] %||%
    xaringanthemer_env[["text_font_size"]]

  if (!grepl("px", base_size)) {
    # assume 16px base font size
    16
  } else {
    as.numeric(sub("px", "", base_size))
  }
}
