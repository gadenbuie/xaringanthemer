# installs dependencies, runs R CMD check, runs covr::codecov()
tic::do_package_checks()

if (tic::ci_on_travis() && isTRUE(tic::ci_get_env("BUILD_PKGDOWN"))) {
  # creates pkgdown site and pushes to gh-pages branch
  if (tic::ci_get_branch() == "dev") {
    tic::do_pkgdown(deploy = tic::ci_can_push())
  } else {
    tic::do_pkgdown()
  }
}
