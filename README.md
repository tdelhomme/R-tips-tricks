# R-tips-tricks

### This repository contains piece of R code. The code:

  * can be used by any type of data (in theory...)
  * was already tested
  * minimises the number of packages required
  * is open to suggestions and changes  

  # Table of Contents
  
  ## TIPS -- don't fall in trouble!
  1. order a vector using another one which is a factor
  ```
  # this works
  vect1[as.character(vect2)]
  
  # this does not work
  vect1[vect2]

  ```

  ## Pretty plots with R basic librairies

  1. [Scaled stacked barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/scaled_stacked_barplot_VCF.r): barplot with respect to two factors, scaled to sum to 1 for x factor. Need to read a table, and define 2 variables for classes (in x) and subclasses (in y).

![sclaled stacked_barplot](https://github.com/tdelhomme/R-tips-tricks/blob/master/examples/scaled_stacked_barplot.png)

  ## Pretty plots with ggplot2/ggpubr package

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

  ## Performance 

  1. [Testing performance -- compilation of function](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/compare_compilation.r): use `compiler` package to compile an R function and use `microbenchmark` package to repeat both compiled and not compiles functions `n` times to compute time statistics. Plotting of results is done with `ggplot2`.
  2. [Efficient grep in a file using parallel](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/grep_parallel):
  
  ## TCGA data
  
  1. [TCGA IDs to barcodes](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/TCGA_IDs_to_barcodes.R): this script takes in input a txt file and change all TCGA IDs (e.g. 5c1d7b4c-7c3b-4d20-bb38-c4451313dc18) to its corresponding barcode (e.g. TCGA-18-3409) IN THE HEADER. This can help handling TCGA files containing IDs likes focal-level CNV files. To check options: 
  ```
  Rscript TCGA_IDs_to_barcodes.R --help
  ```
  2. [GDC file ID to the case (submitter ID)](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/GDCfileID_to_case.R): this R function will return the submitter ID given a particular GDC file ID. Modified from [this chunk](https://seandavi.github.io/post/2017-12-29-genomicdatacommons-id-mapping/). The select operator can be switched to one of those in the _file_ fields, [here](https://docs.gdc.cancer.gov/API/Users_Guide/Appendix_A_Available_Fields/#file-fields). 
  
  Note: for CPTAC, metadata can then be found searching in the [CPTAC catalog](https://github.com/ding-lab/CPTAC3.catalog/blob/master/CPTAC3.Catalog.dat)
 
  

## Working with germline SNPs 
 1. Get location from SNP RS identifier using biomarRt package:
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

 2. Get SNPs in linkage desequilibrum using 1000genomes and a list of input SNPs
 
 Script is [here](https://github.com/tdelhomme/R-tips-tricks/blob/master/Rcode/get_SNPs_in_LD.R)


## Random tips

* Convert empty elements in a list into NAs: `is.na(mylist) <- lengths(mylist) == 0`
* Output text in console in color: `library(crayon) ; cat(blue("Hello", "world!\n"))`
