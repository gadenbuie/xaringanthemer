test_that("printing google_font works", {
  expect_known_output(
    print(google_font("Josefin Sans", "400", "400i", "600i", "700")),
    "google-font-print.txt"
  )
})

test_that("requires_package()", {
  expect_true(requires_package("purrr"))
  expect_error(requires_package("notapackage", "myFunction"), "myFunction")
  expect_warning(expect_false(requires_package("notapackage", required = FALSE)))
})
