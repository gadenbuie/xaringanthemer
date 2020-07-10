`%||%` <- function(x, y) if (is.null(x)) y else x

`%??%` <- function(x, y) if (!is.null(x)) y else NULL

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
    return(invisible(FALSE))
  }
  invisible(TRUE)
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
#' `...` parameters. Languages can be specified in `languages` and must one or
#' more of the language codes as given by `google_language_codes()`.
#'
#' @examples
#' google_font("Josefin Sans", "400", "400i", "600i", "700")
#' google_font("Josefin Sans", languages = c("latin-ext", "vietnamese"))
#' @param family Font family
#' @param ... Font weights to include, example "400", "400i"
#' @param languages Font languages to include (dependent on the font.) See
#'   [google_language_codes()].
#' @return A `"google_font"` object.
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
        if (!is.null(languages)) paste0("&subset=", languages),
        "&display=swap"
      )
    ),
    class = "google_font"
  )
}

is_google_font <- function(x) inherits(x, "google_font")

#' @title List Valid Google Language Codes
#' @description Gives a list of valid Language Codes for Google Fonts, or
#'   validates that the language codes given are valid.
#' @seealso [google_font()]
#' @param language_codes Vector of potential Google language codes
#' @return A vector of Google Font language codes matching `language_codes`.
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

str_wrap <- function(...) {
  paste(strwrap(paste0(...)), collapse = "\n")
}
