<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# xaringanthemer 0.4.1

* Text alignment in code blocks in `left`, `center`, or `right` aligned slides 
  no longer matches the slide text. Instead, the code block width is reduced,
  if possible, and the block is pushed to the left, center, or right using
  margins (#68).
  
* The style functions are now more permissive about color names in the `color`
  argument. Color names should be valid CSS classes that can also be used as CSS
  variable names, but the `style_` function only stops with an error if the
  color name contains spaces. (@jdlom #69)
  
* Fixed an issue that caused problems rendering the xaringanthemer R Markdown
  template if the showtext package isn't installed (thanks @beatrizmilz, #65).

# xaringanthemer 0.4.0

* Added `text_bold_font_weight` argument to xaringanthemer style functions with
  a corresponding CSS rule setting the `font-weight` property of `<strong>`
  elements (thanks @matiasandina, #50).
 
* The style functions gain a `link_decoration` argument to set the
  [`text-decoration`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration)
  property for links (#57).
  
* Set slide number font size in `rem` so that increasing the font size at the
  slide level doesn't result in giant slide numbers (#53).

* The xaringanthemer slide skeleton (R Markdown template) will now render when
  packages that are used in the template but not in xaringanthemer's Imports are
  not installed (#52).
  
* xaringanthemer no longer sets the `fig.showtext` chunk option when the
  showtext package isn't installed and also when `fig.showtext = FALSE` 
  (thanks @mikedecr #36, #56).

# xaringanthemes 0.3.4

* Maintenance release to avoid issues with upcoming R 4.1.0 (#49)

# xaringanthemer 0.3.3

* Add `inverse_link_color` to control color of links on inverse slides
  (thanks @dmi3kno, #44)

* .pull-right[] now clears floats just for its immediate sibling

* Add `header_font_family_fallback` to control fallback fonts for headings
  (thanks @mattwarkentin, #41)
  
* New xaringanthemer presentation skeleton with a kitchen sink of typical
  slide elements with the goal of making it easier to preview new themes
  during development.

# xaringanthemer 0.3.0

* Adds `theme_xaringan()`, a ggplot2 theme that automatically uses the colors
  and font styles of your xaringanthemer style. Also adds 
  `scale_xaringan_discrete()` and `scale_xaringan_continuous()` functions that 
  use your slides' primary colors for the color or fill aesthetics. These theme
  functions can recover the primary colors used in a xaringanthemer (>= 0.3.0)
  CSS file even if you don't call the style function directly in your slides.

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

* xaringanthemer styles now use CSS variables throughout. Most of the settings 
  used in defining a style are stored in CSS variables. The variable names are
  documented in their corresponding arguments. For example, the color selected
  for `background_color` is stored in the variable `--background-color`. These
  variables can be used in custom CSS rules or in other arguments in any style
  functions, for example as `var(--background-color)`.

* xaringanthemer now uses a different set of default fonts for heading and body
  fonts. The new defaults use [Cabin](https://fonts.google.com/specimen/Cabin)
  for headings and [Noto Sans](https://fonts.google.com/specimen/Noto+Sans) for
  body text. These fonts are easier to read on screens and at a distance during
  presentations, and they support a wide variety of languages and weights. 
  Another reason for the change is that the xaringan (remarkjs) default body 
  font, _Droid Serif_, is no longer officially included in Google Fonts.
  
* Additional colors can be provided in the `colors` argument, which takes a
  named vector of colors. The names become both CSS classes and CSS variables
  that can be used throughout your slide styles. For example,
  `colors = c(red = "#d34213")` creates a `.red` CSS class for red foreground 
  text, a `.bg-red` CSS class for a red background, and a `--red` CSS variable
  that can be referenced as `var(--red)` in any `_color` argument of your style
  function.


## Bugfixes and Improvements

* Better handling of multiple `extra_fonts`, including improved error messages.
  (Thanks @pat-s, #19).
  
* `style_extra_css()` (previously `write_extra_css()`) gained an `append`
  argument so that it can append to or overwrite an existing file (thanks @pat-s, #17).

* The underlying tibble holding the theme template variables was updated to 
  work with `tibble 3.0.0` (thanks @techisdead, @SymbolixAU, #32).
  
* The `css-help` vignette was removed and may be re-written in the future.

* Style function arguments that accept CSS property values are now documented in
  the argument documentation, including a link to the MDN web docs page for the
  CSS property or value (#33, thanks @TrashBirdEcology #18).

* Style functions return the CSS text directly when `outfile = NULL`.
