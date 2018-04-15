#' Write Customized Xaringan Theme
#'
#' @param text_color Text Color
#' @param header_color Header Color
#' @param background_color Slide Background Color
#' @param link_color Link Color
#' @param text_bold_color Bold Text Color
#' @param text_slide_number_color Slide Number Color
#' @param code_highlight_color Code Line Highlight
#' @param code_inline_color Inline Code Color
#' @param code_inline_background_color Inline Code Background Color
#' @param inverse_background_color Inverse Background Color
#' @param inverse_text_color Inverse Text Color
#' @param inverse_text_shadow Enables Shadow on text of inverse slides
#' @param inverse_header_color Inverse Header Color
#' @param title_slide_text_color Title Slide Text Color
#' @param title_slide_background_color Title Slide Background Color
#' @param title_slide_background_image Title Slide Background Image URL
#' @param left_column_subtle_color Left Column Text (not last)
#' @param left_column_selected_color Left Column Current Selection
#' @param blockquote_left_color Blockquote Left Border Color
#' @param table_border_color Table top/bottom border
#' @param table_row_border_color Table row inner bottom border
#' @param table_row_even_background_color Table Even Row Background Color
#' @param text_font_google Use `google_font()` to specify body font
#' @param text_font_family Body Text Font Family
#' @param text_font_weight Body Text Font Weight
#' @param text_font_url Body Text Font URL(s)
#' @param text_font_family_fallback Body Text Font Fallbacks
#' @param text_font_base Body Text Base Font (Total Failure Fallback)
#' @param header_font_google Use `google_font()` to specify header font
#' @param header_font_family Header Font Family
#' @param header_font_weight Header Font Weight
#' @param header_font_url Header Font URL
#' @param code_font_google Use `google_font()` to specify code font
#' @param code_font_family Code Font Family
#' @param code_font_url Code Font URL
#' @param code_font_family_fallback Code Font Fallback
#' @param outfile Customized xaringan CSS output file name
write_xaringan_theme <- function(
  text_color                      = "#000",
  header_color                    = "#000",
  background_color                = "#FFF",
  link_color                      = "rgb(249, 38, 114)",
  text_bold_color                 = NA,
  text_slide_number_color         = color_inverse_bg,
  code_highlight_color            = "#ffff88",
  code_inline_color               = "#000",
  code_inline_background_color    = NA,
  inverse_background_color        = "#272822",
  inverse_text_color              = "#d6d6d6",
  inverse_text_shadow             = FALSE,
  inverse_header_color            = "#f3f3f3",
  title_slide_text_color          = color_inverse_text,
  title_slide_background_color    = color_inverse_bg,
  title_slide_background_image    = NA,
  left_column_subtle_color        = "#777",
  left_column_selected_color      = "#000",
  blockquote_left_color           = "lightgray",
  table_border_color              = "#666",
  table_row_border_color          = "#ddd",
  table_row_even_background_color = "#eee",
  text_font_google                = NULL,
  text_font_family                = "'Droid Serif'",
  text_font_weight                = "normal",
  text_font_url                   = "https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic",
  text_font_family_fallback       = "'Palatino Linotype', 'Book Antiqua', Palatino, 'Microsoft YaHei', 'Songti SC'",
  text_font_base                  = "serif",
  header_font_google              = NULL,
  header_font_family              = "'Yanone Kaffeesatz'",
  header_font_weight              = "normal",
  header_font_url                 = "https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz",
  code_font_google                = NULL,
  code_font_family                = "'Source Code Pro'",
  code_font_url                   = "https://fonts.googleapis.com/css?family=Source+Code+Pro:400,700",
  code_font_family_fallback       = "'Lucida Console', Monaco",
  outfile                         = "xaringan-themed.css"
) {
  # Make sure font names are wrapped in quotes if they have spaces
  f_args <- names(formals(sys.function()))
  for (var in f_args[grepl("font_family$", f_args)]) {
    eval(parse(text = paste0(
      var, "<-quote_elements_w_spaces(", var, ")"
    )))
  }

  # Use font_..._google args to overwrite font args
  for (var in f_args[grepl("font_google$", f_args)]) {
    gf <- eval(parse(text = var))
    if (is.null(gf)) next
    if (!inherits(gf, "google_font")) stop(
      "`", var, "` must be set using `google_font()`."
    )
    group <- stringr::str_split(var, "_")[[1]][1]
    if (group == "text") {
      text_font_family <- gf$family
      text_font_weight <- gf$weights %||% "normal"
      text_font_weight <- substr(text_font_weight, 1, regexpr(",", text_font_weight)[1]-1)
      text_font_url    <- gf$url
    } else {
      for (thing in c("family", "url")) {
        eval(parse(text = paste0(
          group, "_font_", thing, " <- gf$", thing
        )))
      }
    }
  }

  tf <- system.file("resources", "template.css", package = "xaringanthemer")
  template <- readLines(tf, warn = FALSE)
  template <- paste(template, collapse = "\n")
  x <- glue::glue(template, .open = "{{", .close = "}}")
  cat(x, file = outfile)
  outfile
}
