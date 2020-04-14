# 1. Get reference base from position and fasta file

fasta_file <- FaFile(file='Homo_sapiens_assembly19.fasta')
gr1 <- GRanges(chrom,IRanges(start=start, end=end))
refbase <- getSeq(fasta_file, gr1)
ref <- as.data.frame(refbase)$x
