
test_that("style_xaringan() writes to specified outfile", {
  tmpfile <- tempfile(fileext = ".css")
  expect_equal(style_xaringan(outfile = tmpfile), tmpfile)
  expect_true(file.exists(tmpfile))
  expect_true(grepl("xaringanthemer", readLines(tmpfile)[3]))
})

test_that("style_xaringan() warns if base_font_size is not absolute", {
  tmpfile <- tempfile(fileext = ".css")
  expect_warning(
    style_xaringan(outfile = tmpfile, base_font_size = "1em"),
    "absolute units"
  )
})
