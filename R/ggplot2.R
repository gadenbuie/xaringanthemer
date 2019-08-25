
#' A Plot Theme for ggplot2 by xaringanthemer
#'
#' @description
#'
#' **Lifecycle:** [Experimental](https://www.tidyverse.org/lifecycle/#experimental).
#'
#' Creates [ggplot2] themes to match the xaringanthemer theme used in the
#' [xaringan] slides that seamlessly matches the "normal" slide colors and
#' styles.
#'
#' @param text_color Color for text and foreground, inherits from `text_color`
#' @param background_color Color for background, inherits from
#'   `background_color`
#' @param accent_color Color for titles and accents, inherits from
#'   `header_color`
#' @param accent_secondary_color Color for secondary accents, inherits from
#'   `text_bold_color`
#' @inheritDotParams theme_xaringan_base
#'
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   # Set xaringanthemer theme but save to tempfile
#'   style_duo_accent(outfile = tempfile())
#'
#'   library(ggplot2)
#'   ggplot(iris) +
#'     aes(Petal.Length, Petal.Width) +
#'     geom_point() +
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
  ...
) {
  requires_xaringanthemer_env()
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
    ...
  )
}

#' An Inverse Plot Theme for ggplot2 by xaringanthemer
#'
#' @description
#'
#' **Lifecycle:** [Experimental](https://www.tidyverse.org/lifecycle/#experimental).
#'
#' A [ggplot2] xaringanthemer plot theme to seamlessly match the "inverse"
#' [xaringan] slide colors and styles as styled by [xaringanthemer].
#'
#' @param text_color Color for text and foreground, inherits from `text_color`
#' @param background_color Color for background, inherits from
#'   `background_color`
#' @param accent_color Color for titles and accents, inherits from
#'   `header_color`
#' @param accent_secondary_color Color for secondary accents, inherits from
#'   `text_bold_color`
#' @inheritDotParams theme_xaringan_base
#'
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   # Set xaringanthemer theme but save to tempfile
#'   style_duo_accent(outfile = tempfile())
#'
#'   library(ggplot2)
#'   ggplot(iris) +
#'     aes(Petal.Length, Petal.Width) +
#'     geom_point() +
#'     theme_xaringan()
#' }
#' @return A ggplot2 theme
#' @family xaringanthemer ggplot2 themes
#' @export
theme_xaringan_inverse <- function(
  text_color = NULL,
  background_color = NULL,
  accent_color = NULL,
  accent_secondary_color = NULL,
  ...
) {
  requires_xaringanthemer_env()
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
    ...
  )
}

#' The ggplot2 xaringanthemer base plot theme
#'
#' @description
#'
#' **Lifecycle:** [Experimental](https://www.tidyverse.org/lifecycle/#experimental).
#'
#' Provides a base plot theme for [ggplot2] to match the [xaringan] slide theme
#' created by [xaringanthemer]. The theme is designed to create a general plot
#' style from two colors, a `background_color` and a `text_color` (or foreground
#' color). Also accepts an `accent_color` and an `accent_secondary_color` that are
#' [xaringanthemer] is not required for the base theme. Use
#' [theme_xaringan()] or [theme_xaringan_inverse()] in xaringan slides styled by
#' xaringanthemer for a plot theme that matches the slide style.
#'
#' @param text_color Color for text and foreground
#' @param background_color Color for background
#' @param accent_color Color for titles and accents, inherits from
#'   `header_color` or `text_color`. Used for the `title` base setting in
#'   [ggplot2::theme()], and additionally for setting the `color` or `fill` of
#'   [ggplot2] geom defaults.
#' @param accent_secondary_color Color for secondary accents, inherits from
#'   `text_bold_color` or `accent_color`. Used only when setting [ggplot2] geom
#'   defaults.
#' @param set_ggplot_defaults Should defaults be set for [ggplot2] _geoms_?
#'   Defaults to TRUE. To restore ggplot's defaults, or the previously set geom
#'   defaults, see [theme_xaringan_restore_defaults()].
#' @param text_font Font to use for text elements, passed to
#'   [sysfonts::font_add_google()], if available and `text_font_use_google` is
#'   `TRUE`. Inherits from `text_font_family`.
#' @param text_font_use_google Is `text_font` available on [Google
#'   Fonts](https://fonts.google.com)?
#' @param text_font_size Base text font size, inherits from `text_font_size`, or
#'   defaults to 11.
#' @param title_font Font to use for title elements, passed to
#'   [sysfonts::font_add_google()], if available and `title_font_use_google` is
#'   `TRUE`. Inherits from `title_font_family`.
#' @param title_font_use_google Is `title_font` available on [Google
#'   Fonts](https://fonts.google.com)?
#' @param title_font_size Base text font size, inherits from `title_font_size`,
#'   or defaults to 14.
#' @param ... Ignored
#'
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   library(ggplot2)
#'   ggplot(iris) +
#'     aes(Petal.Length, Petal.Width) +
#'     geom_point() +
#'     theme_xaringan_base(
#'       text_color = "#e1e5f2",
#'       background_color = "#021c25",
#'       accent_color = "#1f7a8c",
#'       set_ggplot_defaults = TRUE
#'     ) +
#'     labs(
#'       title = "Basic Iris Plot",
#'       subtitle = "+ theme_xaringan_base()",
#'       caption = "{xaringanthemer}"
#'     )
#'
#'   ggplot(iris) +
#'     aes(Petal.Length, Petal.Width) +
#'     geom_point() +
#'     theme_xaringan_base(
#'       text_color = "#021c25",
#'       background_color = "#e1e5f2",
#'       accent_color = "#1f7a8c",
#'       set_ggplot_defaults = TRUE
#'     ) +
#'     labs(
#'       title = "Basic Iris Plot",
#'       subtitle = "+ theme_xaringan_base()",
#'       caption = "{xaringanthemer}"
#'     )
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
  title_font_size = NULL
) {
  blend <- color_blender(text_color, background_color)

  text_font_size <- text_font_size %||% web_to_point(xaringanthemer_env$text_font_size, scale = 1.25) %||% 11
  title_font_size <- title_font_size %||% web_to_point(xaringanthemer_env$header_h3_font_size, scale = 0.8) %||% 14

  text_font <- if (!is.null(text_font)) {
    register_font(text_font, identical(text_font_use_google, TRUE))
  } else {
    get_theme_font("text")
  }
  title_font <- if (!is.null(title_font)) {
    register_font(title_font, identical(title_font_use_google, TRUE))
  } else {
    get_theme_font("header")
  }

  text_font %||% "sans"
  title_font %||% "sans"

  if (set_ggplot_defaults) {
    accent_color <- accent_color %||% xaringanthemer_env$header_color %||% text_color
    accent_secondary_color <- accent_secondary_color %||% xaringanthemer_env$text_bold_color %||% accent_color
    theme_xaringan_set_defaults(text_color, background_color, accent_color, accent_secondary_color)
  }

  ggplot2::theme(
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
    legend.key = element_rect(fill = "transparent", colour = NA),
    plot.caption = ggplot2::element_text(
      size = text_font_size * 0.8,
      color = blend(0.3)
    )
  )
}

#' Set and Restore ggplot2 geom Defaults
#'
#' @description
#'
#' **Lifecycle:** [Experimental](https://www.tidyverse.org/lifecycle/#experimental).
#'
#' Set [ggplot2] _geom_ defaults to match [theme_xaringan()] with
#' `theme_xaringan_set_defaults()` and restore the standard or previously-set
#' defaults with `theme_xaringan_restore_defaults()`. By default,
#' `theme_xaringan_set_defaults()` is run with [theme_xaringan()] or
#' [theme_xaringan_inverse()].
#'
#' @family xaringanthemer ggplot2 themes
#' @inheritParams theme_xaringan
#' @return Invisibly returns a list of the current ggplot2 geom defaults
#' @export
theme_xaringan_set_defaults <- function(
  text_color = NULL,
  background_color = NULL,
  accent_color = text_color,
  accent_secondary_color = accent_color,
  text_family = NULL
) {
  requires_package("ggplot2")

  blend <- color_blender(text_color, background_color)

  xaringan_theme_defaults <- list(
    "line"       = list(color  = text_color),
    "vline"      = list(color  = accent_secondary_color),
    "hline"      = list(color  = accent_secondary_color),
    "abline"     = list(color  = accent_secondary_color),
    "segment"    = list(color  = text_color),
    "bar"        = list(fill   = accent_color),
    "col"        = list(fill   = accent_color),
    "boxplot"    = list(color  = text_color),
    "contour"    = list(color  = text_color),
    "density"    = list(color  = text_color,
                        fill   = text_color,
                        alpha  = 0.1),
    "dotplot"    = list(color  = accent_color),
    "errorbarh"  = list(color  = text_color),
    "crossbar"   = list(color  = text_color),
    "errorbar"   = list(color  = text_color),
    "linerange"  = list(color  = text_color),
    "pointrange" = list(color  = text_color),
    "map"        = list(color  = text_color),
    "path"       = list(color  = text_color),
    "line"       = list(color  = text_color),
    "step"       = list(color  = text_color),
    "point"      = list(color  = accent_color),
    "polygon"    = list(color  = accent_color,
                        fill   = accent_color),
    "quantile"   = list(color  = text_color),
    "rug"        = list(color  = blend(0.5)),
    "segment"    = list(color  = text_color),
    "smooth"     = list(fill   = blend(0.75),
                        color  = accent_secondary_color),
    "spoke"      = list(color  = text_color),
    "label"      = list(color  = text_color,
                        family = text_family %||% get_theme_font("text")),
    "text"       = list(color  = text_color,
                        family = text_family %||% get_theme_font("text")),
    "rect"       = list(fill   = text_color),
    "tile"       = list(fill   = text_color),
    "violin"     = list(fill   = text_color),
    "sf"         = list(color  = text_color)
  )

  geom_names <- setNames(nm = names(xaringan_theme_defaults))

  previous_defaults <- lapply(
    geom_names,
    function(geom) safely_set_geom(geom, xaringan_theme_defaults[[geom]])
  )

  if (is.null(xaringanthemer_env$old_ggplot_defaults)) {
    xaringanthemer_env$old_ggplot_defaults <- previous_defaults
  }

  invisible(previous_defaults)
}

#' @describeIn theme_xaringan_set_defaults Restore previous or standard [ggplot2] _geom_ defaults.
#' @inheritParams theme_xaringan
#' @return Invisibly returns a list of the current ggplot2 geom defaults
#' @export
xaringan_theme_restore_defaults <- function() {
  requires_package("ggplot2")
  requires_xaringanthemer_env()

  if (is.null(xaringanthemer_env$old_ggplot_defaults)) {
    return(invisible())
  }


  old_default <- xaringanthemer_env$old_ggplot_defaults
  old_default_not_std <- vapply(old_default, function(x) length(x) > 0, logical(1))
  old_default <- old_default[old_default_not_std]

  restore_default <- utils::modifyList(xaringanthemer_env$std_ggplot_defaults, old_default)

  geom_names <- setNames(nm = names(restore_default))
  previous_defaults <- lapply(
    geom_names,
    function(geom) safely_set_geom(geom, restore_default[[geom]])
  )

  invisible(previous_defaults)
}

safely_set_geom <- function(geom, new) {
  tryCatch(
    {
      ggplot2::update_geom_defaults(geom, new)
    },
    error = function(e) invisible(),
    warning = function(w) invisible()
  )
}


# Color Scales ------------------------------------------------------------

#' Xaringan Themer ggplot2 Scales
#'
#' @description
#'
#' **Lifecycle:** [Experimental](https://www.tidyverse.org/lifecycle/#experimental).
#'
#' Color and fill single-color scales for discrete and continuous values,
#' created using the primary accent color of the xaringanthemer styles.
#'
#' @param ... Arguments passed on to the appropriate scale function, one of
#'   [colorspace::scale_color_discrete_sequential],
#'   [colorspace::scale_color_continuous_sequential],
#'   [colorspace::scale_fill_discrete_sequential], or
#'   [colorspace::scale_fill_continuous_sequential].
#' @param color A color value, in hex, to override the default color. Otherwise,
#'   the primary color of the resulting scale is chosen from the xaringanthemer
#'   slide styles.
#' @param inverse If `color` is not supplied and `inverse = TRUE`, a primary
#'   color is chosen to work well with the inverse slide styles, namely the
#'   value of `inverse_header_color`
#' @param direction Direction of the discrete scale. Use values less than 0 to
#'   reverse the direction, e.g. `direction = -1`.
#' @inheritParams colorspace::scale_color_continuous_sequential
#' @param ... Additional arguments passed to [ggplot2::continuous_scale()] or
#'   [ggplot2:discrete_scale()].
#' @param aes_type The type of aesthetic to which the scale is being applied.
#'   One of "color", "colour", or "fill".
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
  aes_type <- match.arg(aes_type)
  color <- hex2HCL(get_theme_accent_color(color, inverse))

  colors <- colorspace::sequential_hcl(
    n = 12,
    c1 = color[1, "C"],
    l1 = color[1, "L"],
    h1 = color[1, "H"],
    rev = TRUE
  )

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
  colorspace::coords(as(colorspace::hex2RGB(x), "polarLUV"))
}


# Fonts -------------------------------------------------------------------

get_theme_font <- function(element = c("text", "header", "code")) {
  element <- match.arg(element)

  element_family <- paste0(element, "_font_family")
  element_google <- paste0(element, "_font_google")
  element_url <- paste0(element, "_font_url")

  family <- xaringanthemer_env[[element_family]]
  is_google_font <- !is.null(xaringanthemer_env[[element_google]]) ||
    grepl("fonts.google", xaringanthemer_env[[element_url]], fixed = TRUE)

  register_font(family, google = is_google_font, fn = sys.calls()[[max(1, length(sys.calls()) - 1)]])
}

register_font <- function(
  family,
  google = TRUE,
  fn = sys.calls()[[max(1, length(sys.calls()) - 1)]][[1]],
  ...
) {
  if (is.null(family)) {
    return(NULL)
  }
  family <- gsub("['\"]", "", family)

  if (!identical(xaringanthemer_env$showtext_auto, TRUE)) {
    if (requires_package(pkg = "showtext", fn, required = FALSE)) {
      showtext::showtext_auto()
    } else {
      return(family)
    }
    xaringanthemer_env$showtext_auto <- TRUE
  }

  if (!requires_package(pkg = "sysfonts", fn, required = FALSE)) {
    return(family)
  } else if (!family %in% sysfonts::font_families()) {
    is_default_font <- family %in% c(
      "Roboto",
      "Source Code Pro",
      "Yanone Kaffeesatz"
    )
    if (identical(google, TRUE) || is_default_font) {
      tryCatch(
        sysfonts::font_add_google(family, ...),
        error = function(e) warning(e$message),
        warning = function(w) warning(w$message)
      )
    } else {
      warning(paste(
        "Please manually register fonts not served by Google Fonts.",
        "See `sysfonts::font_add()` for more information."
      ))
    }
  }
  family
}

requires_package <- function(pkg = "ggplot2", fn = "", required = TRUE) {
  raise <- if (required) stop else warning
  if (!requireNamespace(pkg, quietly = TRUE)) {
    msg <- paste0(
      "`",
      pkg,
      "` is ",
      if (required) "required " else "suggested ",
      if (fn != "") paste0("by ", fn, "() ")[1],
      "but is not installed."
    )
    raise(msg, call. = FALSE)
    invisible(FALSE)
  }
  invisible(TRUE)
}

requires_xaringanthemer_env <- function() {
  if (!exists("xaringanthemer_env") || is.null(xaringanthemer_env$header_color)) {
    stop("Please call a xaringanthemer theme function first.")
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
#' @export
theme_xaringan_get_value <- function(setting) {
  requires_xaringanthemer_env()
  if (length(setting) > 1) {
    xaringanthemer_env[setting]
  } else {
    xaringanthemer_env[[setting]]
  }
}

web_to_point <- function(x, px_per_em = 16, scale = 1) {
  if (is.null(x)) {
    return(NULL)
  }
  if (grepl("pt$", x)) {
    return(as.numeric(sub("pt$", "", x)))
  } else if (grepl("px$", x)) {
    x <- as.numeric(sub("px$", "", x))
    return(x * 0.75)
  } else if (grepl("em$", x)) {
    x <- as.numeric(sub("em$", "", x))
    return(x * px_per_em * 0.75)
  } else {
    return()
  }
}
