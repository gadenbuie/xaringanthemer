force(text_font_family)
force(text_font_weight)
force(text_font_url)
force(text_font_family_fallback)
force(header_font_family)
force(header_font_weight)
force(header_font_url)
force(code_font_family)
force(code_font_url)
force(code_font_family_fallback)

# the defaults are google fonts
is_default <- function(type, suffix) {
  # check if font arg value is from xaringanthemer_font_default
  var <- paste0(type, "_", suffix)
  inherits(
    get(var, envir = parent.frame(2), inherits = FALSE),
    "xaringanthemer_default"
  )
}
for (var in c("text", "header", "code")) {
  suffixes <- c("font_family", "font_weight", "font_url")
  if (var == "code") suffixes <- setdiff(suffixes, "font_weight")
  var_is_google <- all(vapply(suffixes, is_default, logical(1), type = var))
  var_is_google <- as.integer(var_is_google)
  r_set_font_is_google <- glue::glue("{var}_font_is_google <- {var_is_google}")
  eval(parse(text = r_set_font_is_google))
}

# Make sure font names are wrapped in quotes if they have spaces
f_args <- names(formals(sys.function()))
for (var in f_args[grepl("font_family$", f_args)]) {
  var_value <- get(var, inherits = FALSE)
  if (!is.null(var_value)) {
    eval(parse(text = paste0(var, "<-quote_elements_w_spaces(", var, ")")))
  }
}

# Warn if base_font_size isn't absolute
css_abs_units <- c("cm", "mm", "Q", "in", "pc", "pt", "px")
if (!grepl(paste(tolower(css_abs_units), collapse = "|"), tolower(base_font_size))) {
  warning(
    glue::glue(
      "Base font size '{base_font_size}' is not in absolute units. ",
      "For best results, specify the `base_font_size` using absolute CSS units: ",
      "{paste(css_abs_units, collapse = ', ')}"
    ),
    call. = FALSE,
    immediate. = TRUE
  )
}

# If certain colors aren't in hexadecimal it may cause problems with theme_xaringan()
# TODO: at some point I'd rather be able to process CSS colors or variables
colors_used_by_theme_xaringan <- list(
  background_color = background_color,
  text_color = text_color,
  header_color = header_color,
  text_bold_color = text_bold_color,
  inverse_background_color = inverse_background_color,
  inverse_text_color = inverse_text_color,
  inverse_header_color = inverse_header_color
)
colors_used_by_theme_xaringan <- purrr::discard(colors_used_by_theme_xaringan, is.null)
colors_are_hex <- purrr::map_lgl(colors_used_by_theme_xaringan, check_color_is_hex, throw = NULL)

if (any(!colors_are_hex)) {
  colors_better_as_hex <- names(colors_used_by_theme_xaringan)[!colors_are_hex]
  colors_better_as_hex <- paste(colors_better_as_hex, collapse = ", ")
  warning(
    glue::glue("Colors that will be used by `theme_xaringan()` need to be in ",
               "hexadecimal format: {colors_better_as_hex}"),
    immediate. = TRUE,
    call. = FALSE
  )
}

# Use font_..._google args to overwrite font args
for (var in f_args[grepl("font_google$", f_args)]) {
  gf <- eval(parse(text = var))
  if (is.null(gf)) next
  if (!inherits(gf, "google_font")) {
    stop("`", var, "` must be set using `google_font()`.")
  }
  group <- strsplit(var, "_")[[1]][1]
  if (group == "text") {
    text_font_family <- quote_elements_w_spaces(gf$family)
    text_font_weight <- gf$weights %||% "normal"
    if (grepl(",", text_font_weight)) {
      # Use first font weight if multiple are imported
      text_font_weight <- substr(text_font_weight, 1, regexpr(",", text_font_weight)[1] - 1)
    }
    text_font_url <- gf$url
  } else {
    eval(parse(text = paste0(group, "_font_family <- quote_elements_w_spaces(gf$family)")))
    eval(parse(text = paste0(group, "_font_url <- gf$url")))
  }
  eval(parse(text = paste0(group, "_font_is_google <- 1")))
}

extra_font_imports <- if (is.null(extra_fonts)) "" else list2fonts(extra_fonts)
extra_font_imports <- paste(extra_font_imports, collapse = "\n")

# convert NA arguments to NULL
for (var in f_args) {
  val <- eval(parse(text = var))
  if (is.null(val)) next
  val <- val[!is.na(val)]
  is_na <- length(val) == 0
  if (is_na) assign(var, NULL, envir = sys.frame(sys.nframe()))
}

# prepare variables for template
body_font_family <- paste(c(text_font_family, text_font_family_fallback, text_font_base), collapse = ", ")
background_size_fallback <- if (is.null(background_position)) "cover" else "100%"
background_size <- background_image %??% (background_size %||% background_size_fallback)
title_slide_background_size <- title_slide_background_size %||% (
  title_slide_background_image %??% "cover"
)
table_row_even_background_color <- table_row_even_background_color %||% background_color

# stash theme settings in package env
lapply(f_args, function(n) assign(n, get(n), envir = xaringanthemer_env))
for (font_is_google in paste0(c("text", "code", "header"), "_font_is_google")) {
  assign(
    font_is_google,
    get(font_is_google, inherits = FALSE) == 1,
    envir = xaringanthemer_env
  )
}

xaringanthemer_version <- utils::packageVersion("xaringanthemer")

# prepare header background object
needs_leading_dot <- !grepl("^\\.", header_background_ignore_classes)
header_background_ignore_classes[needs_leading_dot] <- paste0(
  ".",
  header_background_ignore_classes[needs_leading_dot]
)
header_background_ignore_classes <- purrr::map(
  header_background_ignore_classes,
  ~ list(class = .)
)
if (is.null(header_background_padding)) {
  slide_padding <- css_get_padding(padding)
  header_background_padding <- paste(
    "2rem", slide_padding$right, "1.5rem", slide_padding$left
  )
}
header_background <- list(
  auto = header_background_auto,
  background_color = header_background_color,
  text_color = header_background_text_color,
  padding = header_background_padding,
  content_padding_top = header_background_content_padding_top,
  ignore = header_background_ignore_classes
)

colors <- prepare_colors(colors)

tf <- system.file("resources", "template.css", package = "xaringanthemer")
template <- readLines(tf, warn = FALSE)
template <- paste(template, collapse = "\n")
x <- whisker::whisker.render(template)
if (!is.null(extra_css)) {
  x <- c(x, style_extra_css(extra_css, outfile = NULL))
}
if (is.null(outfile)) {
  return(x)
}
writeLines(x, con = outfile)
invisible(outfile)
