# nocov start
# Theme Generating Helpers ----------------------------------------------

plural_element <- function(css_name) {
  is_mult <- grepl(",|and|or", css_name)
  is_class <- grepl("^\\.", css_name)
  ifelse(is_class,
    ifelse(is_mult, "classes", "class"),
    ifelse(is_mult, "elements", "element")
  )
}

element_description <- function(element) {
  out <- rep("", length(element))
  multiple <- grepl("multiple", element)
  out[multiple] <- "Used in multiple CSS rules."

  ifelse(
    multiple | is.na(element) | element == "",
    out,
    glue::glue("Modifies the `{element}` {plural_element(element)}.")
  )
}

describe_css_variable <- function(css_variable = NULL) {
  if (is.null(css_variable)) return("")
  ifelse(
    is.na(css_variable),
    "",
    glue::glue(
      " The value of this variable is also stored as a CSS variable that can be ",
      "referenced with `var({css_variable})` in any argument of a style ",
      "function or in custom CSS."
    )
  )
}

describe_css_property <- function(css_property = NULL) {
  if (is.null(css_property)) return("")
  ifelse(
    is.na(css_property),
    "",
    glue::glue(" Accepts CSS {css_property} property values.")
  )
}

# nocov end
