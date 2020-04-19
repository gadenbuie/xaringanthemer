library(xaringanthemer)
library(magick)
library(purrr)
source("../preview_images.R")

preview_images(
  "../demo/demo.Rmd",
  style_mono_light()
) %>%
  image_write("ex01.png")

preview_images(
  "../demo/demo.Rmd",
  style_mono_accent(
    header_font_google = google_font("Roboto Slab"),
    text_font_google = google_font("PT Serif")
  )
) %>%
  image_write("ex02.png")

preview_images(
  "../demo/demo.Rmd",
  style_duo_accent(
    header_font_google = google_font("Amatic SC"),
    header_h1_font_size = "3.5rem",
    header_h2_font_size = "2.75rem",
    text_font_google = google_font("Crete Round")
  )
) %>%
  image_write("ex03.png")

preview_images(
  "../demo/demo.Rmd",
  style_mono_dark(
    header_font_google = google_font("Carter One"),
    text_font_google = google_font("Raleway")
  )
) %>%
  image_write("ex04.png")

preview_images(
  "../demo/demo.Rmd",
  style_mono_accent_inverse(
    base_color = "#F2A88C",
    header_font_google = google_font("Pacifico"),
    text_font_google = google_font("Source Sans Pro")
  )
) %>%
  image_write("ex05.png")

preview_images(
  "../demo/demo.Rmd",
  style_duo(
    header_font_google = google_font("Prompt"),
    text_font_google = google_font("Acme")
  )
) %>%
  image_write("ex06.png")

preview_images(
  "../demo/demo.Rmd",
  style_duo_accent_inverse(
    primary_color =
      "#03A696",
    secondary_color =
      "#035AA6",
    header_font_google = google_font("Patua One"),
    text_font_google = google_font("Alegreya")
  )
) %>%
  image_write("ex07.png")

preview_images(
  "../demo/demo.Rmd",
  style_solarized_dark(
    header_font_google = google_font("Hammersmith One"),
    text_font_google = google_font("Monda")
  )
) %>%
  image_write("ex08.png")

preview_images(
  "../demo/demo.Rmd",
  style_solarized_light(
    header_font_google = google_font("Hammersmith One"),
    text_font_google = google_font("Monda")
  )
) %>%
  image_write("ex09.png")

fs::dir_ls(regexp = "ex.+png$") %>%
  map(image_read) %>%
  reduce(c) %>%
  image_animate(fps = 1) %>%
  image_write("../examples.gif")
