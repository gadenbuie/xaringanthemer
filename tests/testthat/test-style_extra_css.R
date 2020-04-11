# test_that()


# style_extra_css() -------------------------------------------------------

describe("style_extra_css", {
  css <- list(body = list(color = "#123"))

  it("returns text if outfile is NULL", {
    expect_equal(
      style_extra_css(css, NULL),
      "\n\n/* Extra CSS */\nbody {\n  color: #123;\n}"
    )
    expect_equal(
      style_extra_css(css, NULL, heading = NULL),
      "\nbody {\n  color: #123;\n}"
    )
    expect_equal(
      style_extra_css(css, NULL, append = FALSE, heading = NULL),
      "body {\n  color: #123;\n}"
    )
    expect_equal(
      style_extra_css(css, NULL, append = FALSE, heading = "TEST TEST"),
      "/* TEST TEST */\nbody {\n  color: #123;\n}"
    )
  })

  tmpfile <- tempfile(fileext = ".css")
  first <- style_extra_css(
    css = list(.first = list(color = "#123")),
    outfile = tmpfile,
    append = FALSE,
    heading = "First CSS"
  )
  first_exp <- "/* First CSS */\n.first {\n  color: #123;\n}"

  it("writes text to the outfile", {
    expect_equal(first, first_exp)
    expect_equal(
      readLines(tmpfile, warn = FALSE),
      strsplit(first_exp, "\n")[[1]]
    )
  })

  second <- style_extra_css(
    css = list(.second = list(color = "#321")),
    outfile = tmpfile,
    append = TRUE,
    heading = "Second CSS"
  )
  second_exp <- "\n\n/* Second CSS */\n.second {\n  color: #321;\n}"

  it("appends to existing outfile", {
    expect_equal(second, second_exp)
    expect_equal(
      readLines(tmpfile, warn = FALSE),
      strsplit(paste0(first_exp, "\n", second_exp), "\n")[[1]]
    )
  })

  third <- style_extra_css(
    css = list(.third = list(color = "#333")),
    outfile = tmpfile,
    append = FALSE,
    heading = "Third CSS"
  )
  third_exp <- "/* Third CSS */\n.third {\n  color: #333;\n}"

  it("over writes text in the outfile if append=FALSE", {
    expect_equal(third, third_exp)
    expect_equal(
      readLines(tmpfile, warn = FALSE),
      strsplit(third_exp, "\n")[[1]]
    )
  })

  it("only adds prepends `heading` once", {
    css <- list(b = list(color = "red"), i = list(color = "blue"))
    out <- style_extra_css(css, outfile = NULL, heading = "Extra CSS")
    expect_equal(length(out), 1L)
    expect_equal(sum(grepl("Extra CSS", out)), 1L)
  })
})


# list2css() --------------------------------------------------------------

describe("list2css()", {
  it("converts lists to css", {
    css <- list(
      ".remark-slide" = list(
        "color" = "#FFF",
        "font-size" = "30px"
      )
    )
    expected <- ".remark-slide {
  color: #FFF;
  font-size: 30px;
}"
    expect_equal(list2css(css), expected)

    css[[".new-class"]] <- list("background-color" = "#000")
    expected <- c(expected, ".new-class {\n  background-color: #000;\n}")
    expect_equal(list2css(css), expected)
  })

  it("errors if css list is not named", {
    css <- list(list(
      "color" = "#FFF",
      "font-size" = "30px"
    ))
    expect_error(list2css(css))
  })

  it("errors if css list has unnamed elements", {
    css <- list(
      list(
        "color" = "#FFF",
        "font-size" = "30px"
      ),
      ".test" = list(color = "red")
    )
    expect_error(list2css(css))
  })

  it("errors if css list has unnamed properties", {
    css <- list(
      ".class" = list(
        color = "#FFF",
        "font-size" = "30px"
      ),
      ".test" = list("red")
    )
    expect_error(list2css(css))

    css <- list(
      ".class" = list(
        "#FFF",
        "font-size" = "30px"
      ),
      ".test" = list("red")
    )
    expect_error(list2css(css))
  })

  it("errors if not list within list", {
    css <- list(
      ".class" = list(
        list(color = "red"),
        "font-size" = "30px"
      ),
      ".test" = list("red")
    )
    expect_error(list2css(css))
  })

  it("errors if css contains unnamed elements", {
    expect_error(list2css(list(list(color = "#bad"))))
    expect_error(
      list2css(list(.a = list(color = "#bad"), list(`background-color` = "#bad"))),
      "elements.+must be named.+2 is"
    )
    expect_error(
      list2css(list(.a = list(color = "#bad"), list(`background-color` = "#bad"), list(`border-color` = "#bad"))),
      "elements.+must be named.+2, 3 are"
    )
    expect_error(
      list2css(list(body = list("#bad"))),
      "elements.+must be named.+body.+has"
    )
    expect_error(
      list2css(list(body = list("#bad"), thing = list("#bad"))),
      "elements.+must be named.+body.+thing.+have"
    )
  })

  it("is okay for multiple entries with the same name", {
    expect_equal(
      list2css(list("a" = list(color = "red"), a = list(color = "blue"))),
      c("a {\n  color: red;\n}", "a {\n  color: blue;\n}")
    )

    expect_equal(
      list2css(list("a" = list(color = "red", color = "blue"))),
      c("a {\n  color: red;\n  color: blue;\n}")
    )
  })
})


# list2fonts() ------------------------------------------------------------

import <- function(x) paste0("@import url(", x, ");")

describe("list2fonts()", {
  lato_url <- "https://fonts.googleapis.com/css?family=Lato&display=swap"
  worksans_url <- "https://fonts.googleapis.com/css?family=Work+Sans&display=swap"

  it("handles a list or c() of font urls", {
    expect_equal(
      list2fonts(list(lato_url, worksans_url)),
      import(c(lato_url, worksans_url))
    )
    expect_equal(list2fonts(c(lato_url, lato_url)), rep(import(lato_url), 2))
  })

  it("handles single character font name", {
    expect_equal(list2fonts(lato_url), import(lato_url))
  })

  it("handles list of google fonts", {
    expect_equal(
      list2fonts(list(google_font("Lato"), google_font("Work Sans"))),
      import(c(lato_url, worksans_url))
    )
  })

  it("handles mix of google_font() and bare string", {
    expect_equal(
      list2fonts(list(google_font("Lato"), worksans_url)),
      import(c(lato_url, worksans_url))
    )
  })

  it("handles bare google_font()", {
    expect_equal(
      list2fonts(google_font("Lato")),
      import(lato_url)
    )
  })

  it("throws an error when c() used to combine string and google_font()", {
    expect_error(
      list2fonts(c(lato_url, google_font("Lato"), google_font("Work Sans"))),
      "Multiple fonts"
    )
    expect_error(
      list2fonts(c(google_font("Lato"), google_font("Work Sans"))),
      "Multiple fonts"
    )
  })
})
