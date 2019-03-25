context("test-style_xaringan")

test_that("style_xaringan() writes to specified outfile", {
  tmpfile <- tempfile(fileext = ".css")
  expect_equal(style_xaringan(outfile = tmpfile), tmpfile)
  expect_true(file.exists(tmpfile))
  expect_true(grepl("xaringanthemer", readLines(tmpfile)[3]))
})
