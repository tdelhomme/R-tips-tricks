# R-tips-tricks

### This repository contains piece of R code. The code:

  * can be used by any type of data (in theory...)
  * was already tested
  * minimises the number of packages required
  * is open to suggestions and changes  

  # Table of Contents

  ## Pretty plots with R basic librairies

  1. [Scaled stacked barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/scaled_stacked_barplot_VCF.r): barplot with respect to two factors, scaled to sum to 1 for x factor. Need to read a table, and define 2 variables for classes (in x) and subclasses (in y).

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
  
  ## TCGA data
  
  1. [TCGA IDs to barcodes](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/TCGA_IDs_to_barcodes.R): this script takes in input a txt file and change all TCGA IDs (e.g. 5c1d7b4c-7c3b-4d20-bb38-c4451313dc18) to its corresponding barcode (e.g. TCGA-18-3409) IN THE HEADER. This can help handling TCGA files containing IDs likes focal-level CNV files. To check options: 
  ```
  Rscript TCGA_IDs_to_barcodes.R --help
  ```

## biomaRt package 
 1. Get location from SNP RS identifier:
 ```
 library(biomaRt)

snp_mart = useMart("ENSEMBL_MART_SNP", dataset="hsapiens_snp")

snp_ids = c("rs16828074", "rs17232800")
snp_attributes = c("refsnp_id", "chr_name", "chrom_start")

snp_locations = getBM(attributes=snp_attributes, filters="snp_filter", 
                      values=snp_ids, mart=snp_mart)

 ```

**Note:** Last piece of code is now working only in R v4. Easier way to to that using `gprofiler2` package: 
```
gprofiler2::gsnpense(query = x) # with x the vector of rsIDs
```

## Random tips

