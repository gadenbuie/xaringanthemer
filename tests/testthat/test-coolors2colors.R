context("test-coolors2colors.R")

test_that("coolors2colors takes urls and makes #COLORS", {
  urls <- c("https://coolors.co/fcf7f8-06d6a0-fcb0b3-f93943-7eb2dd",
            "https://coolors.co/e06c53-ffba49-a3d9ff-d6efff-7e6b8f",
            "https://coolors.co/ff5e5b-b9d8c2-ffffea-00cecb-ffed66")

  expect_equal(coolors2colors(urls[1]), c("#fcf7f8", "#06d6a0", "#fcb0b3", "#f93943", "#7eb2dd"))
  expect_equal(coolors2colors(urls[2]), c("#e06c53", "#ffba49", "#a3d9ff", "#d6efff", "#7e6b8f"))
  expect_equal(coolors2colors(urls[3]), c("#ff5e5b", "#b9d8c2", "#ffffea", "#00cecb", "#ffed66"))
})
