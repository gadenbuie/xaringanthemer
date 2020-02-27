# nocov start
.onLoad <- function(libname, pkgname, ...) {

  if ("knitr" %in% loadedNamespaces()) {
    knitr::opts_chunk$set(fig.showtext = TRUE)
  }

  setHook(
    packageEvent("knitr", "onLoad"),
    function(...) {
      knitr::opts_chunk$set(fig.showtext = TRUE)
    }
  )

  invisible()
}
# nocov end
