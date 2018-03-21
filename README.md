# R-tips-tricks

### This repository contains piece of R code. The code:

  * can be used by any type of data (in theory...)
  * was already tested
  * minimises the number of packages required
  * is open to suggestions and changes  

  # Table of Contents

  ## Pretty plots with R basic librairies

  1. [Scaled stacked barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/scaled_stacked_barplot.r): barplot with respect to two factors, scaled to sum to 1 for x factor. Need to read a table, and define 2 variables for classes (in x) and subclasses (in y).

![sclaled stacked_barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/examples/scaled_stacked_barplot.png)

  ## Pretty plots with ggplot 2

  1. [Stacked barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/stacked_barplot.r): barplot with respect to two factors  
  9aug2017: use the last dev version from github of the `ggpubr` package to avoid previous bug reported [here](https://github.com/kassambara/ggpubr/issues/20):
  ```
  library(devtools)
  install_github("kassambara/ggpubr")
  ```

![stacked_barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/examples/stacked_barplot.png)

  2. [multiple plot](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/multiplot.r): function to plot multiple panels with ggplot2

  ## Plot home-made functions

  1. [plot palette]((https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/plot_palette.r)): function to add to an existing plot a palette of continous colors describing a particular variable. 

  ## Performance testing

  1. [compilation of function](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/compare_compilation.r): use `compiler` package to compile an R function and use `microbenchmark` package to repeat both compiled and not compiles functions `n` times to compute time statistics. Plotting of results is done with `ggplot2`.
