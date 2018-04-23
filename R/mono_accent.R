#' @param base_color Monotone Base Color, works best with a strong color., defaults to #43418A
#' @param white_color Brightest color used, defaults to #FFFFFF
#' @param black_color Darkest color used, defaults to #272822
#' @param text_color Text Color, defaults to `black_color`
#' @param header_color Header Color, defaults to `base_color`
#' @param background_color Slide Background Color, defaults to `white_color`
#' @param link_color Link Color, defaults to `base_color`
#' @param text_bold_color Bold Text Color, defaults to `base_color`
#' @param text_slide_number_color Slide Number Color, defaults to `base_color`
#' @param code_highlight_color Code Line Highlight, defaults to rgba(255,255,0,0.5)
#' @param code_inline_color Inline Code Color, defaults to `base_color`
#' @param code_inline_background_color Inline Code Background Color, defaults to NA
#' @param inverse_background_color Inverse Background Color, defaults to `base_color`
#' @param inverse_text_color Inverse Text Color, defaults to `white_color`
#' @param inverse_text_shadow Enables Shadow on text of inverse slides, defaults to `FALSE`
#' @param inverse_header_color Inverse Header Color, defaults to `white_color`
#' @param title_slide_text_color Title Slide Text Color, defaults to `inverse_text_color`
#' @param title_slide_background_color Title Slide Background Color, defaults to `inverse_background_color`
#' @param title_slide_background_image Title Slide Background Image URL, defaults to NA
#' @param title_slide_background_size Title Slide Background Image Size, defaults to "cover" if background image is set, defaults to NA
#' @param title_slide_background_position Title Slide Background Image Position, defaults to NA
#' @param left_column_subtle_color Left Column Text (not last), defaults to `apply_alpha(base_color, 0.6)`
#' @param left_column_selected_color Left Column Current Selection, defaults to `base_color`
#' @param blockquote_left_color Blockquote Left Border Color, defaults to `apply_alpha(base_color, 0.5)`
#' @param table_border_color Table top/bottom border, defaults to #666
#' @param table_row_border_color Table row inner bottom border, defaults to #ddd
#' @param table_row_even_background_color Table Even Row Background Color, defaults to `lighten_color(base_color, 0.7)`
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
#' @template mono_accent
#' @family Monotone themes
#' @export
mono_accent <- function(
  base_color = "#43418A",
  white_color = "#FFFFFF",
  black_color = "#272822",
  text_color = black_color,
  header_color = base_color,
  background_color = white_color,
  link_color = base_color,
  text_bold_color = base_color,
  text_slide_number_color = base_color,
  code_highlight_color = "rgba(255,255,0,0.5)",
  code_inline_color = base_color,
  code_inline_background_color = NA,
  inverse_background_color = base_color,
  inverse_text_color = white_color,
  inverse_text_shadow = FALSE,
  inverse_header_color = white_color,
  title_slide_text_color = inverse_text_color,
  title_slide_background_color = inverse_background_color,
  title_slide_background_image = NA,
  title_slide_background_size = NA,
  title_slide_background_position = NA,
  left_column_subtle_color = apply_alpha(base_color, 0.6),
  left_column_selected_color = base_color,
  blockquote_left_color = apply_alpha(base_color, 0.5),
  table_border_color = "#666",
  table_row_border_color = "#ddd",
  table_row_even_background_color = lighten_color(base_color, 0.7),
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
  # DO NOT EDIT - Generated from inst/scripts/generate_theme_functions.R
  eval(parse(text = call_write_xaringan_theme()))
}
