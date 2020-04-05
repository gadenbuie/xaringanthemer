# installs dependencies, runs R CMD check, runs covr::codecov()
tic::do_package_checks()

if (tic::ci_on_travis() && tic::ci_has_env("BUILD_PKGDOWN")) {
  # creates pkgdown site and pushes to gh-pages branch
  message("Branch is: ", tic::ci_get_branch())
  if (tic::ci_get_branch() == "dev") {
    tic::do_pkgdown(deploy = TRUE)
  } else {
    tic::do_pkgdown()
  }
}
