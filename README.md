# R-tips-tricks



### This repository contains piece of R code. The code:

  * can be used by any type of data
  * was already tested
  * minimises the number of packages required
  * is open to suggestions and changes  


  # Table of Contents

  ## Pretty plots with ggplot 2

  1. [Stacked barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/stacked_barplot.r): barplot with respect to two factors  

![stacked_barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/examples/stacked_barplot.png)

  2. [multiple plot](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/multiplot.r) : function to plot multiple panels with ggplot2

  ## Performance testing

  1. [compilation of function](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/compare_compilation.r): use `compiler` package to compile an R function and use `microbenchmark` package to repeat both compiled and not compiles functions `n` times to compute time statistics. Plotting of results is done with `ggplot2`.
