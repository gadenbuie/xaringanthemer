#' @importFrom grDevices col2rgb rgb rgb2hsv hsv
#' @keywords internal
"_PACKAGE"

xaringanthemer_env <- new.env(parent = emptyenv())

# I looked up these ggplot geom aesthetic defaults manually via e.g.
# ggplot2::geom_line()$geom$default_aes
xaringanthemer_env$std_ggplot_defaults <- list(
  "line"       = list(colour  = "black"),
  "vline"      = list(colour  = "black"),
  "hline"      = list(colour  = "black"),
  "abline"     = list(colour  = "black"),
  "segment"    = list(colour  = "black"),
  "bar"        = list(fill   = "grey35"),
  "col"        = list(fill   = "grey35"),
  "boxplot"    = list(colour  = "grey20", fill = "white"),
  "contour"    = list(colour  = "#3366FF"),
  "density"    = list(colour  = "black",
    fill   = NA,
    alpha  = NA),
  "dotplot"    = list(colour  = "black"),
  "errorbarh"  = list(colour  = "black"),
  "crossbar"   = list(colour  = "black"),
  "errorbar"   = list(colour  = "black"),
  "linerange"  = list(colour  = "black"),
  "pointrange" = list(colour  = "black"),
  "map"        = list(colour  = "black"),
  "path"       = list(colour  = "black"),
  "line"       = list(colour  = "black"),
  "step"       = list(colour  = "black"),
  "point"      = list(colour  = "black"),
  "polygon"    = list(colour  = NA,
    fill   = "grey20"),
  "quantile"   = list(colour  = "#3366FF"),
  "rug"        = list(colour  = "black"),
  "segment"    = list(colour  = "black"),
  "smooth"     = list(fill   = "grey60",
    colour  = "#3366FF"),
  "spoke"      = list(colour  = "black"),
  "label"      = list(colour  = "black",
    family = ""),
  "text"       = list(colour  = "black",
    family = ""),
  "rect"       = list(fill   = "grey35"),
  "tile"       = list(fill   = "grey20"),
  "violin"     = list(fill   = "white", colour = "grey20")
)
