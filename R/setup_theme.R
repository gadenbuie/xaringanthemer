#' @keywords internal
setup_theme_function <- function(
  f_name = "write_xaringan_theme",
  template = template_variables,
  ...,
  to_clipboard = TRUE,
  body = NULL
) {
  `%,%` <- function(x, y) c(x, y)
  tv <- template
  null_default <- purrr::map_lgl(tv$default, is.null)
  tv[null_default, 'default'] <- "{NULL}"
  x <-
    as.character(
      glue::glue_data(
        tv, "#' @param {variable} {description}, defaults to {stringr::str_replace_all(default, '[{{}}]', '`')}")) %,%
    "#' @param outfile Customized xaringan CSS output file name" %,%
    c(...) %,%
    glue::glue("{f_name} <- function(") %,%
    as.character(glue::glue_data(tv,
                                 "  {variable} = {ifelse(!stringr::str_detect(default, '^[{].+[}]$'), paste0('\"', default, '\"'), stringr::str_replace_all(default, '[{}]', ''))},")) %,%
    "  outfile = \"xaringan-themed.css\"" %,%
    ") {"
  if (!is.null(body)) x <- c(x, body, "}")
  if (to_clipboard) message("Wrote function signature to clipboard.")
  cat(x, sep = "\n",
      file = if(to_clipboard) pipe("pbcopy", "w") else "")
}

#' @keywords internal
call_write_xaringan_theme <- function() {
  paste0("write_xaringan_theme(",
         paste(template_variables$variable, collapse = ", "),
         ")")
}
