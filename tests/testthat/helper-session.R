with_clean_session <- function(.f, args = list()) {
  empty_wd <- tempfile()
  dir.create(empty_wd)
  owd <- setwd(empty_wd)
  on.exit({setwd(owd); unlink(empty_wd, TRUE)})
  callr::r_safe(.f, args)
}
