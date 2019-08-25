source(here::here("R/theme_settings.R"))
# R/theme_settings.R contains element_description() and plural_elements()

setup_theme_function <- function(
  f_name = "style_xaringan",
  template = template_variables,
  ...,
  file = "",
  body = c(
    "  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R",
    "  eval(parse(text = call_style_xaringan()))"
  )
) {
  if (file == "clip" && !requireNamespace("clipr", quietly = TRUE)) file <- ""
  tv <- template
  null_default <- purrr::map_lgl(tv$default, is.null)
  tv[null_default, "default"] <- "{NULL}"
  x <- c(
    as.character(
      glue::glue_data(
        tv,
        "#' @param {variable} {description}. ",
        "Defaults to {gsub('[{{}}]', '`', default)}. ",
        "{element_description(element)}"
      )
    ),
    "#' @template extra_css",
    "#' @param outfile Customized xaringan CSS output file name, default is \"xaringan-themer.css\"",
    "#' @family themes",
    ...,
    glue::glue("{f_name} <- function("),
    as.character(
      glue::glue_data(
        tv,
        "  {variable} = {ifelse(!grepl('^[{].+[}]$', default), paste0('\"', default, '\"'), gsub('[{}]', '', default))},"
      )
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
  "style_xaringan",
  template_variables,
  "#' @template style_xaringan",
  "#' @export",
  body = paste0("  ", readLines(here::here("inst/scripts/style_xaringan_body.R"))),
  file = here::here("R/style_xaringan.R")
)

# ---- Monotone Light ----
setup_theme_function(
  "style_mono_light",
  template_mono_light,
  "#' @template style_mono_light",
  "#' @family Monotone themes",
  "#' @export",
  file = here::here("R/style_mono_light.R")
)

# ---- Monotone Dark ----
setup_theme_function(
  "style_mono_dark",
  template_mono_dark,
  "#' @template style_mono_dark",
  "#' @family Monotone themes",
  "#' @export",
  file = here::here("R/style_mono_dark.R")
)

# ---- Monotone Accent ----
setup_theme_function(
  "style_mono_accent",
  template_mono_accent,
  "#' @template style_mono_accent",
  "#' @family Monotone themes",
  "#' @export",
  file = here::here("R/style_mono_accent.R")
)

# ---- Monotone Accent Inverse ----
setup_theme_function(
  "style_mono_accent_inverse",
  template_mono_accent_inverse,
  "#' @template style_mono_accent_inverse",
  "#' @family Monotone themes",
  "#' @export",
  file = here::here("R/style_mono_accent_inverse.R")
)

# ---- Duotone ----
setup_theme_function(
  "style_duo",
  template_duo,
  "#' @template style_duo",
  "#' @family Duotone themes",
  "#' @export",
  file = here::here("R/style_duo.R")
)

# ---- Duotone Accent ----
setup_theme_function(
  "style_duo_accent",
  template_duo_accent,
  "#' @template style_duo_accent",
  "#' @family Duotone themes",
  "#' @export",
  file = here::here("R/style_duo_accent.R")
)

# ---- Duotone Accent Inverse ----
setup_theme_function(
  "style_duo_accent_inverse",
  template_duo_accent_inverse,
  "#' @template style_duo_accent_inverse",
  "#' @family Duotone themes",
  "#' @export",
  file = here::here("R/style_duo_accent_inverse.R")
)

# ---- Solarized Light ----
setup_theme_function(
  "style_solarized_light",
  template_solarized_light,
  "#' @template style_solarized_light",
  "#' @family Solarized themes",
  "#' @export",
  file = here::here("R/style_solarized_light.R")
)

# ---- Solarized Dark ----
setup_theme_function(
  "style_solarized_dark",
  template_solarized_dark,
  "#' @template style_solarized_dark",
  "#' @family Solarized themes",
  "#' @export",
  file = here::here("R/style_solarized_dark.R")
)
