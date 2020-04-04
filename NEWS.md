# xaringanthemer 0.3.0 (dev)

* Adds `theme_xaringan()`, a ggplot2 theme that automatically uses the colors
  and font styles of your xaringanthemer style. Also adds 
  `scale_xaringan_color()` and `scale_xaringan_fill()` functions that use the
  primary colors for the color or fill aesthetics. These theme functions
  currently do not work when knitr caching is enabled and require that the
  xaringanthemer style functions are called within your xaringan slides Rmd file.

* Renamed all xaringanthemer functions that create CSS styles to use the
  prefix "`style_`". For example, `mono_light()` is now `style_mono_light()`.
  Additionally, `write_xaringan_theme()` is now `style_xaringan()` and
  `write_extra_css()` is `style_extra_css()`. Overall, this change makes the
  xarignanthemer API much cleaner and easier to navigate. Previous function
  names are deprecated but still work.

* Added `background_header_auto` parameter that adds a background under the
  first `h1` element (i.e. `# Slide Title`) on a slide. When enabled, the
  background is added automatically to slides, as long as they aren't
  `inverse`, `center`, `middle`, or `bottom`-styled slides. When disabled,
  you can still enable slide title headers by adding the `header_background`
  class to a slide. (thanks, @Btibert3, #10)
  
* The underlying template now uses the `whisker` package.

* xaringanthemer now uses a different set of default fonts for heading and body
  fonts. The new defaults use [Cabin](https://fonts.google.com/specimen/Cabin)
  for headings and [Noto Sans](https://fonts.google.com/specimen/Noto+Sans) for
  body text. These fonts are easier to read on screens and at a distance during
  presentations, and they support a wide variety of languages and weights. 
  Another reason for the change is that the xaringan (remarkjs) default body 
  font, _Droid Serif_, is no longer officially included in Google Fonts.


## Bugfixes and Improvements

* Better handling of multiple `extra_fonts`, including improved error messages.
  (Thanks @pat-s, #19).
  
* `style_extra_css()` (previously `write_extra_css()`) gained an `append`
  argument so that it can append to or overwrite an existing file (thanks @pat-s, #17).

* The underlying tibble holding the theme template variables was updated to 
  work with `tibble 3.0.0` (thanks @techisdead, @SymbolixAU, #32).
