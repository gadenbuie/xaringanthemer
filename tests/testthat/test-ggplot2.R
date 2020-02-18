# test_that()

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
