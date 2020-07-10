args <- commandArgs(TRUE)
parseArgs <- function(x) {
  res = strsplit(sub("^--", "", x), "=")
  if(length(unlist(res))==1) res[[1]][2]=""
  return(res)
}

argsL <- as.list(do.call("cbind", parseArgs(args))[c(F,T)])
names(argsL) <- as.list(do.call("cbind", parseArgs(args))[c(T,F)])
args <- argsL;rm(argsL)

if(! is.null(args$help)) {
  cat("
      Mandatory arguments:
      --input_file 
      --ncol_to_skip

      Optional arguments:
      --output_file        
      --id_type (file_id, case_id or aliquot_id (default))

      --help \n\n")
  q(save="no")
}

if(is.null(args$input_file)) {stop("Option --input_file should be provided")} else{
  input_file = as.character(args$input_file)}
if(is.null(args$ncol_to_skip)) {stop("Option --ncol_to_skip should be provided")} else{
  ncol_to_skip = as.numeric(args$ncol_to_skip)}
if(is.null(args$output_file)) {output_file=gsub(".txt", "_barcodes.txt", basename(input_file))} else{
  output_file=args$output_file}
if(is.null(args$id_type)) {id_type="aliquot_id"} else{id_type=args$id_type}

library(TCGAutils)
input_file_rl = readLines(input_file, -1)
old_header = read.table(input_file, h=F, stringsAsFactors = F, sep = "\t", nrows = 1)
kept_cols = old_header[,1:ncol_to_skip]

tcga_barcodes = unlist(lapply(old_header[,(ncol_to_skip+1):ncol(old_header)], function(uuid){
  res = UUIDtoBarcode(uuid, from_type = id_type)
  substr(res[grepl("submitter_id", colnames(res))], 1, 12)
}))

new_header = c(kept_cols, tcga_barcodes)
new_header = paste(unlist(new_header), collapse="\t")
input_file_rl[1] = new_header

writeLines(input_file_rl, output_file)
