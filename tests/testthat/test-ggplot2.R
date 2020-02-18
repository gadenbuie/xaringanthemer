test_that("requires_xaringanthemer_env() errors if no style function called", {
  expect_error(
    with_clean_session(function() {
      xaringanthemer::requires_xaringanthemer_env(NULL, FALSE)
    })
  )
})

describe("theme_xaringan()", {

  it("errors if no css file or style_xaringan theme called", {
    expect_error(
      with_clean_session(function() {
        xaringanthemer::theme_xaringan()
      })
    )
  })

  it("returns a theme using the style_xaringan colors", {
    theme <- with_clean_session(function() {
      xaringanthemer::style_xaringan(
        text_color = "#000001",
        background_color = "#000002",
        header_color = "#000003",
        text_bold_color = "#000004",
        text_font_family = "Damogran",
        text_font_google = NULL,
        header_font_family = "Magrathea",
        header_font_google = NULL
      )
      xaringanthemer::theme_xaringan(
        text_font_use_google = FALSE,
        title_font_use_google = FALSE
      )
    })

    expect_equal(theme$text$family, "Damogran")
    expect_equal(theme$title$family, "Magrathea")
    expect_equal(theme$title$colour, "#000003")
    expect_equal(theme$plot.background$colour, "#000002")
    expect_equal(theme$plot.background$fill, "#000002")
  })

  it("returns correct theme reading from a css file", {
    css <- xaringanthemer::style_xaringan(
      text_color = "#000001",
      background_color = "#000002",
      header_color = "#000003",
      text_bold_color = "#000004",
      text_font_family = "Damogran",
      text_font_google = NULL,
      header_font_family = "Magrathea",
      header_font_google = NULL,
      outfile = NULL
    )

    theme <- with_clean_session(function(css) {
      writeLines(css, "xaringan-themer.css")
      xaringanthemer::theme_xaringan(
        text_font_use_google = FALSE,
        title_font_use_google = FALSE
      )
    }, list(css = css))

    expect_equal(theme$text$family, "Damogran")
    expect_equal(theme$title$family, "Magrathea")
    expect_equal(theme$title$colour, "#000003")
    expect_equal(theme$plot.background$colour, "#000002")
    expect_equal(theme$plot.background$fill, "#000002")
  })

  it("works with 3-digit hex colors", {
    theme <- with_clean_session(function() {
      xaringanthemer::style_xaringan(
        text_color = "#001",
        background_color = "#002",
        header_color = "#003",
        text_bold_color = "#004"
      )
      xaringanthemer::theme_xaringan(
        text_font_use_google = FALSE,
        title_font_use_google = FALSE
      )
    })

    expect_equal(theme$title$colour, "#000033")
    expect_equal(theme$plot.background$colour, "#000022")
    expect_equal(theme$plot.background$fill, "#000022")
  })
})

describe("theme_xaringan_inverse()", {

  it("errors if no css file or style_xaringan theme called", {
    expect_error(
      with_clean_session(function() {
        xaringanthemer::theme_xaringan_inverse()
      })
    )
  })

  it("returns a theme using the style_xaringan colors", {
    theme <- with_clean_session(function() {
      xaringanthemer::style_xaringan(
        text_color = "#000001",
        inverse_text_color = "#100000",
        background_color = "#000002",
        inverse_background_color = "#200000",
        header_color = "#000003",
        inverse_header_color = "#300000",
        text_bold_color = "#000004",
        text_font_family = "Damogran",
        text_font_google = NULL,
        header_font_family = "Magrathea",
        header_font_google = NULL
      )
      xaringanthemer::theme_xaringan_inverse(
        text_font_use_google = FALSE,
        title_font_use_google = FALSE
      )
    })

    expect_equal(theme$text$family, "Damogran")
    expect_equal(theme$title$family, "Magrathea")
    expect_equal(theme$title$colour, "#300000")
    expect_equal(theme$plot.background$colour, "#200000")
    expect_equal(theme$plot.background$fill, "#200000")
  })

  it("returns correct colors pulling from css file", {
    css <- xaringanthemer::style_xaringan(
      text_color = "#000001",
      inverse_text_color = "#100000",
      background_color = "#000002",
      inverse_background_color = "#200000",
      header_color = "#000003",
      inverse_header_color = "#300000",
      text_bold_color = "#000004",
      text_font_family = "Damogran",
      text_font_google = NULL,
      header_font_family = "Magrathea",
      header_font_google = NULL,
      outfile = NULL
    )
    theme <- with_clean_session(function(css) {
      writeLines(css, "basic.css")
      xaringanthemer::theme_xaringan_inverse(
        text_font_use_google = FALSE,
        title_font_use_google = FALSE
      )
    }, list(css = css))

    expect_equal(theme$text$family, "Damogran")
    expect_equal(theme$title$family, "Magrathea")
    expect_equal(theme$title$colour, "#300000")
    expect_equal(theme$plot.background$colour, "#200000")
    expect_equal(theme$plot.background$fill, "#200000")
  })

  it("works with 3-digit hex colors", {
    theme <- with_clean_session(function() {
      xaringanthemer::style_xaringan(
        text_color = "#001",
        background_color = "#002",
        header_color = "#003",
        inverse_text_color = "#100",
        inverse_background_color = "#200",
        inverse_header_color = "#300",
        text_bold_color = "#004"
      )
      xaringanthemer::theme_xaringan_inverse(
        text_font_use_google = FALSE,
        title_font_use_google = FALSE
      )
    })

    expect_equal(theme$title$colour, "#330000")
    expect_equal(theme$plot.background$colour, "#220000")
    expect_equal(theme$plot.background$fill, "#220000")
  })
})


describe("theme_xaringan_get_value()", {

  it("errors if no css file or style_xaringan theme called", {
    expect_error(
      with_clean_session(function() {
        xaringanthemer::theme_xaringan_get_value("text_font_family")
      })
    )
  })

  it("returns theme values", {
    theme <- with_clean_session(function() {
      xaringanthemer::style_xaringan(
        base_font_size = "33px",
        text_font_size = "23px",
        text_color = "#000001",
        inverse_text_color = "#100000",
        background_color = "#000002",
        inverse_background_color = "#200000",
        header_color = "#000003",
        inverse_header_color = "#300000",
        text_bold_color = "#000004",
        text_font_family = "Damogran",
        text_font_google = NULL,
        header_font_family = "Magrathea",
        header_font_google = NULL,
        outfile = NULL
      )
      list(
        text = xaringanthemer::theme_xaringan_get_value(c("text_font_family", "text_font_is_google", "text_color", "text_bold_color")),
        code_font_is_google = xaringanthemer::theme_xaringan_get_value("code_font_is_google"),
        inverse_text_color = xaringanthemer::theme_xaringan_get_value("inverse_text_color"),
        background_color = xaringanthemer::theme_xaringan_get_value("background_color"),
        header_color = xaringanthemer::theme_xaringan_get_value("header_color"),
        inverse_header_color = xaringanthemer::theme_xaringan_get_value("inverse_header_color"),
        base_font_size = xaringanthemer:::get_base_font_size(),
        accent_color = xaringanthemer:::get_theme_accent_color(),
        accent_color_inverse = xaringanthemer:::get_theme_accent_color(inverse = TRUE)
      )
    })

    expect_equal(theme$text$text_font_family, "Damogran")
    expect_equal(theme$text$text_color, "#000001")
    expect_false(theme$text$text_font_is_google)
    expect_true(theme$code_font_is_google)
    expect_equal(theme$text$text_bold_color, "#000004")
    expect_equal(theme$inverse_text_color, "#100000")
    expect_equal(theme$background_color, "#000002")
    expect_equal(theme$header_color, "#000003")
    expect_equal(theme$inverse_header_color, "#300000")
    expect_equal(theme$base_font_size, 33)
    expect_equal(theme$accent_color, "#000003")
    expect_equal(theme$accent_color_inverse, "#300000")
  })

  it("returns theme values from the css file", {
    expect_warning(
      css <- xaringanthemer::style_xaringan(
        base_font_size = "1em",
        text_color = "#000001",
        inverse_text_color = "#100000",
        background_color = "#000002",
        inverse_background_color = "#200000",
        header_color = "#000003",
        inverse_header_color = "#300000",
        text_bold_color = "#000004",
        text_font_family = "Damogran",
        text_font_google = NULL,
        header_font_family = "Magrathea",
        header_font_google = NULL,
        outfile = NULL
      )
    )
    theme <- with_clean_session(function(css) {
      writeLines(css, "xaringan-themer.css")
      list(
        text = xaringanthemer::theme_xaringan_get_value(c("text_font_family", "text_font_is_google", "text_color", "text_bold_color")),
        code_font_is_google = xaringanthemer::theme_xaringan_get_value("code_font_is_google"),
        inverse_text_color = xaringanthemer::theme_xaringan_get_value("inverse_text_color"),
        background_color = xaringanthemer::theme_xaringan_get_value("background_color"),
        header_color = xaringanthemer::theme_xaringan_get_value("header_color"),
        inverse_header_color = xaringanthemer::theme_xaringan_get_value("inverse_header_color"),
        base_font_size = xaringanthemer:::get_base_font_size(),
        accent_color = xaringanthemer:::get_theme_accent_color(),
        accent_color_inverse = xaringanthemer:::get_theme_accent_color(inverse = TRUE)
      )
    }, list(css = css))

    expect_equal(theme$text$text_font_family, "Damogran")
    expect_equal(theme$text$text_color, "#000001")
    expect_false(theme$text$text_font_is_google)
    expect_true(theme$code_font_is_google)
    expect_equal(theme$text$text_bold_color, "#000004")
    expect_equal(theme$inverse_text_color, "#100000")
    expect_equal(theme$background_color, "#000002")
    expect_equal(theme$header_color, "#000003")
    expect_equal(theme$inverse_header_color, "#300000")
    expect_equal(theme$base_font_size, 16)
    expect_equal(theme$accent_color, "#000003")
    expect_equal(theme$accent_color_inverse, "#300000")
  })
})

describe("web_to_point()", {
  it("is invariant when x is pt", {
    expect_equal(web_to_point("24pt", 11), 24)
    expect_equal(web_to_point("24pt", 11), 24)
    expect_equal(web_to_point("24pt", 11, scale = 3), 24)
  })

  it("scales px", {
    expect_equal(web_to_point("24px", 10, 1), 24)
    expect_equal(web_to_point("24px", 10, 0.5), 12)
  })

  it("scales r/em", {
    expect_equal(web_to_point("2.4em",  10, 1), 24)
    expect_equal(web_to_point("2.4rem", 10, 1), 24)
    expect_equal(web_to_point("2.4em",  10, 0.5), 12)
    expect_equal(web_to_point("2.4rem", 10, 0.5), 12)
  })

  it("returns NULL if input is NULL or poorly defined", {
    expect_null(web_to_point(NULL))
    expect_null(web_to_point("NULL", 1))
  })
})

describe("get_theme_accent_color()", {
  it("errors if no color or default available", {
    expect_error(
      with_clean_session(function() {
        xaringanthemer:::get_theme_accent_color()
      })
    )
  })
})
