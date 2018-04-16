
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xaringanthemer

Easily style your [xaringan](https://github.com/yihui/xaringan) slides
with **xaringanthemer**

## Installation

Currently, this is a work in progress. Try it yourself:

``` r
devtools::install_github("gadenbuie/xaringanthemer")
```

## Make it work

To make it work, add `css: xaringan-themed.css` to your xaringan slides
YAML header under `xaringan::moonreader:`

``` yaml
output:
  xaringan::moon_reader:
    lib_dir: libs
    css: xaringan-themed.css
```

Then, in the first knitr chunk, try this:

```` markdown
```{r setup}
options(htmltools.dir.version = FALSE)
library(xaringanthemer)
mono_light(
  base_color = "#1c5253",
  header_font_google = google_font("Josefin Sans"),
  text_font_google = google_font("Montserrat", "300", "300i"),
  code_font_google = google_font("Droid Mono")
)
```
````

![](docs/example_mono_light_1c5253.png)

## Monotone Themes

Use these functions to automatically create a consistent color palette
for your slides, based around a single color.

  - `mono_light()`: A light theme based around a single color

  - `mono_dark()`: A dark theme based around a single color

  - `mono_accent()`: The default xaringan theme with a single color used
    for color accents on select elements (headers, bold text, etc.)

  - `mono_accent_inverse()`: An “inverted” default xaringan theme with a
    single color used for color accents on select elements (headers,
    bold text, etc.)

## Duotone Themes

These themes build from two (ideally) complementary colors.

  - `duo()`: A two-colored theme based on a primary and secondary color.

  - `duo_accent()`: The default Xaringan theme with two accent colors.

  - `duo_accent_inverse()`: An “inverted” default Xaringan theme with
    two accent colors.

## Solarized

There are also two themes based around the [solarized color
palette](http://ethanschoonover.com/solarized), `solarized_light()` and
`solarized_dark()`. For both themes, it is advisted to change the syntax
highlighting theme to `solarized-light` or `solarized-dark` (looks great
paired or constrasted).

To do this, your YAML header should look more-or-less like this:

``` yaml
output:
  xaringan::moon_reader:
    lib_dir: libs
    css: ["xaringan-themed.css"]
    nature:
      highlightStyle: solarized-dark
      highlightLines: true
      countIncrementalSlides: false
```
