# xaringanthemer 0.3.0

* Added `background_header_auto` parameter that adds a background under the
  first `h1` element (i.e. `# Slide Title`) on a slide. When enabled, the
  background is added automatically to slides, as long as they aren't
  `inverse`, `center`, `middle`, or `bottom`-styled slides. When disabled,
  you can still enable slide title headers by adding the `header_background`
  class to a slide. (thanks, @Btibert3, #10)
  
* The underlying template now uses the `whisker` package.
