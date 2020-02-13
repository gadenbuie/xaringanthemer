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

describe("find and choose xaringan themer files", {
  tmpdir <- tempfile()
  dir.create(tmpdir)

  mono_light_css <- normalizePath(test_path("css/mono_light.css"))

  xaringan_css <- normalizePath(test_path("css/xaringan.css"))

  owd <- setwd(tmpdir)
  on.exit(setwd(owd))

  file.copy(mono_light_css, tmpdir)

  it("finds xaringan themer files with non-standard names", {
    candidates <- find_xaringan_themer_css()
    picked <- choose_xaringan_themer_css(candidates)
    expect_equal(candidates, "./mono_light.css")
    expect_equal(picked, "./mono_light.css")
  })

  it("finds xaringan themer files in presence of other .css files", {
    writeLines(c(
      "html {",
      "  color: red;",
      "}"
    ), "styles.css")
    expect_equal(find_xaringan_themer_css(), "./mono_light.css")
    expect_equal(read_css_vars()$text_color, "#18273F")
  })

  it("finds all xaringan themer files", {
    file.copy(xaringan_css, "xaringan-themer.css")
    candidates <- find_xaringan_themer_css()
    picked <- choose_xaringan_themer_css(candidates)
    expect_equal(candidates, c("./mono_light.css", "./xaringan-themer.css"))
    expect_equal(picked, "./xaringan-themer.css")
    expect_equal(read_css_vars()$text_color, "#000")
  })

  it("chooses the first from the list if ambiguous", {
    file.rename("xaringan-themer.css", "xaringan.css")
    candidates <- find_xaringan_themer_css()
    picked <- expect_message(choose_xaringan_themer_css(candidates))
    expect_equal(candidates, c("./mono_light.css", "./xaringan.css"))
    expect_equal(picked, "./mono_light.css")
    expect_equal(read_css_vars()$text_color, "#18273F")
  })

  it("throws error if no xaringan themer css files", {
    file.remove("xaringan.css")
    file.remove("mono_light.css")
    candidates <- find_xaringan_themer_css()
    expect_equal(candidates, character())
    expect_error(choose_xaringan_themer_css(candidates))
  })
})

test_that("css_get_root() returns null if no :root exists", {
  tmpfile <- tempfile("style", fileext = ".css")
  writeLines(c(
    "html {",
    "  color: red;",
    "}"
  ), tmpfile)
  expect_null(css_get_root(tmpfile))
  unlink(tmpfile)
})
