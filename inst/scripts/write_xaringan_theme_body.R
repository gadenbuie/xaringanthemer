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

tf <- system.file("resources", "template.css", package = "xaringanthemer")
template <- readLines(tf, warn = FALSE)
template <- paste(template, collapse = "\n")
x <- glue::glue(template, .open = "{{", .close = "}}")
writeLines(x, con = outfile)
if (!is.null(extra_css)) write_extra_css(extra_css, outfile)
outfile
