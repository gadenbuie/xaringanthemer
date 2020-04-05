#' @param extra_css A named list of CSS definitions each containing a named list
#'   of CSS property-value pairs, i.e.
#'   \code{list(".class-id" = list("css-property" = "value"))}.
#' @param extra_fonts A list of additional fonts to import, each list element
#'   can be either a URL as a character string or a call to
#'   \code{\link{google_font}()}. To use a font imported in `extra_fonts`, you
#'   will need to write custom CSS rules that apply the font to an element or
#'   class with the `font-family` property. See the **Fonts** section of
#'   `vignette("xaringanthemer")` for an example.
#' @param colors A named vector of custom colors. The names of the colors
#'   become CSS variables and classes that can be used within your slides.
#'   For example, `colors = c(blue = "#bad4ed")` adds a CSS variable
#'   `--blue`, a `.blue` CSS class that applies the color to the text or
#'   foreground color, and a `.bg-blue` CSS class that applies the color
#'   to the background.
#' @param outfile Customized xaringan CSS output file name, default is "xaringan-themer.css"
#' @family themes
