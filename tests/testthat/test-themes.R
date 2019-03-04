context("test-themes")

test_theme_file <- function(theme = "duo", theme_file = paste0(theme, ".css"), ...) {
  theme_fun <- switch(
    theme,
    "duo" = duo,
    "duo_accent" = duo_accent,
    "duo_accent_inverse" = duo_accent_inverse,
    "mono_accent" = mono_accent,
    "mono_accent_inverse" = mono_accent_inverse,
    "mono_dark" = mono_dark,
    "mono_light" = mono_light,
    "solarized_dark" = solarized_dark,
    "solarized_light" = solarized_light,
    stop("Unknown theme")
  )

  tmpfile <- tempfile()

  theme_fun(outfile = tmpfile, ...)
  theme_css <- readLines(tmpfile)
  # Mask package version in test files
  theme_css <- sub("( \\*  Version: )[\\d.-]+", "\\1a.b.c.d.eeee", theme_css, perl = TRUE)
  theme_css <- paste(theme_css, collapse = "\n")
  expect_known_output(cat(theme_css), test_path("css", theme_file))
}

test_that("duo()", test_theme_file("duo"))
test_that("duo_accent()", test_theme_file("duo_accent"))
test_that("duo_accent_inverse()", test_theme_file("duo_accent_inverse"))
test_that("mono_accent()", test_theme_file("mono_accent"))
test_that("mono_accent_inverse()", test_theme_file("mono_accent_inverse"))
test_that("mono_dark()", test_theme_file("mono_dark"))
test_that("mono_light()", test_theme_file("mono_light"))
test_that("solarized_dark()", test_theme_file("solarized_dark"))
test_that("solarized_light()", test_theme_file("solarized_light"))

test_that("header_background_enable = TRUE", {
  test_theme_file("duo", "duo-header_bg.css", header_background_enable = TRUE)
  test_theme_file("mono_light", "mono_light-header_bg.css", header_background_enable = TRUE)
  test_theme_file("solarized_dark", "solarized_dark-header_bg.css", header_background_enable = TRUE)
})
