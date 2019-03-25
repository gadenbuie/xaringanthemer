# Make sure font names are wrapped in quotes if they have spaces
f_args <- names(formals(sys.function()))
for (var in f_args[grepl("font_family$", f_args)]) {
  eval(parse(text = paste0(
    var, "<-quote_elements_w_spaces(", var, ")"
  )))
}

# Use font_..._google args to overwrite font args
for (var in f_args[grepl("font_google$", f_args)]) {
  gf <- eval(parse(text = var))
  if (is.null(gf)) next
  if (!inherits(gf, "google_font")) stop(
    "`", var, "` must be set using `google_font()`."
  )
  group <- stringr::str_split(var, "_")[[1]][1]
  if (group == "text") {
    text_font_family <- gf$family
    text_font_weight <- gf$weights %||% "normal"
    text_font_weight <- substr(text_font_weight, 1, regexpr(",", text_font_weight)[1]-1)
    text_font_url    <- gf$url
  } else {
    for (thing in c("family", "url")) {
      eval(parse(text = paste0(
        group, "_font_", thing, " <- gf$", thing
      )))
    }
  }
}

extra_font_imports <- if (is.null(extra_fonts)) "" else list2fonts(extra_fonts)

# convert NA arguments to NULL
for (var in f_args) {
  val <- eval(parse(text = var))
  if (is.null(val)) next
  val <- val[!is.na(val)]
  is_na <- length(val) == 0
  if (is_na) assign(var, NULL)
}

# prepare variables for template
body_font_family <- paste(c(text_font_family, text_font_family_fallback, text_font_base), collapse = ', ')
background_size_fallback <- if (is.null(background_position)) "cover" else "100%"
background_size <- background_image %??% (background_size %||% background_size_fallback)
title_slide_background_size <- title_slide_background_size %||% (
  title_slide_background_image %??% "cover"
)
table_row_even_background_color <- table_row_even_background_color %||% background_color

lapply(names(formals()), function(n) assign(n, get(n), envir = test_env))

xaringanthemer_version <- utils::packageVersion("xaringanthemer")

# prepare header background object
needs_leading_dot <- !grepl("^\\.", header_background_ignore_classes)
header_background_ignore_classes[needs_leading_dot] <- paste0(
  ".", header_background_ignore_classes[needs_leading_dot]
)
header_background_ignore_classes <- purrr::map(
  header_background_ignore_classes,
  ~ list(class = .)
)
header_background <-   list(
  auto = header_background_auto,
  background_color = header_background_color,
  text_color = header_background_text_color,
  padding = header_background_padding,
  content_padding_top = header_background_content_padding_top,
  ignore = header_background_ignore_classes
)

tf <- system.file("resources", "template.css", package = "xaringanthemer")
template <- readLines(tf, warn = FALSE)
template <- paste(template, collapse = "\n")
x <- whisker::whisker.render(template)
writeLines(x, con = outfile)
if (!is.null(extra_css)) write_extra_css(extra_css, outfile)
outfile
