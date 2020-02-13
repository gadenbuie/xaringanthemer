context("test-themes")

test_theme_file <- function(theme = "duo", theme_file = paste0(theme, ".css"), ...) {
  theme_fun <- switch(
    theme,
    "duo" = style_duo,
    "duo_accent" = style_duo_accent,
    "duo_accent_inverse" = style_duo_accent_inverse,
    "mono_accent" = style_mono_accent,
    "mono_accent_inverse" = style_mono_accent_inverse,
    "mono_dark" = style_mono_dark,
    "mono_light" = style_mono_light,
    "solarized_dark" = style_solarized_dark,
    "solarized_light" = style_solarized_light,
    "xaringan" = style_xaringan,
    stop("Unknown theme")
  )

  tmpfile <- tempfile()

  theme_fun(outfile = tmpfile, ..., text_font_google = google_font("Noto Serif"))
  theme_css <- readLines(tmpfile)
  # Mask package version in test files
  theme_css <- sub("( \\*  Version: )[\\d.-]+", "\\1a.b.c.d.eeee", theme_css, perl = TRUE)
  theme_css <- paste(theme_css, collapse = "\n")
  expect_known_output(cat(theme_css), test_path("css", theme_file))
}

test_that("style_duo()", test_theme_file("duo"))
test_that("style_duo_accent()", test_theme_file("duo_accent"))
test_that("style_duo_accent_inverse()", test_theme_file("duo_accent_inverse"))
test_that("style_mono_accent()", test_theme_file("mono_accent"))
test_that("style_mono_accent_inverse()", test_theme_file("mono_accent_inverse"))
test_that("style_mono_dark()", test_theme_file("mono_dark"))
test_that("style_mono_light()", test_theme_file("mono_light"))
test_that("style_solarized_dark()", test_theme_file("solarized_dark"))
test_that("style_solarized_light()", test_theme_file("solarized_light"))

test_that("header_background_auto = TRUE", {
  test_theme_file("duo", "duo-header_bg.css", header_background_auto = TRUE)
  test_theme_file("mono_light", "mono_light-header_bg.css", header_background_auto = TRUE)
  test_theme_file("solarized_dark", "solarized_dark-header_bg.css", header_background_auto = TRUE)
})

test_that("style colors are added to themes", {
  test_theme_file("xaringan", colors = c('light-blue' = "#bad4ed"))
})
