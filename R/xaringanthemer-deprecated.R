#' Deprecated or renamed functions
#'
#' These functions in xaringanthemer have been deprecated or renamed.
#'
#' @param ... Argumets passed to the new or renamed functions.
#' @return The result of the new or renamed function.
#' @name xaringanthemer-deprecated
NULL

#' @description
#' Use [style_xaringan()] instead of `write_xaringan_theme()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
write_xaringan_theme <- function(...) {
  .Deprecated(msg = "write_xaringan_theme() was renamed. Please use `style_xaringan()` instead.")
  style_xaringan(...)
}

#' @description
#' Use [style_extra_css()] instead of `write_extra_css()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
write_extra_css <- function(...) {
  .Deprecated(msg = "write_extra_css() was renamed. Please use `style_extra_css()` instead.")
  style_extra_css(...)
}


#' @description
#' Use [style_mono_light()] instead of `mono_light()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
mono_light <- function(...) {
  .Deprecated(msg = "mono_light() was renamed. Please use `style_mono_light()` instead.")
  style_mono_light(...)
}

#' @description
#' Use [style_mono_dark()] instead of `mono_dark()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
mono_dark <- function(...) {
  .Deprecated(msg = "mono_dark() was renamed. Please use `style_mono_dark()` instead.")
  style_mono_dark(...)
}

#' @description
#' Use [style_mono_accent()] instead of `mono_accent()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
mono_accent <- function(...) {
  .Deprecated(msg = "mono_accent() was renamed. Please use `style_mono_accent()` instead.")
  style_mono_accent(...)
}

#' @description
#' Use [style_mono_accent_inverse()] instead of `mono_accent_inverse()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
mono_accent_inverse <- function(...) {
  .Deprecated(msg = "mono_accent_inverse() was renamed. Please use `style_mono_accent_inverse()` instead.")
  style_mono_accent_inverse(...)
}

#' @description
#' Use [style_duo()] instead of `duo()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
duo <- function(...) {
  .Deprecated(msg = "duo() was renamed. Please use `style_duo()` instead.")
  style_duo(...)
}

#' @description
#' Use [style_duo_accent()] instead of `duo_accent()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
duo_accent <- function(...) {
  .Deprecated(msg = "duo_accent() was renamed. Please use `style_duo_accent()` instead.")
  style_duo_accent(...)
}

#' @description
#' Use [style_duo_accent_inverse()] instead of `duo_accent_inverse()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
duo_accent_inverse <- function(...) {
  .Deprecated(msg = "duo_accent_inverse() was renamed. Please use `style_duo_accent_inverse()` instead.")
  style_duo_accent_inverse(...)
}

#' @description
#' Use [style_solarized_light()] instead of `solarized_light()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
solarized_light <- function(...) {
  .Deprecated(msg = "solarized_light() was renamed. Please use `style_solarized_light()` instead.")
  style_solarized_light(...)
}

#' @description
#' Use [style_solarized_dark()] instead of `solarized_dark()`.
#'
#' @export
#' @keywords internal
#' @rdname xaringanthemer-deprecated
solarized_dark <- function(...) {
  .Deprecated(msg = "solarized_dark() was renamed. Please use `style_solarized_dark()` instead.")
  style_solarized_dark(...)
}
