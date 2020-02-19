# test_that()

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
})

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
})
