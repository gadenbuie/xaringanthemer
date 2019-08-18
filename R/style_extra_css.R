#' Add Extra CSS Styles
#'
#' Adds css elements to target `outfile`, typically a xaringanthemer css file.
#' The `css` argument takes a list of CSS classes and definitions (see examples below)
#' and appends CSS rules to `outfile`.
#'
#' @section css list:
#' The `css` input must be a named list of css properties and values within a
#' named list of class identifiers, for example
#' `list(".class-id" = list("css-property" = "value"))`.
#'
#' @param css A named list of CSS definitions each containing a named list
#'   of CSS property-value pairs, i.e.
#'   `list(".class-id" = list("css-property" = "value"))`
#'
#' @examples
#' style_extra_css(
#'   outfile = stdout(),
#'   css =  list(
#'     ".red"   = list(color = "red"),
#'     ".small" = list("font-size" = "90%"),
#'     ".full-width" = list(
#'       display = "flex",
#'       width   = "100%",
#'       flex    = "1 1 auto"
#'     )
#'   )
#' )
#'
#' @inheritParams style_xaringan
#' @export
style_extra_css <- function(css, outfile = "xaringan-themer.css") {
  cat("\n\n/* Extra CSS */", list2css(css), file = outfile,
      append = TRUE, sep = "\n")
}

#' @inheritParams style_extra_css
#' @keywords internal
list2css <- function(css) {
  `%.%` <- function(x, y) paste0(x, y)
  error <- NULL
  if (is.null(names(css))) {
    stop("All elements in `css` list must be named", call. = FALSE)
  }
  if (purrr::vec_depth(css) != 3) {
    stop("`css` list must be a named list within a named list, e.g.:\n",
         '  list(".class-id" = list("css-property" = "value"))')
  }
  if (any(names(css) == "")) {
    not_named <- which(names(css) == "")
    if (length(not_named) > 1) stop(call. = FALSE,
      "All elements in `css` list must be named. Items ",
      paste(not_named, collapse = ", "), " are unnamed."
    ) else stop(call. = FALSE,
      "All elements in `css` list must be named. Item ", not_named, " is not named.")
  }
  child_unnamed <- purrr::map_lgl(purrr::map(css, ~ {is.null(names(.)) || names(.) == ""}), ~ any(.))
  if (any(child_unnamed)) {
    has_unnamed <- names(css)[child_unnamed]
    msg <- paste(
      "All properties of elements in `css` list must be named.",
      if (length(has_unnamed) > 1) "Elements" else "Element",
      paste(has_unnamed, collapse = ", "),
      if (length(has_unnamed) > 1) "have" else "has",
      "unnamed property or properties."
    )
    stop(msg, call. = FALSE)
  }

  purrr::map_chr(names(css), function(el) {
    paste(sep = "\n",
      el %.% " {",
      paste(
        purrr::map_chr(names(css[[el]]), function(prop) {
          "  " %.% prop %.% ': ' %.% css[[el]][[prop]] %.% ';'
        }),
        collapse = "\n"
      ),
      "}"
    )
  })
}

list2fonts <- function(fonts) {
  if (inherits(fonts, "google_font")) {
    fonts <- list(fonts)
  }
  fonts <- purrr::map_chr(fonts, function(f) {
    if (inherits(f, "google_font")) {
      f$url
    } else if (inherits(f, "character")) {
      f
    } else NA_character_
  })
  paste0("@import url(", fonts[!is.na(fonts)], ");")
}
