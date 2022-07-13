# 1. Get reference base from position and fasta file
# note: this could be easily ameliorated using parallel 

fasta_file <- FaFile(file='Homo_sapiens_assembly19.fasta')
gr1 <- GRanges(chrom,IRanges(start=start, end=end))
refbase <- getSeq(fasta_file, gr1)
ref <- as.data.frame(refbase)$x

# 2. Overlap between two bed files
library(GenomicRanges)
findOverlaps(makeGRangesFromDataFrame( read.table(bed1, h=T, stringsAsFactors=F) ), 
             makeGRangesFromDataFrame( read.table(bed2, h=T, stringsAsFactors=F) ) )
# this will return a Hits object with 2 columns: queryHits subjectHits (ids of bed1 in bed2 and bed2 in bed1)
