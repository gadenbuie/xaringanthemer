context("test-write_xaringan_theme")

test_that("write_xaringan_theme() writes to specified outfile", {
  tmpfile <- tempfile(fileext = ".css")
  expect_equal(duo_accent(outfile = tmpfile), tmpfile)
  expect_true(file.exists(tmpfile))
  expect_true(grepl("xaringanthemer", readLines(tmpfile)[3]))
})
