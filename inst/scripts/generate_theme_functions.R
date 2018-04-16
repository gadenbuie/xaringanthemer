source(here::here("R/theme_settings.R"))

setup_theme_function <- function(
  f_name = "write_xaringan_theme",
  template = template_variables,
  ...,
  file = "",
  body = NULL
) {
  `%,%` <- function(x, y) c(x, y)
  if (file == "clip" && !requireNamespace("clipr", quietly = TRUE)) file <- ""
  tv <- template
  null_default <- purrr::map_lgl(tv$default, is.null)
  tv[null_default, 'default'] <- "{NULL}"
  x <-
    as.character(
      glue::glue_data(
        tv, "#' @param {variable} {description}, defaults to {stringr::str_replace_all(default, '[{{}}]', '`')}")) %,%
    "#' @param outfile Customized xaringan CSS output file name" %,%
    c(...) %,%
    glue::glue("{f_name} <- function(") %,%
    as.character(glue::glue_data(
      tv, "  {variable} = {ifelse(!stringr::str_detect(default, '^[{].+[}]$'), paste0('\"', default, '\"'), stringr::str_replace_all(default, '[{}]', ''))},")) %,%
    "  outfile = \"xaringan-themed.css\"" %,%
    ") {"
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
  file = here::here("R/theme.R")
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
