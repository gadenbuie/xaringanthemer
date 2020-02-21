setwd(here::here("inst/scripts"))
message("Building theme functions")
source("generate_theme_functions.R")
setwd(here::here())
message("Writing documentation")
devtools::document()

setwd(here::here())
message("Rendering README.Rmd for GitHub")
rmarkdown::render("README.Rmd", quiet = TRUE)
unlink("README.html")

message("Building and Installing Package with Vignettes")
devtools::install(build_vignettes = TRUE)
