source(here::here("R/theme_settings.R"))

plural_element <- function(css_name) {
  is_mult <- grepl(",|and|or", css_name)
  is_class <- grepl("^\\.", css_name)
  ifelse(is_class,
    ifelse(is_mult, "classes", "class"),
    ifelse(is_mult, "elements", "element")
  )
}

element_description <- function(element) {
  ifelse(
    grepl("multiple", element),
    "Modifies multiple CSS classes or elements.",
    glue::glue("Modifies the `{element}` {plural_element(element)}.")
    )
}

setup_theme_function <- function(
  f_name = "write_xaringan_theme",
  template = template_variables,
  ...,
  file = "",
  body = NULL
) {
  if (file == "clip" && !requireNamespace("clipr", quietly = TRUE)) file <- ""
  tv <- template
  null_default <- purrr::map_lgl(tv$default, is.null)
  tv[null_default, 'default'] <- "{NULL}"
  x <- c(
    as.character(
      glue::glue_data(
        tv,
        "#' @param {variable} {description}. ",
        "Defaults to {stringr::str_replace_all(default, '[{{}}]', '`')}. ",
        "{element_description(element)}")
    ),
    "#' @template extra_css",
    "#' @param outfile Customized xaringan CSS output file name, default is \"xaringan-themer.css\"",
    "#' @family themes",
    ...,
    glue::glue("{f_name} <- function("),
    as.character(
      glue::glue_data(
        tv,
        "  {variable} = {ifelse(!stringr::str_detect(default, '^[{].+[}]$'), paste0('\"', default, '\"'), stringr::str_replace_all(default, '[{}]', ''))},")
    ),
    "  extra_css = NULL,",
    "  extra_fonts = NULL,",
    "  outfile = \"xaringan-themer.css\"",
    ") {"
  )
  if (!is.null(body)) x <- c(x, body, "}")
  if (file == "clip") {
    clipr::write_clip(x)
    message("Wrote ", f_name, " function signature to clipboard.")
  } else {
    cat(x, sep = "\n", file = file)
    message("Wrote ", f_name, " to ", file)
  }
  invisible()
}

# ---- Write Xaringan Theme Function ----
setup_theme_function(
  "write_xaringan_theme",
  template_variables,
  "#' @template write_xaringan_theme",
  "#' @export",
  body = paste0("  ", readLines(here::here("inst/scripts/write_xaringan_theme_body.R"))),
  file = here::here("R/write_theme.R")
)

# ---- Monotone Light ----
setup_theme_function(
  "mono_light",
  template_mono_light,
  "#' @template mono_light",
  "#' @family Monotone themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/mono_light.R")
)

# ---- Monotone Dark ----
setup_theme_function(
  "mono_dark",
  template_mono_dark,
  "#' @template mono_dark",
  "#' @family Monotone themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/mono_dark.R")
)

# ---- Monotone Accent ----
setup_theme_function(
  "mono_accent",
  template_mono_accent,
  "#' @template mono_accent",
  "#' @family Monotone themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/mono_accent.R")
)

# ---- Monotone Accent Inverse ----
setup_theme_function(
  "mono_accent_inverse",
  template_mono_accent_inverse,
  "#' @template mono_accent_inverse",
  "#' @family Monotone themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/mono_accent_inverse.R")
)

# ---- Duotone ----
setup_theme_function(
  "duo",
  template_duo,
  "#' @template duo",
  "#' @family Duotone themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/duo.R")
)

# ---- Duotone Accent ----
setup_theme_function(
  "duo_accent",
  template_duo_accent,
  "#' @template duo_accent",
  "#' @family Duotone themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/duo_accent.R")
)

# ---- Duotone Accent Inverse ----
setup_theme_function(
  "duo_accent_inverse",
  template_duo_accent_inverse,
  "#' @template duo_accent_inverse",
  "#' @family Duotone themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/duo_accent_inverse.R")
)

# ---- Solarized Light ----
setup_theme_function(
  "solarized_light",
  template_solarized_light,
  "#' @template solarized_light",
  "#' @family Solarized themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/solarized_light.R")
)

# ---- Solarized Dark ----
setup_theme_function(
  "solarized_dark",
  template_solarized_dark,
  "#' @template solarized_dark",
  "#' @family Solarized themes",
  "#' @export",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_write_xaringan_theme()))"
  ),
  file = here::here("R/solarized_dark.R")
)
