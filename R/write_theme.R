#' @param text_color Text Color, defaults to #000
#' @param header_color Header Color, defaults to #000
#' @param background_color Slide Background Color, defaults to #FFF
#' @param link_color Link Color, defaults to rgb(249, 38, 114)
#' @param text_bold_color Bold Text Color, defaults to NA
#' @param text_slide_number_color Slide Number Color, defaults to `inverse_background_color`
#' @param code_highlight_color Code Line Highlight, defaults to rgba(255,255,0,0.5)
#' @param code_inline_color Inline Code Color, defaults to #000
#' @param code_inline_background_color Inline Code Background Color, defaults to NA
#' @param inverse_background_color Inverse Background Color, defaults to #272822
#' @param inverse_text_color Inverse Text Color, defaults to #d6d6d6
#' @param inverse_text_shadow Enables Shadow on text of inverse slides, defaults to `FALSE`
#' @param inverse_header_color Inverse Header Color, defaults to #f3f3f3
#' @param title_slide_text_color Title Slide Text Color, defaults to `inverse_text_color`
#' @param title_slide_background_color Title Slide Background Color, defaults to `inverse_background_color`
#' @param title_slide_background_image Title Slide Background Image URL, defaults to NA
#' @param title_slide_background_size Title Slide Background Image Size, defaults to "cover" if background image is set, defaults to NA
#' @param title_slide_background_position Title Slide Background Image Position, defaults to NA
#' @param left_column_subtle_color Left Column Text (not last), defaults to #777
#' @param left_column_selected_color Left Column Current Selection, defaults to #000
#' @param blockquote_left_color Blockquote Left Border Color, defaults to lightgray
#' @param table_border_color Table top/bottom border, defaults to #666
#' @param table_row_border_color Table row inner bottom border, defaults to #ddd
#' @param table_row_even_background_color Table Even Row Background Color, defaults to #eee
#' @param text_size Slide Body Text Size, defaults to 20px
#' @param header_h1_font_size h1 Header Text Size, defaults to 2.75em
#' @param header_h2_font_size h2 Header Text Size, defaults to 2.25em
#' @param header_h3_font_size h3 Header Text Size, defaults to 1.75em
#' @param text_slide_number_font_size Slide Number Text Size, defaults to 0.9em
#' @param code_inline_font_size Inline Code Text Size, defaults to 1em
#' @param code_font_size Code Text Size, defaults to 0.9em
#' @param text_font_google Use `google_font()` to specify body font, defaults to `NULL`
#' @param text_font_family Body Text Font Family, defaults to 'Droid Serif'
#' @param text_font_weight Body Text Font Weight, defaults to normal
#' @param text_font_url Body Text Font URL(s), defaults to https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic
#' @param text_font_family_fallback Body Text Font Fallbacks, defaults to 'Palatino Linotype', 'Book Antiqua', Palatino, 'Microsoft YaHei', 'Songti SC'
#' @param text_font_base Body Text Base Font (Total Failure Fallback), defaults to serif
#' @param header_font_google Use `google_font()` to specify header font, defaults to `NULL`
#' @param header_font_family Header Font Family, defaults to 'Yanone Kaffeesatz'
#' @param header_font_weight Header Font Weight, defaults to normal
#' @param header_font_url Header Font URL, defaults to https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz
#' @param code_font_google Use `google_font()` to specify code font, defaults to `NULL`
#' @param code_font_family Code Font Family, defaults to 'Source Code Pro'
#' @param code_font_url Code Font URL, defaults to https://fonts.googleapis.com/css?family=Source+Code+Pro:400,700
#' @param code_font_family_fallback Code Font Fallback, defaults to 'Lucida Console', Monaco
#' @template extra_css
#' @param outfile Customized xaringan CSS output file name, default is "xaringan-themer.css"
#' @template write_xaringan_theme
#' @export
write_xaringan_theme <- function(
  text_color = "#000",
  header_color = "#000",
  background_color = "#FFF",
  link_color = "rgb(249, 38, 114)",
  text_bold_color = NA,
  text_slide_number_color = inverse_background_color,
  code_highlight_color = "rgba(255,255,0,0.5)",
  code_inline_color = "#000",
  code_inline_background_color = NA,
  inverse_background_color = "#272822",
  inverse_text_color = "#d6d6d6",
  inverse_text_shadow = FALSE,
  inverse_header_color = "#f3f3f3",
  title_slide_text_color = inverse_text_color,
  title_slide_background_color = inverse_background_color,
  title_slide_background_image = NA,
  title_slide_background_size = NA,
  title_slide_background_position = NA,
  left_column_subtle_color = "#777",
  left_column_selected_color = "#000",
  blockquote_left_color = "lightgray",
  table_border_color = "#666",
  table_row_border_color = "#ddd",
  table_row_even_background_color = "#eee",
  text_size = "20px",
  header_h1_font_size = "2.75em",
  header_h2_font_size = "2.25em",
  header_h3_font_size = "1.75em",
  text_slide_number_font_size = "0.9em",
  code_inline_font_size = "1em",
  code_font_size = "0.9em",
  text_font_google = NULL,
  text_font_family = "'Droid Serif'",
  text_font_weight = "normal",
  text_font_url = "https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic",
  text_font_family_fallback = "'Palatino Linotype', 'Book Antiqua', Palatino, 'Microsoft YaHei', 'Songti SC'",
  text_font_base = "serif",
  header_font_google = NULL,
  header_font_family = "'Yanone Kaffeesatz'",
  header_font_weight = "normal",
  header_font_url = "https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz",
  code_font_google = NULL,
  code_font_family = "'Source Code Pro'",
  code_font_url = "https://fonts.googleapis.com/css?family=Source+Code+Pro:400,700",
  code_font_family_fallback = "'Lucida Console', Monaco",
  extra_css = NULL,
  extra_fonts = NULL,
  outfile = "xaringan-themer.css"
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
  
  extra_font_imports <- if (is.null(extra_fonts)) "" else list2fonts(extra_fonts)
  
  tf <- system.file("resources", "template.css", package = "xaringanthemer")
  template <- readLines(tf, warn = FALSE)
  template <- paste(template, collapse = "\n")
  x <- glue::glue(template, .open = "{{", .close = "}}")
  cat(x, file = outfile)
  if (!is.null(extra_css)) write_extra_css(extra_css, outfile)
  outfile
}
