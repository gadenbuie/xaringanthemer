test_that("printing google_font works", {
  expect_known_output(
    print(google_font("Josefin Sans", "400", "400i", "600i", "700")),
    "google-font-print.txt"
  )
})
