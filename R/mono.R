#' Monotone Light Theme
#'
#' @param base_color Monotone Base Color, works best with a strong darkish color
#' @param white_color Color for "white". Monotone Light defaults to a very light
#'   version of the `base_color`
#' @param black_color Color for "black". Monotone Light defaults to a dark,
#'   nearly black version of the `base_color`
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
#' @export
mono_light <- function(
  base_color                      = "#23395b",
  white_color                     = lighten_color(base_color, 0.9),
  black_color                     = darken_color(base_color, 0.3),
  text_color                      = black_color,
  header_color                    = base_color,
  background_color                = white_color,
  link_color                      = base_color,
  text_bold_color                 = base_color,
  text_slide_number_color         = base_color,
  code_highlight_color            = "#ffff88",
  code_inline_color               = base_color,
  code_inline_background_color    = NA,
  inverse_background_color        = base_color,
  inverse_text_color              = white_color,
  inverse_text_shadow             = FALSE,
  inverse_header_color            = white_color,
  title_slide_text_color          = inverse_text_color,
  title_slide_background_color    = inverse_background_color,
  title_slide_background_image    = NA,
  left_column_subtle_color        = lighten_color(base_color, 0.5),
  left_column_selected_color      = base_color,
  blockquote_left_color           = lighten_color(base_color, 0.5),
  table_border_color              = "#666",
  table_row_border_color          = "#ddd",
  table_row_even_background_color = lighten_color(base_color, 0.8),
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
  eval(parse(text = call_write_xaringan_theme()))
}

#' Monotone Dark Theme
#'
#' @param base_color Monotone Base Color, works best with a light color.
#' @param white_color Color for "white". Monotone Light defaults to a very light
#'   version of the `base_color`
#' @param black_color Color for "black". Monotone Light defaults to a dark,
#'   nearly black version of the `base_color`
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
#' @export
mono_dark <- function(
  base_color                      = "#cbf7ed",
  white_color                     = lighten_color(base_color, 0.8),
  black_color                     = darken_color(base_color, 0.85),
  text_color                      = white_color,
  header_color                    = base_color,
  background_color                = black_color,
  link_color                      = base_color,
  text_bold_color                 = base_color,
  text_slide_number_color         = base_color,
  code_highlight_color            = "#ffff88",
  code_inline_color               = base_color,
  code_inline_background_color    = NA,
  inverse_background_color        = base_color,
  inverse_text_color              = black_color,
  inverse_text_shadow             = FALSE,
  inverse_header_color            = black_color,
  title_slide_text_color          = inverse_text_color,
  title_slide_background_color    = inverse_background_color,
  title_slide_background_image    = NA,
  left_column_subtle_color        = darken_color(base_color, 0.5),
  left_column_selected_color      = base_color,
  blockquote_left_color           = darken_color(base_color, 0.5),
  table_border_color              = "#666",
  table_row_border_color          = "#ddd",
  table_row_even_background_color = darken_color(base_color, 0.7),
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
  eval(parse(text = call_write_xaringan_theme()))
}

#' Monotone Accent Theme
#'
#' @param base_color Monotone Base Color
#' @param white_color Color for "white". Monotone Light defaults to a very light
#'   version of the `base_color`
#' @param black_color Color for "black". Monotone Light defaults to a dark,
#'   nearly black version of the `base_color`
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
#' @export
mono_accent <- function(
  base_color                      = "#23395b",
  white_color                     = "#FFF",
  black_color                     = "#272822",
  text_color                      = black_color,
  header_color                    = base_color,
  background_color                = white_color,
  link_color                      = base_color,
  text_bold_color                 = base_color,
  text_slide_number_color         = base_color,
  code_highlight_color            = "#ffff88",
  code_inline_color               = base_color,
  code_inline_background_color    = NA,
  inverse_background_color        = base_color,
  inverse_text_color              = white_color,
  inverse_text_shadow             = FALSE,
  inverse_header_color            = white_color,
  title_slide_text_color          = inverse_text_color,
  title_slide_background_color    = inverse_background_color,
  title_slide_background_image    = NA,
  left_column_subtle_color        = lighten_color(base_color, 0.5),
  left_column_selected_color      = base_color,
  blockquote_left_color           = lighten_color(base_color, 0.5),
  table_border_color              = "#666",
  table_row_border_color          = "#ddd",
  table_row_even_background_color = lighten_color(base_color, 0.7),
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
  eval(parse(text = call_write_xaringan_theme()))
}

#' Monotone Accent Inverse Theme
#'
#' @param base_color Monotone Base Color
#' @param white_color Color for "white". Monotone Light defaults to a very light
#'   version of the `base_color`
#' @param black_color Color for "black". Monotone Light defaults to a dark,
#'   nearly black version of the `base_color`
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
#' @export
mono_accent_inverse <- function(
  base_color                      = "#cbf7ed",
  white_color                     = "#FFF",
  black_color                     = darken_color(base_color, 0.9),
  text_color                      = white_color,
  header_color                    = base_color,
  background_color                = black_color,
  link_color                      = base_color,
  text_bold_color                 = base_color,
  text_slide_number_color         = base_color,
  code_highlight_color            = "#ffff88",
  code_inline_color               = base_color,
  code_inline_background_color    = NA,
  inverse_background_color        = base_color,
  inverse_text_color              = black_color,
  inverse_text_shadow             = FALSE,
  inverse_header_color            = black_color,
  title_slide_text_color          = inverse_text_color,
  title_slide_background_color    = inverse_background_color,
  title_slide_background_image    = NA,
  left_column_subtle_color        = darken_color(base_color, 0.5),
  left_column_selected_color      = base_color,
  blockquote_left_color           = darken_color(base_color, 0.5),
  table_border_color              = "#666",
  table_row_border_color          = "#ddd",
  table_row_even_background_color = darken_color(base_color, 0.7),
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
  eval(parse(text = call_write_xaringan_theme()))
}
