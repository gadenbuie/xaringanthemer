#' Monotone Light Theme
#'
#' @param base_color Monotone base color, works best with a strong color, defaults to #23395b
#' @param white_color Brightest color used, default is a very light version of `base_color`, defaults to `lighten_color(base_color, 0.9)`
#' @param black_color Darkest color used, default is a very dark, version of `base_color`, defaults to `darken_color(base_color, 0.3)`
#' @param text_color Text Color, defaults to `black_color`
#' @param header_color Header Color, defaults to `base_color`
#' @param background_color Slide Background Color, defaults to `white_color`
#' @param link_color Link Color, defaults to `base_color`
#' @param text_bold_color Bold Text Color, defaults to `base_color`
#' @param text_slide_number_color Slide Number Color, defaults to `base_color`
#' @param code_highlight_color Code Line Highlight, defaults to #ffff88
#' @param code_inline_color Inline Code Color, defaults to `base_color`
#' @param code_inline_background_color Inline Code Background Color, defaults to NA
#' @param inverse_background_color Inverse Background Color, defaults to `base_color`
#' @param inverse_text_color Inverse Text Color, defaults to `white_color`
#' @param inverse_text_shadow Enables Shadow on text of inverse slides, defaults to `FALSE`
#' @param inverse_header_color Inverse Header Color, defaults to `white_color`
#' @param title_slide_text_color Title Slide Text Color, defaults to `inverse_text_color`
#' @param title_slide_background_color Title Slide Background Color, defaults to `inverse_background_color`
#' @param title_slide_background_image Title Slide Background Image URL, defaults to NA
#' @param left_column_subtle_color Left Column Text (not last), defaults to `lighten_color(base_color, 0.5)`
#' @param left_column_selected_color Left Column Current Selection, defaults to `base_color`
#' @param blockquote_left_color Blockquote Left Border Color, defaults to `lighten_color(base_color, 0.5)`
#' @param table_border_color Table top/bottom border, defaults to #666
#' @param table_row_border_color Table row inner bottom border, defaults to #ddd
#' @param table_row_even_background_color Table Even Row Background Color, defaults to `lighten_color(base_color, 0.8)`
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
# generator: setup_theme_function("mono_light", template_mono_light, TRUE, "#' @export", body = "  eval(parse(text = call_write_xaringan_theme()))")

#' Monotone Dark Theme
#'
#' @param base_color Monotone Base Color, works best with a light color., defaults to #cbf7ed
#' @param white_color Brightest color used, default is a very light version of `base_color`, defaults to `lighten_color(base_color, 0.8)`
#' @param black_color Darkest color used, default is a very dark, version of `base_color`, defaults to `darken_color(base_color, 0.85)`
#' @param text_color Text Color, defaults to `white_color`
#' @param header_color Header Color, defaults to `base_color`
#' @param background_color Slide Background Color, defaults to `black_color`
#' @param link_color Link Color, defaults to `base_color`
#' @param text_bold_color Bold Text Color, defaults to `base_color`
#' @param text_slide_number_color Slide Number Color, defaults to `base_color`
#' @param code_highlight_color Code Line Highlight, defaults to #ffff88
#' @param code_inline_color Inline Code Color, defaults to `base_color`
#' @param code_inline_background_color Inline Code Background Color, defaults to NA
#' @param inverse_background_color Inverse Background Color, defaults to `base_color`
#' @param inverse_text_color Inverse Text Color, defaults to `black_color`
#' @param inverse_text_shadow Enables Shadow on text of inverse slides, defaults to `FALSE`
#' @param inverse_header_color Inverse Header Color, defaults to `black_color`
#' @param title_slide_text_color Title Slide Text Color, defaults to `inverse_text_color`
#' @param title_slide_background_color Title Slide Background Color, defaults to `inverse_background_color`
#' @param title_slide_background_image Title Slide Background Image URL, defaults to NA
#' @param left_column_subtle_color Left Column Text (not last), defaults to `darken_color(base_color, 0.5)`
#' @param left_column_selected_color Left Column Current Selection, defaults to `base_color`
#' @param blockquote_left_color Blockquote Left Border Color, defaults to `darken_color(base_color, 0.5)`
#' @param table_border_color Table top/bottom border, defaults to #666
#' @param table_row_border_color Table row inner bottom border, defaults to #ddd
#' @param table_row_even_background_color Table Even Row Background Color, defaults to `darken_color(base_color, 0.7)`
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
# setup_theme_function("mono_dark", template_mono_dark, "#' @export", body = "  eval(parse(text = call_write_xaringan_theme()))")

#' Monotone Accent Theme
#'
#' @param base_color Monotone Base Color, works best with a strong color., defaults to #23395b
#' @param white_color Brightest color used, defaults to #FFFFFF
#' @param black_color Darkest color used, defaults to #272822
#' @param text_color Text Color, defaults to `black_color`
#' @param header_color Header Color, defaults to `base_color`
#' @param background_color Slide Background Color, defaults to `white_color`
#' @param link_color Link Color, defaults to `base_color`
#' @param text_bold_color Bold Text Color, defaults to `base_color`
#' @param text_slide_number_color Slide Number Color, defaults to `base_color`
#' @param code_highlight_color Code Line Highlight, defaults to #ffff88
#' @param code_inline_color Inline Code Color, defaults to `base_color`
#' @param code_inline_background_color Inline Code Background Color, defaults to NA
#' @param inverse_background_color Inverse Background Color, defaults to `base_color`
#' @param inverse_text_color Inverse Text Color, defaults to `white_color`
#' @param inverse_text_shadow Enables Shadow on text of inverse slides, defaults to `FALSE`
#' @param inverse_header_color Inverse Header Color, defaults to `white_color`
#' @param title_slide_text_color Title Slide Text Color, defaults to `inverse_text_color`
#' @param title_slide_background_color Title Slide Background Color, defaults to `inverse_background_color`
#' @param title_slide_background_image Title Slide Background Image URL, defaults to NA
#' @param left_column_subtle_color Left Column Text (not last), defaults to `lighten_color(base_color, 0.5)`
#' @param left_column_selected_color Left Column Current Selection, defaults to `base_color`
#' @param blockquote_left_color Blockquote Left Border Color, defaults to `lighten_color(base_color, 0.5)`
#' @param table_border_color Table top/bottom border, defaults to #666
#' @param table_row_border_color Table row inner bottom border, defaults to #ddd
#' @param table_row_even_background_color Table Even Row Background Color, defaults to `lighten_color(base_color, 0.7)`
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
#' @export
mono_accent <- function(
  base_color                      = "#23395b",
  white_color                     = "#FFFFFF",
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
# setup_theme_function("mono_accent", template_mono_accent, "#' @export", body = "  eval(parse(text = call_write_xaringan_theme()))")

#' Monotone Accent Inverse Theme
#'
#' @param base_color Monotone Base Color, works best with a light color., defaults to #cbf7ed
#' @param white_color Brightest color used, default is a very light version of `base_color`, defaults to #FFFFFF
#' @param black_color Darkest color used, default is a very dark, version of `base_color`, defaults to `darken_color(base_color, 0.9)`
#' @param text_color Text Color, defaults to `white_color`
#' @param header_color Header Color, defaults to `base_color`
#' @param background_color Slide Background Color, defaults to `black_color`
#' @param link_color Link Color, defaults to `base_color`
#' @param text_bold_color Bold Text Color, defaults to `base_color`
#' @param text_slide_number_color Slide Number Color, defaults to `base_color`
#' @param code_highlight_color Code Line Highlight, defaults to #ffff88
#' @param code_inline_color Inline Code Color, defaults to `base_color`
#' @param code_inline_background_color Inline Code Background Color, defaults to NA
#' @param inverse_background_color Inverse Background Color, defaults to `base_color`
#' @param inverse_text_color Inverse Text Color, defaults to `black_color`
#' @param inverse_text_shadow Enables Shadow on text of inverse slides, defaults to `FALSE`
#' @param inverse_header_color Inverse Header Color, defaults to `black_color`
#' @param title_slide_text_color Title Slide Text Color, defaults to `inverse_text_color`
#' @param title_slide_background_color Title Slide Background Color, defaults to `inverse_background_color`
#' @param title_slide_background_image Title Slide Background Image URL, defaults to NA
#' @param left_column_subtle_color Left Column Text (not last), defaults to `darken_color(base_color, 0.5)`
#' @param left_column_selected_color Left Column Current Selection, defaults to `base_color`
#' @param blockquote_left_color Blockquote Left Border Color, defaults to `darken_color(base_color, 0.5)`
#' @param table_border_color Table top/bottom border, defaults to #666
#' @param table_row_border_color Table row inner bottom border, defaults to #ddd
#' @param table_row_even_background_color Table Even Row Background Color, defaults to `darken_color(base_color, 0.7)`
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
#' @export
mono_accent_inverse <- function(
  base_color                      = "#cbf7ed",
  white_color                     = "#FFFFFF",
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
# setup_theme_function("mono_accent_inverse", template_mono_accent_inverse, "#' @export", body = "  eval(parse(text = call_write_xaringan_theme()))")
