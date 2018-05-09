setwd(here::here("vignettes"))
message("Rendering vignettes/template-variables.Rmd for GitHub")
rmarkdown::render("template-variables.Rmd", output_format = rmarkdown::github_document(), quiet = TRUE)
unlink("template-variables.html")

setwd(here::here())
message("Rendering README.Rmd for GitHub")
rmarkdown::render("README.Rmd", quiet = TRUE)
unlink("README.html")
