test_that("read theme settings from css variables", {
  expected_vars <- list(
    background_color = "#E9EBEE",
    text_color = "#18273F",
    header_color = "#23395b",
    text_bold_color = "#23395b",
    inverse_background_color = "#23395b",
    inverse_text_color = "#E9EBEE",
    inverse_header_color = "#E9EBEE",
    text_font_size = "20px",
    header_h3_font_size = "35px",
    text_font_family = "'Noto Serif'",
    text_font_is_google = TRUE,
    header_font_family = "'Yanone Kaffeesatz'",
    header_font_is_google = FALSE,
    code_font_family = "'Source Code Pro'",
    code_font_is_google = FALSE
  )

  css_vars <- read_css_vars(testthat::test_path("css/mono_light.css"))
  for (var in names(expected_vars)) {
    expect_equal(!!css_vars[[var]], !!expected_vars[[var]])
  }
})
