
preview_images <- function(template, theme) {
  template <- normalizePath(template)
  tmpdir <- tempfile()
  dir.create(tmpdir)
  owd <- setwd(tmpdir)
  on.exit(setwd(owd))

  file.copy(template, file.path(tmpdir, "slides.Rmd"))
  force(theme)

  slides_html <- "slides.html"
  slides_pdf <- "slides.pdf"

  message("Preparing slides")
  rmarkdown::render("slides.Rmd", output_file = slides_html, quiet = TRUE)

  message("Printing to pdf")
  pagedown::chrome_print(slides_html, output = slides_pdf)

  pages <- pdftools::pdf_info(slides_pdf)$pages
  filenames <- sprintf("slides_%02d.png", seq_len(pages))
  pdftools::pdf_convert(slides_pdf, filenames = filenames)

  slide_images <- magick::image_read(filenames)

  magick::image_append(slide_images)
}

