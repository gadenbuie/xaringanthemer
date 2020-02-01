prepare_colors <- function(colors = NULL) {
  if (is.null(colors) || length(colors) < 1) return(NULL)

  if (is.null(names(colors))) {
    stop(
      "`colors` must have names corresponding to valid CSS classes",
      call. = FALSE
    )
  }

  if (any(grepl("\\s", names(colors)))) {
    stop(
      "Color names in `colors` must be valid CSS classes",
      " and cannot contain spaces",
      call. = FALSE)
  }

  if (any(grepl("[^[:alpha:]_-]", names(colors)))) {
    stop("Color names in `colors` must be valid CSS classes", call. = FALSE)
  }

  whisker::iteratelist(colors, "color_name")
}
