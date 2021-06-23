# nocov start
.onLoad <- function(libname, pkgname, ...) {

  if ("knitr" %in% loadedNamespaces()) {
    if (requireNamespace("showtext", quietly = TRUE)) {
      knitr::opts_chunk$set(fig.showtext = TRUE)
    }
  }

  setHook(
    packageEvent("knitr", "onLoad"),
    function(...) {
      if (requireNamespace("showtext", quietly = TRUE)) {
        knitr::opts_chunk$set(fig.showtext = TRUE)
      }
    }
  )

  invisible()
}
# nocov end
