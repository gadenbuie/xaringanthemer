
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xaringanthemer

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/xaringanthemer)](https://CRAN.R-project.org/package=xaringanthemer)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![travis](https://travis-ci.com/gadenbuie/xaringanthemer.svg?branch=master)](https://travis-ci.com/gadenbuie/xaringanthemer)
[![Codecov](https://img.shields.io/codecov/c/github/gadenbuie/xaringanthemer)](https://codecov.io/github/gadenbuie/xaringanthemer)
<!-- badges: end -->

Give your [xaringan](https://github.com/yihui/xaringan) slides some
style with **xaringanthemer** within your `slides.Rmd` file without
(much) CSS.

<img src="https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/examples.gif" alt="Animation previewing many xaringanthemer themes" />

  - [Installation](#installation)
  - [Quick Intro](#quick-intro)
  - [Themes](#themes)
      - [Monotone](#monotone)
      - [Duotone](#duotone)
      - [Solarized](#solarized)
  - [Theme Settings](#theme-settings)
  - [Adding Custom CSS](#adding-custom-css)
  - [Fonts](#fonts)

## Installation

You can install **xaringanthemer** from CRAN

``` r
install.packages("xaringanthemer")
```

or you can install the development version of xaringanthemer from
[GitHub](https://github.com/gadenbuie/xaringanthemer).

``` r
# install.packages("devtools")
devtools::install_github("gadenbuie/xaringanthemer")
```

## Quick Intro

<!-- Set link to theme-settings, template-variables, theme functions -->

First, add the `xaringan-themer.css` file to the YAML header of your
xaringan slides.

``` yaml
output:
  xaringan::moon_reader:
    lib_dir: libs
    css: xaringan-themer.css
```

Then, in a hidden chunk just after the knitr setup chunk, load
**xaringanthemer** and try one of the [theme functions](#themes).

```` markdown
```{r xaringan-themer, include = FALSE}
library(xaringanthemer)
style_mono_light(
  base_color = "#1c5253",
  header_font_google = google_font("Josefin Sans"),
  text_font_google   = google_font("Montserrat", "300", "300i"),
  code_font_google   = google_font("Droid Mono")
)
```
````

<img src="https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_mono_light_1c5253.png" alt="Example title and normal slides using a green xaringanthemer theme" />

### Tab Completion

**xaringanthemer** is <kbd>Tab</kbd> friendly – [use autocomplete to
explore](#theme-settings) the [template
variables](vignettes/template-variables.md) that you can adjust in each
of the themes\!

<img src="https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example-rstudio-completion.gif" alt="Demonstration of argument auto-completion with RStudio" />

### R Markdown Template in RStudio

You can also skip the above and just create a *Ninja Themed
Presentation* from the New R Markdown Document menu in RStudio.

<center>

<img src="https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/rmarkdown-template-screenshot.png" alt="The 'New R Markdown Document' menu in RStudio" />

</center>

## Themes

### Monotone

Use these functions to automatically create a consistent color palette
for your slides, based around a single color.

#### `style_mono_light()`

A light theme based around a single color.

``` r
style_mono_light(base_color = "#23395b")
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_mono_light.png)

#### `style_mono_dark()`

A dark theme based around a single color.

``` r
style_mono_dark(base_color = "#cbf7ed")
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_mono_dark.png)

#### `style_mono_accent()`

The default xaringan theme with a single color used for color accents on
select elements (headers, bold text, etc.).

``` r
style_mono_accent(base_color = "#43418A")
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_mono_accent.png)

#### `style_mono_accent_inverse()`

An “inverted” default xaringan theme with a single color used for color
accents on select elements (headers, bold text, etc.).

``` r
style_mono_accent_inverse(base_color = "#3C989E")
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_mono_accent_inverse.png)

### Duotone

These themes build from two (ideally) complementary colors.

#### `style_duo()`

A two-colored theme based on a primary and secondary color.

``` r
style_duo(primary_color = "#1F4257", secondary_color = "#F97B64")
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_duo.png)

#### `style_duo_accent()`

The default Xaringan theme with two accent colors.

``` r
style_duo_accent(primary_color = "#006747", secondary_color = "#CFC493")
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_duo_accent.png)

#### `style_duo_accent_inverse()`

An “inverted” default Xaringan theme with two accent colors.

``` r
style_duo_accent_inverse(primary_color = "#006747", secondary_color = "#CFC493")
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_duo_accent_inverse.png)

### Solarized

There are also two themes based around the [solarized color
palette](http://ethanschoonover.com/solarized),
`style_solarized_light()` and `style_solarized_dark()`. For both themes,
it is advisted to change the syntax highlighting theme to
`solarized-light` or `solarized-dark` (looks great paired or
constrasted).

#### `style_solarized_light()`

``` r
style_solarized_light()
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_solarized_light.png)

#### `style_solarized_dark()`

``` r
style_solarized_dark()
```

![](https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_solarized_dark.png)

To do this, your YAML header should look more-or-less like this:

``` yaml
output:
  xaringan::moon_reader:
    lib_dir: libs
    css: ["xaringan-themer.css"]
    nature:
      highlightStyle: solarized-dark
      highlightLines: true
      countIncrementalSlides: false
```

## Theme Settings

The theme functions listed above are just wrappers around the central
function of this package, `style_xaringan()`. If you want to start from
the default **xaringan** theme and make a few modifications, start
there.

All of the [theme template variables](vignettes/template-variables.md)
are repeated in each of the theme functions (instead of relying on
`...`) so that you can use autocompletion to find and change the
defaults for any theme function. To override the default value of any
theme functions, set the appropriate argument in the theme function. A
table of all template variables is included in
[`vignette("template-variables",
"xaringanthemer")`](vignettes/template-variables.md).

As an example, try loading `xaringanthemer`, type out `duo_theme(` and
then press <kbd>Tab</kbd> to see all of the theme options.

All of the theme options are named so that you first think of the
element you want to change, then the property of that element.

Here are some of the `text_` theme options:

  - `text_color`
  - `text_bold_color`
  - `text_slide_number_color`
  - `text_font_size`
  - `text_slide_number_font_size`
  - *and more …*

And here are the title slide theme options:

  - `title_slide_text_color`
  - `title_slide_background_color`
  - `title_slide_background_image`
  - `title_slide_background_size`
  - `title_slide_background_position`

## Adding Custom CSS

You can also add custom CSS classes using the `extra_css` argument in
the theme functions. This argument takes a named list of CSS definitions
each containing a named list of CSS property-value pairs.

``` r
extra_css <- list(
  ".red"   = list(color = "red"),
  ".small" = list("font-size" = "90%"),
  ".full-width" = list(
    display = "flex",
    width   = "100%",
    flex    = "1 1 auto"
  )
)
```

If you would rather keep your additional css definitions in a separate
file, you can call `style_extra_css()` separately. Just be sure to
include your new CSS file in the list of applied files in your YAML
header.

``` r
style_extra_css(css = extra_css, outfile = "custom.css")
```

``` css
/* Extra CSS */
.red {
  color: red;
}
.small {
  font-size: 90%;
}
.full-width {
  display: flex;
  width: 100%;
  flex: 1 1 auto;
}
```

This is most helpful when wanting to define helper classes to work with
the [remark.js](https://github.com/gnab/remark) `.class[]` syntax. Using
the above example, we could color text red `.red[like this]` or write
`.small[in smaller font size]`.

## Fonts

<!-- Need to set [adding-custom-css] -->

Yihui picked out great fonts for the [default xaringan
theme](https://slides.yihui.name/xaringan/), but sometimes you want
something new and interesting.

**xaringanthemer** makes it easy to use [Google
Fonts](https://fonts.google.com) in your presentations (well, as long as
you have an internet connection) or to fully specify your font files.

To use [Google Fonts](https://fonts.google.com), set the `_font_google`
theme arguments – `text_font_google`, `header_font_google`,
`code_font_google` — using the `google_font()` helper. See
`?google_font` for more info.

``` r
style_mono_light(
  header_font_google = google_font("Josefin Slab", "600"),
  text_font_google   = google_font("Work Sans", "300", "300i"),
  code_font_google   = google_font("IBM Plex Mono")
)
```

If you set an `xxx_font_google` theme arguments, then `xxx_font_family`,
`xxx_font_weight` and `xxx_font_url` are overwritten – where `xxx` in
`{header, text, code}`. Of course, you can manually set
`header_font_url`, etc., and ignore the `header_font_google` argument.

For example, suppose you want to use a ligature font for the code font,
such as [Fira Code](https://github.com/yihui/xaringan/issues/83). Just
set `code_font_family` and `code_font_url`\!

``` r
style_solarized_dark(
  code_font_family = "Fira Code",
  code_font_url = "https://cdn.rawgit.com/tonsky/FiraCode/1.204/distr/fira_code.css"
)
```

If you need to import additional fonts for use in [custom CSS
definitions](#adding-custom-css), you can use the `extra_fonts` argument
to pass a list of URLs or `google_font()`s.

``` r
style_mono_light(
  extra_fonts = list(google_font("Sofia")),
  extra_css = list(".title-slide h2" = list("font-family" = "Sofia"))
)
```

-----

**xaringanthemer** was built by [Garrick
Aden-Buie](https://www.garrickadenbuie.com)
([@grrrck](https://twitter.com/grrrck)).

Big thank you to [Yihui Xie](https://yihui.name), especially for
[xaringan](https://github.com/yihui/xaringan). Also thanks to [Ole
Petter Bang](http://gnab.org) for
[remark.js](https://github.com/gnab/remark).

Feel free to [file an
issue](https://github.com/gadenbuie/xaringanthemer/issues) if you find a
bug or have a theme suggestion – or better yet, submit a pull request\!
