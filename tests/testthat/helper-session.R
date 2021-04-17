with_clean_session <- function(.f, args = list()) {
  empty_wd <- tempfile()
  dir.create(empty_wd)
  owd <- setwd(empty_wd)
  on.exit({setwd(owd); unlink(empty_wd, TRUE)})
  args$.f <- .f
  res <- callr::r_safe(function(.f, ...) {
    tryCatch(
      list(result = .f(...), error = NULL),
      error = function(e) list(result = NULL, error = e$message)
    )
  }, args)
  if (!is.null(res$error)) {
    stop(res$error)
  } else {
    res$result
  }
}
