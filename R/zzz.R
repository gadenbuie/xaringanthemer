# nocov start
.onLoad <- function(libname, pkgname, ...) {

  if ("knitr" %in% loadedNamespaces()) {
    set_fig_showtext()
  }

  setHook(
    packageEvent("knitr", "onLoad"),
    function(...) {
      set_fig_showtext()
    }
  )

  invisible()
}
# nocov end
