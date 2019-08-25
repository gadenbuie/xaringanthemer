import <- function(x) paste0("@import url(", x, ");")

# test_that("list2fonts()", {})

describe("list2fonts()", {
  lato_url <- "https://fonts.googleapis.com/css?family=Lato"
  worksans_url <- "https://fonts.googleapis.com/css?family=Work+Sans"

  it("handles a list of font names", {
    expect_equal(
      list2fonts(list(lato_url, worksans_url)),
      import(c(lato_url, worksans_url))
    )
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
})
