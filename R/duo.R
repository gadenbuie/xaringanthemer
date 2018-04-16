#' @param primary_color Duotone Primary Color, defaults to #1F4257
#' @param secondary_color Duotone Secondary Color, defaults to #F97B64
#' @param text_color Text Color, defaults to `choose_dark_or_light(primary_color, darken_color(primary_color, 0.9), lighten_color(secondary_color, 0.99))`
#' @param header_color Header Color, defaults to `secondary_color`
#' @param background_color Slide Background Color, defaults to `primary_color`
#' @param link_color Link Color, defaults to `secondary_color`
#' @param text_bold_color Bold Text Color, defaults to `secondary_color`
#' @param text_slide_number_color Slide Number Color, defaults to `text_color`
#' @param code_highlight_color Code Line Highlight, defaults to rgba(255,255,0,0.5)
#' @param code_inline_color Inline Code Color, defaults to `secondary_color`
#' @param code_inline_background_color Inline Code Background Color, defaults to NA
#' @param inverse_background_color Inverse Background Color, defaults to `secondary_color`
#' @param inverse_text_color Inverse Text Color, defaults to `primary_color`
#' @param inverse_text_shadow Enables Shadow on text of inverse slides, defaults to `FALSE`
#' @param inverse_header_color Inverse Header Color, defaults to `primary_color`
#' @param title_slide_text_color Title Slide Text Color, defaults to `secondary_color`
#' @param title_slide_background_color Title Slide Background Color, defaults to `primary_color`
#' @param title_slide_background_image Title Slide Background Image URL, defaults to NA
#' @param left_column_subtle_color Left Column Text (not last), defaults to `apply_alpha(secondary_color, 0.6)`
#' @param left_column_selected_color Left Column Current Selection, defaults to `secondary_color`
#' @param blockquote_left_color Blockquote Left Border Color, defaults to `apply_alpha(secondary_color, 0.5)`
#' @param table_border_color Table top/bottom border, defaults to #666
#' @param table_row_border_color Table row inner bottom border, defaults to #ddd
#' @param table_row_even_background_color Table Even Row Background Color, defaults to `lighten_color(primary_color, 0.3)`
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
#' @param outfile Customized xaringan CSS output file name
#' @template duo
#' @family Duotone themes
#' @export
duo <- function(
  primary_color = "#1F4257",
  secondary_color = "#F97B64",
  text_color = choose_dark_or_light(primary_color, darken_color(primary_color, 0.9), lighten_color(secondary_color, 0.99)),
  header_color = secondary_color,
  background_color = primary_color,
  link_color = secondary_color,
  text_bold_color = secondary_color,
  text_slide_number_color = text_color,
  code_highlight_color = "rgba(255,255,0,0.5)",
  code_inline_color = secondary_color,
  code_inline_background_color = NA,
  inverse_background_color = secondary_color,
  inverse_text_color = primary_color,
  inverse_text_shadow = FALSE,
  inverse_header_color = primary_color,
  title_slide_text_color = secondary_color,
  title_slide_background_color = primary_color,
  title_slide_background_image = NA,
  left_column_subtle_color = apply_alpha(secondary_color, 0.6),
  left_column_selected_color = secondary_color,
  blockquote_left_color = apply_alpha(secondary_color, 0.5),
  table_border_color = "#666",
  table_row_border_color = "#ddd",
  table_row_even_background_color = lighten_color(primary_color, 0.3),
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
  outfile = "xaringan-themed.css"
) {
  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R
  eval(parse(text = call_write_xaringan_theme()))
}
