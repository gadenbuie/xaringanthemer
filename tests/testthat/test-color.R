# test_that()

describe("prepare_colors()", {
  it("returns NULL if NULL or missing", {
    expect_null(prepare_colors())
    expect_null(prepare_colors(NULL))
    expect_null(prepare_colors(list()))
  })

  it("requires a named vector or list", {
    expect_error(prepare_colors("#00FF00"))
  })

  it("requires valid CSS names", {
    expect_error(prepare_colors(c("light blue" = "#88f")))
    expect_error(prepare_colors(c("light/blue" = "#88f")))
  })

  it("returns list with color_name and value for each color", {
    colors <- c('test' = "#4ed4ed")
    prepared <- prepare_colors(colors)
    expect_equal(names(prepared[[1]]), c("color_name", "value"))
    expect_equal(prepared[[1]]$color_name, names(colors)[[1]])
    expect_equal(prepared[[1]]$value, colors[[1]])
  })
})


describe("full_length_hex()", {
  it("makes 3-length hex to 6-length", {
    expect_equal(full_length_hex("#123"), "#112233")
  })

  it("keeps length 6 hex", {
    expect_equal(full_length_hex("#123456"), "#123456")
  })

  it("errors if not a hex color", {
    expect_error(full_length_hex("123abc"))
    expect_error(full_length_hex("#1234567"))
    expect_error(full_length_hex("#00000Z"))
  })
})
