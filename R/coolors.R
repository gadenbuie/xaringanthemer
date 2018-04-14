# Xaringan Theme from Coolors URL
# ex: https://coolors.co/fcf7f8-06d6a0-fcb0b3-f93943-7eb2dd
# ex: https://coolors.co/e06c53-ffba49-a3d9ff-d6efff-7e6b8f
# ex: https://coolors.co/ff5e5b-b9d8c2-ffffea-00cecb-ffed66
xaringan_coolors_accent <- function(coolors_url, order = "12345", ...) {
  stopifnot(length(coolors_url) == 1)
  colors <- coolors2colors(coolors_url)
  order <- stringr::str_split(order, "")[1]
  order <- unlist(purrr::map(order, as.integer))
  colors <- colors[order]

  colors <- list(
    primary = colors[1],
    secondary = colors[2],

  )

  return(colors)
}

coolors2colors <- function(url) {
  colors <- stringr::str_extract(url, "([a-f0-9]{6}-?){5}")
  colors <- stringr::str_split(colors, "-")
  colors <- purrr::map(colors, ~ paste0("#", .))
  if (length(colors) == 1) colors[[1]]
  else colors
}
