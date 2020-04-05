#' @importFrom grDevices col2rgb rgb rgb2hsv hsv
#' @keywords internal
"_PACKAGE"

xaringanthemer_env <- new.env(parent = emptyenv())

# I looked up these ggplot geom aesthetic defaults manually via e.g.
# ggplot2::geom_line()$geom$default_aes
xaringanthemer_env$std_ggplot_defaults <- list(
  "line"       = list(color  = "black"),
  "vline"      = list(color  = "black"),
  "hline"      = list(color  = "black"),
  "abline"     = list(color  = "black"),
  "segment"    = list(color  = "black"),
  "bar"        = list(fill   = "grey35"),
  "col"        = list(fill   = "grey35"),
  "boxplot"    = list(color  = "grey20", fill = "white"),
  "contour"    = list(color  = "#3366FF"),
  "density"    = list(color  = "black",
                      fill   = NA,
                      alpha  = NA),
  "dotplot"    = list(color  = "black"),
  "errorbarh"  = list(color  = "black"),
  "crossbar"   = list(color  = "black"),
  "errorbar"   = list(color  = "black"),
  "linerange"  = list(color  = "black"),
  "pointrange" = list(color  = "black"),
  "map"        = list(color  = "black"),
  "path"       = list(color  = "black"),
  "line"       = list(color  = "black"),
  "step"       = list(color  = "black"),
  "point"      = list(color  = "black"),
  "polygon"    = list(color  = NA,
                      fill   = "grey20"),
  "quantile"   = list(color  = "#3366FF"),
  "rug"        = list(color  = "black"),
  "segment"    = list(color  = "black"),
  "smooth"     = list(fill   = "grey60",
                      color  = "#3366FF"),
  "spoke"      = list(color  = "black"),
  "label"      = list(color  = "black",
                      family = ""),
  "text"       = list(color  = "black",
                      family = ""),
  "rect"       = list(fill   = "grey35"),
  "tile"       = list(fill   = "grey20"),
  "violin"     = list(fill   = "white", color = "grey20")
)
