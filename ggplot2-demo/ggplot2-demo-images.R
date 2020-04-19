library(xaringanthemer)
source("../xaringanthemer-assets/preview_images.R")

style_mono_accent(
  base_color = "#DC322F",
  inverse_background_color = "#002B36",
  inverse_header_color = "#31b09e",
  inverse_text_color = "#FFFFFF",
  title_slide_background_color = "var(--base)",
  text_font_google = google_font("Kelly Slab"),
  header_font_google = google_font("Oleo Script"),
  outfile = NULL
)

two_panel <- preview_images("ggplot2-demo.Rmd",
                            style_mono_accent(
                              base_color = "#DC322F",
                              inverse_background_color = "#001923",
                              inverse_header_color = "#31b09e",
                              inverse_text_color = "#FFFFFF",
                              title_slide_background_color = "var(--base)",
                              text_font_google = google_font("Kelly Slab"),
                              header_font_google = google_font("Oleo Script")
                            ))

magick::image_write(two_panel, "../theme-xaringan.png")

three_panel <- preview_images("ggplot2-demo-inverse.Rmd",
                              style_mono_accent(
                                base_color = "#DC322F",
                                inverse_background_color = "#001923",
                                inverse_header_color = "#31b09e",
                                inverse_text_color = "#FFFFFF",
                                title_slide_background_color = "var(--base)",
                                text_font_google = google_font("Kelly Slab"),
                                header_font_google = google_font("Oleo Script")
                              ))

magick::image_write(three_panel, "../theme-xaringan-inverse.png")
