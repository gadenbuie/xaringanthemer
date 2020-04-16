callr::rscript("data-raw/theme_template_variables.R")
message("Building theme functions")
callr::rscript("generate_theme_functions.R", wd = here::here("inst/scripts"))
message("Writing documentation")
devtools::document()

message("Rendering README.Rmd for GitHub")
rmarkdown::render("README.Rmd", quiet = TRUE)
unlink("README.html")

message("Rendering index.Rmd for pkgdown")
rmarkdown::render("index.Rmd", quiet = TRUE)
unlink("index.html")

message("Checking package")
devtools::check(document = FALSE)

message("Building and Installing Package with Vignettes")
devtools::install(build_vignettes = TRUE)
