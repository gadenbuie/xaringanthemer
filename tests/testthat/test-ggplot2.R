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

  it("throws error for non-hex color functions", {
    expect_error(
      with_clean_session(function() {
        xaringanthemer::style_xaringan(
          text_color = "rgb(0, 0, 0)",
          outfile = NULL
        )
        xaringanthemer::theme_xaringan(
          text_font_use_google = FALSE,
          title_font_use_google = FALSE
        )
      })
    )
  })

  it("correctly overwrites geom default values", {
    fonts <- with_clean_session(function() {
      style <- xaringanthemer::style_xaringan(outfile = NULL)

      g <- ggplot2::ggplot(mtcars, ggplot2::aes(x = cyl, y = disp, label = carb))
      fonts <- list()
      plot1 <- g + ggplot2::geom_text() + xaringanthemer::theme_xaringan()
      fonts[[1]] <- plot1$layers[[1]]$geom$default_aes$family
      plot2 <- g + ggplot2::geom_text() + xaringanthemer::theme_xaringan(text_font = "Ranga", text_font_use_google = TRUE)
      fonts[[2]] <- plot2$layers[[1]]$geom$default_aes$family
      fonts
    })

    expect_equal(fonts[[1]], "Noto Sans")
    expect_equal(fonts[[2]], "Ranga")
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

describe("theme_xaringan_base()", {
  it("accepts a regular text_font or title_font", {
    theme <- with_clean_session(function() {
      xaringanthemer::theme_xaringan_base(
        text_color = "#000",
        accent_color = "#1a2b3c",
        background_color = "#FFF",
        text_font = "sans", title_font = "serif",
        text_font_use_google = FALSE, title_font_use_google = FALSE
      )
    })
    expect_equal(theme$title$colour, "#1a2b3c")
    expect_equal(theme$title$family, "serif")
    expect_equal(theme$plot.background$colour, "#FFFFFF")
    expect_equal(theme$text$colour, "#1A1A1A")
    expect_equal(theme$text$family, "sans")
  })
})

test_that("theme_xaringan_restore_defaults() restores defaults", {
  res <- with_clean_session(function() {
    res <- list()

    res$nothing <- list(xaringanthemer::theme_xaringan_restore_defaults())

    res$original <- list(
      colour = ggplot2::geom_line()$geom$default_aes$colour,
      fill = ggplot2::geom_bar()$geom$default_aes$fill
    )

    old_defaults <- xaringanthemer::theme_xaringan_set_defaults(
      text_color = "#0088ff",
      background_color = "#88ff00",
      accent_color = "#FF8800"
    )

    res$after_set <- list(
      line_colour = ggplot2::geom_line()$geom$default_aes$colour,
      bar_fill = ggplot2::geom_bar()$geom$default_aes$fill
    )

    xaringanthemer::theme_xaringan_restore_defaults()

    res$after_restore <- list(
      line_colour = ggplot2::geom_line()$geom$default_aes$colour,
      bar_fill = ggplot2::geom_bar()$geom$default_aes$fill
    )
    res
  })
  expect_equal(res$nothing, list(NULL))
  expect_equal(res$after_set$line_colour, "#0088ff")
  expect_equal(res$after_set$bar_fill, "#FF8800")
  expect_equal(res$after_restore$line_colour, res$original$colour)
  expect_equal(res$after_restore$bar_fill, res$original$fil)
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

describe("scale_xaringan_*", {
  scales <- with_clean_session(function() {
    xaringanthemer::style_xaringan(
      background_color = "#00FF00",
      inverse_background_color = "#FF00FF",
      header_color = "#FF0000",
      inverse_header_color = "#0000FF",
      outfile = NULL
    )
    list(
      discrete = list(
        fill = xaringanthemer::scale_xaringan_fill_discrete(),
        fill_inverse = xaringanthemer::scale_xaringan_fill_discrete(inverse = TRUE),
        fill_reverse = xaringanthemer::scale_xaringan_fill_discrete(direction = -1),
        color = xaringanthemer::scale_xaringan_color_discrete(),
        color_inverse = xaringanthemer::scale_xaringan_color_discrete(inverse = TRUE),
        color_reverse = xaringanthemer::scale_xaringan_color_discrete(direction = -1),
        colour = xaringanthemer::scale_xaringan_colour_discrete(),
        colour_inverse = xaringanthemer::scale_xaringan_colour_discrete(inverse = TRUE),
        colour_reverse = xaringanthemer::scale_xaringan_colour_discrete(direction = -1)
      ),
      continuous = list(
        fill = xaringanthemer::scale_xaringan_fill_continuous(),
        fill_inverse = xaringanthemer::scale_xaringan_fill_continuous(inverse = TRUE),
        fill_reverse = xaringanthemer::scale_xaringan_fill_continuous(begin = 1, end = 0),
        color = xaringanthemer::scale_xaringan_color_continuous(),
        color_inverse = xaringanthemer::scale_xaringan_color_continuous(inverse = TRUE),
        color_reverse = xaringanthemer::scale_xaringan_color_continuous(begin = 1, end = 0),
        colour = xaringanthemer::scale_xaringan_colour_continuous(),
        colour_inverse = xaringanthemer::scale_xaringan_colour_continuous(inverse = TRUE),
        colour_reverse = xaringanthemer::scale_xaringan_colour_continuous(begin = 1, end = 0)
      )
    )
  })

  it("discrete scales create ScaleDiscrete ggproto objects", {
    for (s in scales$discrete) {
      expect_s3_class(s, "ScaleDiscrete")
      expect_s3_class(s, "ggproto")
    }
  })

  it("discrete scales use accent color as starting point", {
    expect_equal(scales$discrete$fill$palette(n = 1), "#FF0000")
    expect_equal(scales$discrete$color$palette(n = 1), "#FF0000")
    expect_equal(scales$discrete$colour$palette(n = 1), "#FF0000")
    expect_equal(scales$discrete$fill_reverse$palette(n = 1), "#FF0000")
    expect_equal(scales$discrete$color_reverse$palette(n = 1), "#FF0000")
    expect_equal(scales$discrete$colour_reverse$palette(n = 1), "#FF0000")
  })

  it("discrete scales use inverse accent color as starting point", {
    expect_equal(scales$discrete$fill_inverse$palette(n = 1), "#0000FF")
    expect_equal(scales$discrete$color_inverse$palette(n = 1), "#0000FF")
    expect_equal(scales$discrete$colour_inverse$palette(n = 1), "#0000FF")
  })

  it("continuous scales create ScaleContinuous ggproto objects", {
    for (s in scales$continuous) {
      expect_s3_class(s, "ScaleContinuous")
      expect_s3_class(s, "ggproto")
    }
  })

  it("continuous scales use accent color as starting point", {
    expect_equal(scales$continuous$fill$palette(x = 1), "#FF0000")
    expect_equal(scales$continuous$color$palette(x = 1), "#FF0000")
    expect_equal(scales$continuous$colour$palette(x = 1), "#FF0000")
    expect_equal(scales$continuous$fill_reverse$palette(x = 1), "#FF0000")
    expect_equal(scales$continuous$color_reverse$palette(x = 1), "#FF0000")
    expect_equal(scales$continuous$colour_reverse$palette(x = 1), "#FF0000")
  })

  it("continuous scales use inverse accent color as starting point", {
    expect_equal(scales$continuous$fill_inverse$palette(x = 1), "#0000FF")
    expect_equal(scales$continuous$color_inverse$palette(x = 1), "#0000FF")
    expect_equal(scales$continuous$colour_inverse$palette(x = 1), "#0000FF")
  })

  it("continuous scales rescale low to high when begin = 0, end = 1", {
    expect_equal(scales$continuous$fill$rescaler(1:3), 0:2 / 2)
    expect_equal(scales$continuous$color$rescaler(1:3), 0:2 / 2)
    expect_equal(scales$continuous$colour$rescaler(1:3), 0:2 / 2)
  })

  it("continuous scales rescale high to low when begin = 1, end = 0", {
    expect_equal(scales$continuous$fill_reverse$rescaler(1:3), 2:0 / 2)
    expect_equal(scales$continuous$color_reverse$rescaler(1:3), 2:0 / 2)
    expect_equal(scales$continuous$colour_reverse$rescaler(1:3), 2:0 / 2)
  })

})

test_that("register_font() returns the name of the font family if font pkgs are missing", {
  text_font_family <- xaringanthemer_font_default("text_font_family")
  family_showtext_missing <- testthat::with_mock(
    `xaringanthemer:::requires_package` = function(pkg, ...) pkg != "showtext",
    register_font(text_font_family, google = TRUE)
  )

  expect_equal(family_showtext_missing, text_font_family)

  family_sysfonts_missing <- testthat::with_mock(
    `xaringanthemer:::requires_package` = function(pkg, ...) pkg != "sysfonts",
    register_font(text_font_family, google = TRUE)
  )
  expect_equal(family_sysfonts_missing, text_font_family)
})
