
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
  - [Colors](#colors)
  - [Fonts](#fonts)
  - [Adding Custom CSS](#adding-custom-css)

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

**xaringanthemer** includes a number of functions that provide themed
**xaringan** styles. All of the styling functions start with the
`style_` prefix.

The goal of each style function is to quickly set up a coordinated color
palette for your slides based on one or two starter colors. Styles based
on one color start with `style_mono_` and styles based on two colors
start with `style_duo_`. How the starter colors are used is described in
the final portion of the style function name. For example,
`style_mono_accent()` uses a single color as an accent color.

Note that the colors used below are for demonstration only, the point of
the `style_` functions is for you to choose your own color palette\!

If you color palette uses more than two colors, you can add additional
colors with the `colors` argument. See the [Colors](#colors) section for
more information.

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

The theme functions listed above are wrappers around the central
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

As an example, try typing out `style_duo_accent(` and then press
<kbd>Tab</kbd> to see all of the theme options.

The arguments of each theme function are named so that you can first
think of the element you want to change, then the property of that
element.

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

## Fonts

<!-- Need to set [adding-custom-css] -->

### Default Fonts

**xaringanthemer** by default uses a different set of default fonts for
heading and body fonts. The new defaults use
[Cabin](https://fonts.google.com/specimen/Cabin) for headings and [Noto
Sans](https://fonts.google.com/specimen/Noto+Sans) for body text. These
fonts are easier to read on screens and at a distance during
presentations, and they support a wide variety of languages and weights.
Another reason for the change is that the xaringan (remarkjs) default
body font, *Droid Serif*, is no longer officially included in Google
Fonts.

If you would like to use the fonts from the [default xaringan
theme](https://slides.yihui.name/xaringan/), you can use the following
arguments in your style function.

``` r
style_xaringan(
  text_font_family = "Droid Serif",
  text_font_url = "https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic",
  header_font_google = google_font("Yanone Kaffeesatz")
)
```

### Custom and *Google Font* Fonts

**xaringanthemer** makes it easy to use [Google
Fonts](https://fonts.google.com) in your presentations (provided you
have an internet connection during the presentation) or to fully specify
your font files.

To use [Google Fonts](https://fonts.google.com), set the
`<type>_font_google` theme arguments – `text_font_google`,
`header_font_google`, `code_font_google` — using the `google_font()`
helper. The help documentation in `?google_font` provides more info.

``` r
style_mono_light(
  header_font_google = google_font("Josefin Slab", "600"),
  text_font_google   = google_font("Work Sans", "300", "300i"),
  code_font_google   = google_font("IBM Plex Mono")
)
```

If you set an `<type>_font_google` theme arguments, then
`<type>_font_family`, `<type>_font_weight` and `<type>_font_url` are
overwritten – where `<type>` is one of `header`, `text`, or `code`.

To use a font hosted outside of Google fonts, you need to provide both
`<type>_font_family` and `<type>_font_url`. For example, suppose you
want to use a code font with ligatures for your code chunks, such as
[Fira Code](https://github.com/tonsky/FiraCode), which would be declared
with `code_font_family`. The [browser
usage](https://github.com/tonsky/FiraCode#browser-support) section of
the Fira Code README provides a CSS URL to be used with an `@import`
statement that you can use with the `code_font_url` argument.

``` r
style_solarized_dark(
  code_font_family = "Fira Code",
  code_font_url = "https://cdn.jsdelivr.net/gh/tonsky/FiraCode@2/distr/fira_code.css"
)
```

Remember that you need to supply either `<type>_google_font` using the
`google_font()` helper *or both* `<type>_font_family` and
`<type>_font_url`.

### Using Additional Fonts

If you want to use additional fonts for use in [custom CSS
definitions](#adding-custom-css), use the `extra_fonts` argument to pass
a list of URLs or `google_font()`s. Notice that you will need to add
custom CSS (for example, via `extra_css`) to use the fonts imported in
`extra_fonts`.

``` r
style_mono_light(
  extra_fonts = list(
    google_font("Sofia"),
    # Young Serif by uplaod.fr
    "https://cdn.jsdelivr.net/gh/uplaod/YoungSerif/fonts/webfonts/fontface.css",
  ),
  extra_css = list(
    ".title-slide h2" = list("font-family" = "Sofia"),
    blockquote = list("font-family" = "youngserifregular")
  )
)
```

## Colors

When designing your xaringan theme, you may have additional colors in
your desired color palette beyond those used in the accent colors of the
mono and duotone styles.

The `style*()` functions in xaringanthemer include a `colors` argument
that lets you quickly define a additional colors to use in your slides.
This argument takes a vector of named colors

``` r
colors = c(
  red = "#f34213",
  purple = "#3e2f5b",
  orange = "#ff8811",
  green = "#136f63",
  white = "#FFFFFF",
)
```

and creates CSS classes from the color name that set the text color —
e.g. `.red` — or that set the background color — e.g. `.bg-red`. If you
use custom CSS in your slides, the color name is also stored in a CSS
variable — e.g. `var(--red)`.

So slide text like this

``` markdown
This **.red[simple]** .white.bg-purple[demo] 
_.orange[shows]_ the colors .green[in action].
```

will be rendered in HTML as

<blockquote>

This <strong><span style="color: #f34213">simple</span></strong>
<span style="color:#FFFFFF;background-color:#3e2f5b;">demo</span>
<em style="color:#ff8811">shows</em> the colors
<span style="color:#136f63">in action</span>.

</blockquote>

Note that the color names in `colors` need to be valid CSS names, so
`"purple-light"` will work, but `"purple light"` will not.

## Adding Custom CSS

You can also add custom CSS classes using the `extra_css` argument in
the theme functions. This argument takes a named list of CSS definitions
each containing a named list of CSS property-value pairs.

``` r
extra_css <- list(
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
the above example, we could add slide text `.small[in smaller font
size]`.

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
