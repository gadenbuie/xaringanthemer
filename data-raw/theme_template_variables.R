#nocov start
template_variables <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description, ~ css_variable
  , "text_color", "#000", "body", "Text Color", "--text_color"
  , "header_color", "#000", "h1, h2, h3", "Header Color", "--header-color"
  , "background_color", "#FFF", ".remark-slide-content", "Slide Background Color", "--background-color"
  , "link_color", "rgb(249, 38, 114)", "a, a > code", "Link Color", "--link-color"
  , "text_bold_color", "{NULL}", "strong", "Bold Text Color", "--text-bold-color"
  , "text_slide_number_color", "{inverse_background_color}", ".remark-slide-number", "Slide Number Color", NA_character_
  , "padding", "16px 64px 16px 64px", ".remark-slide-content", "Slide Padding in `top right [bottom left]` format", NA_character_
  , "background_image", "{NULL}", ".remark-slide-content", "Background image applied to each *and every* slide. Set `title_slide_background_image = \"none\"` to remove the background image from the title slide", NA_character_
  , "background_size", "{NULL}", ".remark-slide-content", "Background image size, requires `background_image` to be set. If `background_image` is set, `background_size` will default to `cover` so the backround fills the screen. If both `background_image` and `background_position` are set, will default to 100 percent", NA_character_
  , "background_position", "{NULL}", ".remark-slide-content", "Background image position, requires `background_image` to be set, and it is recommended to adjust `background_size`", NA_character_
  , "code_highlight_color", "rgba(255,255,0,0.5)", ".remark-code-line-highlighted", "Code Line Highlight", "--code-highlight-color"
  , "code_inline_color", "#000", ".remark-inline-code", "Inline Code Color", NA_character_
  , "code_inline_background_color", "{NULL}", ".remark-inline-code", "Inline Code Background Color", NA_character_
  , "code_inline_font_size", "1em", ".remark-inline-code", "Inline Code Text Font Size", "--code-inline-font-size"
  , "inverse_background_color", "#272822", ".inverse", "Inverse Background Color", "--inverse-background-color"
  , "inverse_text_color", "#d6d6d6", ".inverse", "Inverse Text Color", "--inverse-text-color"
  , "inverse_text_shadow", "{FALSE}", ".inverse", "Enables Shadow on text of inverse slides", NA_character_
  , "inverse_header_color", "#f3f3f3", ".inverse h1, .inverse h2, .inverse h3", "Inverse Header Color", "--inverse-header-color"
  , "title_slide_text_color", "{inverse_text_color}", ".title-slide", "Title Slide Text Color", "--title-slide-text-color"
  , "title_slide_background_color", "{inverse_background_color}", ".title-slide", "Title Slide Background Color", "--title-slide-background-color"
  , "title_slide_background_image", "{NULL}", ".title-slide", "Title Slide Background Image URL", NA_character_
  , "title_slide_background_size", "{NULL}", ".title-slide", "Title Slide Background Image Size, defaults to \"cover\" if background image is set", NA_character_
  , "title_slide_background_position", "{NULL}", ".title-slide", "Title Slide Background Image Position", NA_character_
  , "footnote_color", "{NULL}", ".footnote", "Footnote text color (if `NA`, then it will be the same color as `text_color`)", NA_character_
  , "footnote_font_size", "0.9em", ".footnote", "Footnote font size", NA_character_
  , "footnote_position_bottom", "60px", ".footnote", "Footnote location from bottom of screen", NA_character_
  , "left_column_subtle_color", "#777", ".left-column h2, .left-column h3", "Left Column Text (not last)", NA_character_
  , "left_column_selected_color", "#000", ".left-column h2:last-of-type, .left-column h3:last-child", "Left Column Current Selection", NA_character_
  , "blockquote_left_border_color", "lightgray", "blockquote", "Blockquote Left Border Color", NA_character_
  , "table_border_color", "#666", "table: border-top, border-bottom", "Table top/bottom border", NA_character_
  , "table_row_border_color", "#ddd", "table thead th: border-bottom", "Table row inner bottom border", NA_character_
  , "table_row_even_background_color", "#eee", "thead, tfoot, tr:nth-child(even)", "Table Even Row Background Color", NA_character_
  , "base_font_size", "20px", "html", "Base Font Size for All Slide Elements (must be `px`)", "--base-font-size"
  , "text_font_size", "1rem", ".remark-slide-content", "Slide Body Text Font Size", "--text-font-size"
  , "header_h1_font_size", "2.75rem", ".remark-slide-content h1", "h1 Header Text Font Size", "--header-h1-font-size"
  , "header_h2_font_size", "2.25rem", ".remark-slide-content h2", "h2 Header Text Font Size", "--header-h2-font-size"
  , "header_h3_font_size", "1.75rem", ".remark-slide-content h3", "h3 Header Text Font Size", "--header-h3-font-size"
  , "header_background_auto", "{FALSE}", "", "Add background under slide title automatically for h1 header elements. If not enabled, use `class: header_background` to enable", NA_character_
  , "header_background_color", "{header_color}", ".remark-slide-content h1", "Background Color for h1 Header with Background", "--header-background-color"
  , "header_background_text_color", "{background_color}", ".remark-slide-content h1", "Text Color for h1 Header with Background", "--header-background-text-color"
  , "header_background_padding", "{NULL}", ".remark-slide-content h1", "Padding for h1 Header with Background", NA_character_
  , "header_background_content_padding_top", "7rem", ".remark-slide-content", "Top Padding for Content in Slide with Header with Background", NA_character_
  , "header_background_ignore_classes", "{c('normal', 'inverse', 'title', 'middle', 'bottom')}", ".remark-slide-content", "Slide Classes Where Header with Background will not be Applied", NA_character_
  , "text_slide_number_font_size", "0.9em", ".remark-slide-number", "Slide Number Text Font Size", NA_character_
  , "text_font_google", "{NULL}", "body", "Use `google_font()` to specify body font", NA_character_
  , "text_font_family", "Noto Sans", "body", "Body Text Font Family (xaringan default is `'Droid Serif'`)", "--text-font-family"
  , "text_font_weight", "normal", "body", "Body Text Font Weight", NA_character_
  , "text_font_url", "https://fonts.googleapis.com/css?family=Noto+Sans:400,400i,700,700i&display=swap", "@import url()", "Body Text Font URL(s)", NA_character_
  , "text_font_family_fallback", "-apple-system, BlinkMacSystemFont, avenir next, avenir, helvetica neue, helvetica, Ubuntu, roboto, noto, segoe ui, arial", "body", "Body Text Font Fallbacks", "--text-font-family-fallback"
  , "text_font_base", "sans-serif", "body", "Body Text Base Font (Total Failure Fallback)", "--text-font-base"
  , "header_font_google", "{NULL}", "body", "Use `google_font()` to specify header font", NA_character_
  , "header_font_family", "Cabin", "h1, h2, h3", "Header Font Family (xaringan default is `'Yanone Kaffeesatz'`)", "--header-font-family"
  , "header_font_weight", "600", "h1, h2, h3", "Header Font Weight", NA_character_
  , "header_font_url", "https://fonts.googleapis.com/css?family=Cabin:600,600i&display=swap", "@import url", "Header Font URL", NA_character_
  , "code_font_google", "{NULL}", "body", "Use `google_font()` to specify code font", NA_character_
  , "code_font_family", "Source Code Pro", ".remark-code, .remark-inline-code", "Code Font Family", "--code-font-family"
  , "code_font_size", "0.9rem", ".remark-inline", "Code Text Font Size", "--code-font-size"
  , "code_font_url", "https://fonts.googleapis.com/css?family=Source+Code+Pro:400,700&display=swap", "@import url", "Code Font URL", NA_character_
  , "code_font_family_fallback", "Menlo, Consolas, Monaco, Liberation Mono, Lucida Console", ".remark-code, .remark-inline-code", "Code Font Fallback", NA_character_
)

set_default <- function(tv, ...) {
  vars <- c(...)
  for (var in names(vars)) {
    tv[tv$variable == var, 'default'] <- vars[var]
  }
  tv
}

template_mono_light <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description, ~ css_variable
  , "base_color", "#23395b", "multiple", "Monotone base color, works best with a strong color", "--base"
  , "white_color", "{lighten_color(base_color, 0.9)}", "multiple", "Brightest color used, default is a very light version of `base_color`", "--white"
  , "black_color", "{darken_color(base_color, 0.3)}", "multiple", "Darkest color used, default is a very dark, version of `base_color`", "--black"
)
template_mono_light <- dplyr::bind_rows(template_mono_light, template_variables)
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
  left_column_subtle_color        = "{apply_alpha(base_color, 0.6)}",
  left_column_selected_color      = "{base_color}",
  blockquote_left_border_color    = "{apply_alpha(base_color, 0.5)}",
  table_row_even_background_color = "{lighten_color(base_color, 0.8)}")

template_mono_dark <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description, ~ css_variable
  , "base_color", "#cbf7ed", "multiple", "Monotone Base Color, works best with a light color.", "--base"
  , "white_color", "{lighten_color(base_color, 0.8)}", "multiple", "Brightest color used, default is a very light version of `base_color`", "--white"
  , "black_color", "{darken_color(base_color, 0.85)}", "multiple", "Darkest color used, default is a very dark, version of `base_color`", "--black"
)
template_mono_dark <- dplyr::bind_rows(template_mono_dark, template_variables)
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
  left_column_subtle_color        = "{apply_alpha(base_color, 0.6)}",
  left_column_selected_color      = "{base_color}",
  blockquote_left_border_color    = "{apply_alpha(base_color, 0.5)}",
  table_row_even_background_color = "{darken_color(base_color, 0.7)}")

template_mono_accent <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description, ~ css_variable
  , "base_color", "#43418A", "multiple", "Monotone Base Color, works best with a strong color", "--base"
  , "white_color", "#FFFFFF", "multiple", "Brightest color used", "--white"
  , "black_color", "#272822", "multiple", "Darkest color used", "--black"
)
template_mono_accent <- dplyr::bind_rows(template_mono_accent, template_variables)
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
  left_column_subtle_color        = "{apply_alpha(base_color, 0.6)}",
  left_column_selected_color      = "{base_color}",
  blockquote_left_border_color    = "{apply_alpha(base_color, 0.5)}",
  table_row_even_background_color = "{lighten_color(base_color, 0.8)}")

template_mono_accent_inverse <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description, ~ css_variable
  , "base_color", "#3C989E", "multiple", "Monotone Base Color, works best with a light color", "--base"
  , "white_color", "#FFFFFF", "multiple", "Brightest color used, default is a very light version of `base_color`", "--white"
  , "black_color", "{darken_color(base_color, 0.9)}", "multiple", "Darkest color used, default is a very dark, version of `base_color`", "--black"
)
template_mono_accent_inverse <- dplyr::bind_rows(template_mono_accent_inverse, template_variables)
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
  left_column_subtle_color        = "{apply_alpha(base_color, 0.6)}",
  left_column_selected_color      = "{base_color}",
  blockquote_left_border_color    = "{apply_alpha(base_color, 0.5)}",
  table_row_even_background_color = "{darken_color(base_color, 0.8)}")

template_duo_light <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description, ~ css_variable
  , "primary_color", "#1F4257", "multiple", "Duotone Secondary Color", "--primary"
  , "secondary_color", "#F97B64", "multiple", "Duotone Primary Color", "--secondary"
  , "white_color", "{lighten_color(primary_color, 0.99)}", "multiple", "Brightest color used, default is a very light version of `primary_color`", "--white"
  , "black_color", "{darken_color(secondary_color, 0.9)}", "multiple", "Darkest color used, default is a very dark version of `secondary_color`", "--black"
)
template_duo_light <- dplyr::bind_rows(template_duo_light, template_variables)
template_duo_light <- set_default(
  template_duo_light,
  text_color                      = "{black_color}",
  header_color                    = "{primary_color}",
  background_color                = "{white_color}",
  link_color                      = "{secondary_color}",
  text_bold_color                 = "{secondary_color}",
  text_slide_number_color         = "{primary_color}",
  code_inline_color               = "{secondary_color}",
  inverse_background_color        = "{primary_color}",
  inverse_text_color              = "{secondary_color}",
  inverse_header_color            = "{secondary_color}",
  left_column_subtle_color        = "{apply_alpha(secondary_color, 0.6)}",
  left_column_selected_color      = "{secondary_color}",
  blockquote_left_border_color    = "{apply_alpha(secondary_color, 0.5)}",
  table_row_even_background_color = "{lighten_color(secondary_color, 0.9)}")

template_duo <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description, ~ css_variable
  , "primary_color", "#1F4257", "multiple", "Duotone Primary Color", "--primary"
  , "secondary_color", "#F97B64", "multiple", "Duotone Secondary Color", "--secondary"
)
template_duo <- dplyr::bind_rows(template_duo, template_variables)
template_duo <- set_default(
  template_duo,
  text_color                      = "{choose_dark_or_light(primary_color, darken_color(primary_color, 0.9), lighten_color(secondary_color, 0.99))}",
  header_color                    = "{secondary_color}",
  background_color                = "{primary_color}",
  link_color                      = "{secondary_color}",
  text_bold_color                 = "{secondary_color}",
  text_slide_number_color         = "{text_color}",
  code_inline_color               = "{secondary_color}",
  inverse_background_color        = "{secondary_color}",
  inverse_text_color              = "{primary_color}",
  inverse_header_color            = "{primary_color}",
  title_slide_text_color          = "{secondary_color}",
  title_slide_background_color    = "{primary_color}",
  left_column_subtle_color        = "{apply_alpha(secondary_color, 0.6)}",
  left_column_selected_color      = "{secondary_color}",
  blockquote_left_border_color    = "{apply_alpha(secondary_color, 0.5)}",
  table_row_even_background_color = "{lighten_color(primary_color, 0.9)}")

template_duo_accent <- tibble::tribble(
  ~ variable, ~ default, ~ element, ~ description, ~ css_variable
  , "primary_color", "#006747", "multiple", "Duotone Primary Color", "--primary"
  , "secondary_color", "#CFC493", "multiple", "Duotone Secondary Color", "--secondary"
  , "white_color", "#FFFFFF", "multiple", "Brightest color used", "--white"
  , "black_color", "#000000", "multiple", "Darkest color used", "--black"
)
template_duo_accent <- dplyr::bind_rows(template_duo_accent, template_variables)
template_duo_accent <- set_default(
  template_duo_accent,
  text_color                      = "{black_color}",
  header_color                    = "{primary_color}",
  background_color                = "{white_color}",
  link_color                      = "{choose_dark_or_light(secondary_color, primary_color, secondary_color)}",
  text_bold_color                 = "{choose_dark_or_light(secondary_color, primary_color, secondary_color)}",
  text_slide_number_color         = "{primary_color}",
  code_inline_color               = "{choose_dark_or_light(secondary_color, primary_color, secondary_color)}",
  inverse_background_color        = "{secondary_color}",
  inverse_text_color              = "{choose_dark_or_light(secondary_color, black_color, white_color)}",
  inverse_header_color            = "{choose_dark_or_light(secondary_color, black_color, white_color)}",
  title_slide_background_color    = "{primary_color}",
  title_slide_text_color          = "{choose_dark_or_light(primary_color, black_color, white_color)}",
  left_column_subtle_color        = "{apply_alpha(primary_color, 0.6)}",
  left_column_selected_color      = "{primary_color}",
  blockquote_left_border_color    = "{apply_alpha(secondary_color, 0.5)}",
  table_row_even_background_color = "{lighten_color(secondary_color, 0.8)}")

template_duo_accent_inverse <- set_default(
  template_duo_accent,
  text_color                      = "{white_color}",
  header_color                    = "{primary_color}",
  background_color                = "{black_color}",
  link_color                      = "{choose_dark_or_light(secondary_color, secondary_color, primary_color)}",
  text_bold_color                 = "{choose_dark_or_light(secondary_color, secondary_color, primary_color)}",
  text_slide_number_color         = "{primary_color}",
  code_inline_color               = "{choose_dark_or_light(secondary_color, secondary_color, primary_color)}",
  inverse_background_color        = "{secondary_color}",
  inverse_text_color              = "{choose_dark_or_light(secondary_color, black_color, white_color)}",
  inverse_header_color            = "{choose_dark_or_light(secondary_color, black_color, white_color)}",
  title_slide_background_color    = "{primary_color}",
  title_slide_text_color          = "{choose_dark_or_light(primary_color, black_color, white_color)}",
  left_column_subtle_color        = "{apply_alpha(primary_color, 0.6)}",
  left_column_selected_color      = "{primary_color}",
  blockquote_left_border_color    = "{apply_alpha(secondary_color, 0.5)}",
  table_row_even_background_color = "{darken_color(choose_dark_or_light(primary_color, secondary_color, primary_color), 0.2)}")

solarized <- list(
  "base03"  = "#002b36",
  "base02"  = "#073642",
  "base01"  = "#586e75",
  "base00"  = "#657b83",
  "base0"   = "#839496",
  "base1"   = "#93a1a1",
  "base2"   = "#eee8d5",
  "base3"   = "#fdf6e3",
  "yellow"  = "#b58900",
  "orange"  = "#cb4b16",
  "red"     = "#dc322f",
  "magenta" = "#d33682",
  "violet"  = "#6c71c4",
  "blue"    = "#268bd2",
  "cyan"    = "#2aa198",
  "green"   = "#859900")


template_solarized_light <- set_default(
  template_variables,
  text_color                      = solarized$base00,
  header_color                    = solarized$red,
  background_color                = solarized$base3,
  link_color                      = solarized$yellow,
  text_bold_color                 = solarized$magenta,
  text_slide_number_color         = solarized$base1,
  code_highlight_color            = "#268bd240", #xaringanthemer:::apply_alpha(solarized$blue, 0.25)
  code_inline_color               = solarized$violet,
  inverse_background_color        = solarized$base03,
  inverse_text_color              = solarized$base3,
  inverse_header_color            = "{inverse_text_color}",
  title_slide_text_color          = "{inverse_text_color}",
  title_slide_background_color    = "{inverse_background_color}",
  left_column_subtle_color        = solarized$base1,
  left_column_selected_color      = solarized$base01,
  blockquote_left_border_color    = solarized$orange,
  table_border_color              = solarized$base0,
  table_row_border_color          = solarized$base0,
  table_row_even_background_color = solarized$base2
)

template_solarized_dark <- set_default(
  template_variables,
  text_color                      = solarized$base0,
  header_color                    = solarized$red,
  background_color                = solarized$base03,
  link_color                      = solarized$yellow,
  text_bold_color                 = solarized$magenta,
  text_slide_number_color         = solarized$base01,
  code_highlight_color            = "#268bd240", #xaringanthemer:::apply_alpha(solarized$blue, 0.25)
  code_inline_color               = solarized$violet,
  inverse_background_color        = solarized$base3,
  inverse_text_color              = solarized$base03,
  inverse_header_color            = "{inverse_text_color}",
  title_slide_text_color          = "{inverse_text_color}",
  title_slide_background_color    = "{inverse_background_color}",
  left_column_subtle_color        = solarized$base01,
  left_column_selected_color      = solarized$base1,
  blockquote_left_border_color    = solarized$orange,
  table_border_color              = solarized$base00,
  table_row_border_color          = solarized$base00,
  table_row_even_background_color = solarized$base02
)

usethis::use_data(
  template_variables,
  template_mono_accent,
  template_mono_accent_inverse,
  template_mono_light,
  template_mono_dark,
  template_duo,
  template_duo_light,
  template_duo_accent,
  template_duo_accent_inverse,
  template_solarized_light,
  template_solarized_dark,
  internal = TRUE,
  overwrite = TRUE
)
