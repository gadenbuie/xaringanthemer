
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xaringanthemer <img src="man/figures/logo.png" align="right" height="175px" />

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/xaringanthemer)](https://CRAN.R-project.org/package=xaringanthemer)
[![xaringanthemer status
badge](https://gadenbuie.r-universe.dev/badges/xaringanthemer)](https://gadenbuie.r-universe.dev)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![R-CMD-Check status
badge](https://github.com/gadenbuie/xaringanthemer/workflows/R-CMD-check/badge.svg?branch=main)](https://github.com/gadenbuie/xaringanthemer/actions)
[![Codecov](https://img.shields.io/codecov/c/github/gadenbuie/xaringanthemer)](https://codecov.io/github/gadenbuie/xaringanthemer)
<!-- badges: end -->

Give your [xaringan](https://github.com/yihui/xaringan) slides some
style with **xaringanthemer** within your `slides.Rmd` file without
(much) CSS.

<img src="https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/examples.gif" alt="Animation previewing many xaringanthemer themes" />

## Installation

You can install **xaringanthemer** from CRAN

``` r
install.packages("xaringanthemer")
```

or you can install the development version of xaringanthemer from
[GitHub](https://github.com/gadenbuie/xaringanthemer).

``` r
# install.packages("remotes")
remotes::install_github("gadenbuie/xaringanthemer")
```

## Quick Intro

<!-- Set link to theme-settings, template-variables, theme functions -->

First, add the `xaringan-themer.css` file to the YAML header of your
xaringan slides.

``` yaml
output:
  xaringan::moon_reader:
    css: xaringan-themer.css
```

Then, in a hidden chunk just after the knitr setup chunk, load
**xaringanthemer** and try one of the [theme functions](#themes).

```` markdown
```{r xaringan-themer, include=FALSE, warning=FALSE}
library(xaringanthemer)
style_mono_accent(
  base_color = "#1c5253",
  header_font_google = google_font("Josefin Sans"),
  text_font_google   = google_font("Montserrat", "300", "300i"),
  code_font_google   = google_font("Fira Mono")
)
```
````

<img src="https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example_mono_accent_1c5253.png" alt="Example title and normal slides using a green xaringanthemer theme" data-external="1" />

### Matching ggplot Themes

**xaringanthemer** even provides a
[ggplot2](https://ggplot2.tidyverse.org) theme with `theme_xaringan()`
that uses the colors and fonts from your slide theme. Built on the
[showtext](https://github.com/yixuan/showtext) package, and designed to
work seamlessly with [Google Fonts](https://fonts.google.com).

Color and fill scales are also provided for matching sequential color
scales based on the primary color used in your slides. See
`?scale_xaringan` for more details.

More details and examples can be found in `vignette("ggplot2-themes")`.

``` r
library(ggplot2)
ggplot(diamonds) +
  aes(cut, fill = cut) +
  geom_bar(show.legend = FALSE) +
  labs(
    x = "Cut",
    y = "Count",
    title = "A Fancy diamonds Plot"
  ) +
  theme_xaringan(background_color = "#FFFFFF") +
  scale_xaringan_fill_discrete()
```

<img src="man/figures/index-theme_xaringan_demo-1.png" width="100%" />

### Tab Completion

**xaringanthemer** is <kbd>Tab</kbd> friendly – [use autocomplete to
explore](#theme-settings) the [template
variables](vignettes/template-variables.md) that you can adjust in each
of the themes!

<img src="https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/example-rstudio-completion.gif" alt="Demonstration of argument auto-completion with RStudio" data-external="1" />

### R Markdown Template in RStudio

You can also skip the above and just create a *Ninja Themed
Presentation* from the New R Markdown Document menu in RStudio.

<center>
<img src="https://raw.githubusercontent.com/gadenbuie/xaringanthemer/assets/rmarkdown-template-screenshot.png" alt="The 'New R Markdown Document' menu in RStudio" data-external="1" />
</center>

## Features

There’s a lot more that **xaringanthemer** can do! [Discover
xaringanthemer’s
features.](https://pkg.garrickadenbuie.com/xaringanthemer/articles/xaringanthemer.html)
