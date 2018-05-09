setwd(here::here("inst/scripts"))
message("Building theme functions")
source("generate_theme_functions.R")
setwd(here::here())
message("Writing documentation")
devtools::document()


setwd(here::here("vignettes"))
message("Rendering vignettes/template-variables.Rmd for GitHub")
rmarkdown::render("template-variables.Rmd", output_format = rmarkdown::github_document(), quiet = TRUE)
unlink("template-variables.html")

message("Rendering vignettes/css-help.Rmd for GitHub")
rmarkdown::render("css-help.Rmd", output_format = rmarkdown::github_document(), quiet = TRUE)
unlink("css-help.html")

setwd(here::here())
message("Rendering README.Rmd for GitHub")
rmarkdown::render("README.Rmd", quiet = TRUE)
unlink("README.html")
