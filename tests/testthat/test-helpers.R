test_that("element_description", {
  text_in <- c("multiple", NA, "", ".remark-slide-content", "h1", "pre, code")
  text_out <- c(
    "Used in multiple CSS rules.",
    "",
    "",
    "Modifies the `.remark-slide-content` class.",
    "Modifies the `h1` element.",
    "Modifies the `pre, code` elements."
  )
  expect_equal(element_description(text_in), text_out)
})
