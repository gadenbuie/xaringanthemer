template_variables <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description
  , "text_color", "#000", "body", "Text Color"
  , "header_color", "#000", "h1, h2, h3", "Header Color"
  , "background_color", "#FFF", ".remark-slide-content", "Slide Background Color"
  , "link_color", "rgb(249, 38, 114)", "a, a > code", "Link Color"
  , "text_bold_color", NA_character_, "strong", "Bold Text Color"
  , "text_slide_number_color", "{inverse_background_color}", ".remark-slide-number", "Slide Number Color"
  , "code_highlight_color", "rgba(255,255,0,0.5)", ".remark-code-line-highlighted", "Code Line Highlight"
  , "code_inline_color", "#000", ".remark-inline-code", "Inline Code Color"
  , "code_inline_background_color", NA_character_, ".remark-inline-code", "Inline Code Background Color"
  , "inverse_background_color", "#272822", ".inverse", "Inverse Background Color"
  , "inverse_text_color", "#d6d6d6", ".inverse", "Inverse Text Color"
  , "inverse_text_shadow", "{FALSE}", ".inverse", "Enables Shadow on text of inverse slides"
  , "inverse_header_color", "#f3f3f3", ".inverse h1, .inverse h2, .inverse h3", "Inverse Header Color"
  , "title_slide_text_color", "{inverse_text_color}", ".title-slide", "Title Slide Text Color"
  , "title_slide_background_color", "{inverse_background_color}", ".title-slide", "Title Slide Background Color"
  , "title_slide_background_image", NA_character_, ".title-slide", "Title Slide Background Image URL"
  , "left_column_subtle_color", "#777", ".left-column", "Left Column Text (not last)"
  , "left_column_selected_color", "#000", ".left-column h2:last-of-type, .left-column h3:last-child", "Left Column Current Selection"
  , "blockquote_left_color", "lightgray", "blockquote", "Blockquote Left Border Color"
  , "table_border_color", "#666", "table: border-top, border-bottom", "Table top/bottom border"
  , "table_row_border_color", "#ddd", "table thead th: border-bottom", "Table row inner bottom border"
  , "table_row_even_background_color", "#eee", "thead, tfoot, tr:nth-child(even)", "Table Even Row Background Color"
  , "text_font_google", NULL, "body", "Use `google_font()` to specify body font"
  , "text_font_family", "'Droid Serif'", "body", "Body Text Font Family"
  , "text_font_weight", "normal", "body", "Body Text Font Weight"
  , "text_font_url", "https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic", "@import url()", "Body Text Font URL(s)"
  , "text_font_family_fallback", "'Palatino Linotype', 'Book Antiqua', Palatino, 'Microsoft YaHei', 'Songti SC'", "body", "Body Text Font Fallbacks"
  , "text_font_base", "serif", "body", "Body Text Base Font (Total Failure Fallback)"
  , "header_font_google", NULL, "body", "Use `google_font()` to specify header font"
  , "header_font_family", "'Yanone Kaffeesatz'", "h1, h2, h3", "Header Font Family"
  , "header_font_weight", "normal", "h1, h2, h3", "Header Font Weight"
  , "header_font_url", "https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz", "@import url", "Header Font URL"
  , "code_font_google", NULL, "body", "Use `google_font()` to specify code font"
  , "code_font_family", "'Source Code Pro'", ".remark-code, .remark-inline-code", "Code Font Family"
  , "code_font_url", "https://fonts.googleapis.com/css?family=Source+Code+Pro:400,700", "@import url", "Code Font URL"
  , "code_font_family_fallback", "'Lucida Console', Monaco", ".remark-code, .remark-inline-code", "Code Font Fallback"
)

set_default <- function(tv, ...) {
  vars <- c(...)
  for (var in names(vars)) {
    tv[tv$variable == var, 'default'] <- vars[var]
  }
  tv
}

template_mono_light <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description
  , "base_color", "#23395b", "multiple", "Monotone base color, works best with a strong color"
  , "white_color", "{lighten_color(base_color, 0.9)}", "multiple", "Brightest color used, default is a very light version of `base_color`"
  , "black_color", "{darken_color(base_color, 0.3)}", "multiple", "Darkest color used, default is a very dark, version of `base_color`"
)
template_mono_light <- do.call('rbind', list(template_mono_light, template_variables))
template_mono_light <- set_default(
  template_mono_light,
  text_color                      = "{black_color}",
  header_color                    = "{base_color}",
  background_color                = "{white_color}",
  link_color                      = "{base_color}",
  text_bold_color                 = "{base_color}",
  text_slide_number_color         = "{base_color}",
  code_inline_color               = "{base_color}",
  inverse_background_color        = "{base_color}",
  inverse_text_color              = "{white_color}",
  inverse_header_color            = "{white_color}",
  left_column_subtle_color        = "{lighten_color(base_color, 0.5)}",
  left_column_selected_color      = "{base_color}",
  blockquote_left_color           = "{lighten_color(base_color, 0.5)}",
  table_row_even_background_color = "{lighten_color(base_color, 0.8)}")

template_mono_dark <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description
  , "base_color", "#cbf7ed", "multiple", "Monotone Base Color, works best with a light color."
  , "white_color", "{lighten_color(base_color, 0.8)}", "multiple", "Brightest color used, default is a very light version of `base_color`"
  , "black_color", "{darken_color(base_color, 0.85)}", "multiple", "Darkest color used, default is a very dark, version of `base_color`"
)
template_mono_dark <- do.call('rbind', list(template_mono_dark, template_variables))
template_mono_dark <- set_default(
  template_mono_dark,
  text_color                      = "{white_color}",
  header_color                    = "{base_color}",
  background_color                = "{black_color}",
  link_color                      = "{base_color}",
  text_bold_color                 = "{base_color}",
  text_slide_number_color         = "{base_color}",
  code_inline_color               = "{base_color}",
  inverse_background_color        = "{base_color}",
  inverse_text_color              = "{black_color}",
  inverse_header_color            = "{black_color}",
  left_column_subtle_color        = "{darken_color(base_color, 0.5)}",
  left_column_selected_color      = "{base_color}",
  blockquote_left_color           = "{darken_color(base_color, 0.5)}",
  table_row_even_background_color = "{darken_color(base_color, 0.7)}")

template_mono_accent <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description
  , "base_color", "#23395b", "multiple", "Monotone Base Color, works best with a strong color."
  , "white_color", "#FFFFFF", "multiple", "Brightest color used"
  , "black_color", "#272822", "multiple", "Darkest color used"
)
template_mono_accent <- do.call('rbind', list(template_mono_accent, template_variables))
template_mono_accent <- set_default(
  template_mono_accent,
  text_color                      = "{black_color}",
  header_color                    = "{base_color}",
  background_color                = "{white_color}",
  link_color                      = "{base_color}",
  text_bold_color                 = "{base_color}",
  text_slide_number_color         = "{base_color}",
  code_inline_color               = "{base_color}",
  inverse_background_color        = "{base_color}",
  inverse_text_color              = "{white_color}",
  inverse_header_color            = "{white_color}",
  left_column_subtle_color        = "{lighten_color(base_color, 0.5)}",
  left_column_selected_color      = "{base_color}",
  blockquote_left_color           = "{lighten_color(base_color, 0.5)}",
  table_row_even_background_color = "{lighten_color(base_color, 0.7)}")

template_mono_accent_inverse <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description
  , "base_color", "#3C989E", "multiple", "Monotone Base Color, works best with a light color."
  , "white_color", "#FFFFFF", "multiple", "Brightest color used, default is a very light version of `base_color`"
  , "black_color", "{darken_color(base_color, 0.9)}", "multiple", "Darkest color used, default is a very dark, version of `base_color`"
)
template_mono_accent_inverse <- do.call('rbind', list(template_mono_accent_inverse, template_variables))
template_mono_accent_inverse <- set_default(
  template_mono_accent_inverse,
  text_color                      = "{white_color}",
  header_color                    = "{base_color}",
  background_color                = "{black_color}",
  link_color                      = "{base_color}",
  text_bold_color                 = "{base_color}",
  text_slide_number_color         = "{base_color}",
  code_inline_color               = "{base_color}",
  inverse_background_color        = "{base_color}",
  inverse_text_color              = "{black_color}",
  inverse_header_color            = "{black_color}",
  left_column_subtle_color        = "{darken_color(base_color, 0.5)}",
  left_column_selected_color      = "{base_color}",
  blockquote_left_color           = "{darken_color(base_color, 0.5)}",
  table_row_even_background_color = "{darken_color(base_color, 0.7)}")
