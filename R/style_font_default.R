#' @describeIn style_xaringan Default values for font family, weight, URLs and
#'   font fallbacks.
#' @param font_arg A font argument from the \pkg{xaringanthemer} `style_`
#'   function family.
#' @export
xaringanthemer_font_default <- function(font_arg) {
  x <- switch(
    font_arg,
    text_font_family = "Noto Sans",
    text_font_weight = "normal",
    text_font_url = "https://fonts.googleapis.com/css?family=Noto+Sans:400,400i,700,700i&display=swap",
    text_font_family_fallback = "-apple-system, BlinkMacSystemFont, avenir next, avenir, helvetica neue, helvetica, Ubuntu, roboto, noto, segoe ui, arial",
    header_font_family = "Cabin",
    header_font_weight = "600",
    header_font_url = "https://fonts.googleapis.com/css?family=Cabin:600,600i&display=swap",
    code_font_family = "Source Code Pro",
    code_font_url = "https://fonts.googleapis.com/css?family=Source+Code+Pro:400,700&display=swap",
    code_font_family_fallback = "Menlo, Consolas, Monaco, Liberation Mono, Lucida Console",
    stop("unknown font_arg: ", font_arg)
  )
  class(x) <- c("xaringanthemer_default", class(x))
  x
}

print.xaringanthemer_default <- function(x) {
  print(unclass(x))
}
