context("test-list2css.R")

test_that("list2css converts lists to css", {
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

test_that("list2css errors if css list is not named", {
  css <- list(list(
    "color" = "#FFF",
    "font-size" = "30px"
  ))
  expect_error(list2css(css))
})

test_that("list2css errors if css list has unnamed elements", {
  css <- list(
    list(
      "color" = "#FFF",
      "font-size" = "30px"
    ),
    ".test" = list(color = "red")
  )
  expect_error(list2css(css))
})

test_that("list2css errors if css list has unnamed properties", {
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

test_that("list2css errors if not list within list", {
  css <- list(
    ".class" = list(
      list(color = "red"),
      "font-size" = "30px"
    ),
    ".test" = list("red")
  )
  expect_error(list2css(css))
})
