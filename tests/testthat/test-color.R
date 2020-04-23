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

describe("check_color_is_hex", {
  it("returns TRUE when color is valid hex", {
    expect_true(check_color_is_hex("#123456"))
    expect_true(check_color_is_hex("#abc123"))
    expect_true(check_color_is_hex("#abc"))
    expect_true(check_color_is_hex("#123"))
  })

  it("returns FALSE and warns if requested", {
    expect_false(check_color_is_hex("123456", throw = NULL))
    expect_false(check_color_is_hex("123", throw = NULL))
    expect_false(check_color_is_hex("apple", throw = NULL))
    expect_warning(check_color_is_hex("123456"))
    expect_warning(check_color_is_hex("123", msg = "{color} is bad"), "123 is bad")
    expect_warning(check_color_is_hex("apple"))
  })

  it("errors if throw = stop", {
    expect_error(check_color_is_hex("123", throw = stop), "123 is not")
  })
})


describe("lighten_color() and darken_color()", {
  it("errors if strength not in [0, 1]", {
    expect_error(lighten_color("#123", 9))
    expect_error(darken_color("#123", 9))
  })

  it("returns original color if strength = 0", {
    expect_equal(lighten_color("#808080", 0), "#808080")
    expect_equal(darken_color("#808080", 0), "#808080")
  })

  it("returns entire blend color if strength = 0", {
    expect_equal(lighten_color("#808080", 1), "#FFFFFF")
    expect_equal(darken_color("#808080", 1), "#000000")
  })

  it("returns midpoint if strength = 0.5", {
    expect_equal(lighten_color("#000000", 0.5), "#7F7F7F")
    expect_equal(darken_color("#FFFFFF", 0.5), "#7F7F7F")
  })
})
