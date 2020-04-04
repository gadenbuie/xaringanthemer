callr::rscript("data-raw/theme_template_variables.R")
message("Building theme functions")
callr::rscript("generate_theme_functions.R", wd = here::here("inst/scripts"))
message("Writing documentation")
devtools::document()

setwd(here::here())
message("Rendering README.Rmd for GitHub")
rmarkdown::render("README.Rmd", quiet = TRUE)
unlink("README.html")

message("Building and Installing Package with Vignettes")
devtools::install(build_vignettes = TRUE)
