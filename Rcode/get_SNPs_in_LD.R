# Script to returns the table of SNPs that are in linkage desequilibrium with input SNPs

# core function:

get_LD_snps <- function(snp, mytoken, r2=0.3, distance=50000){
    df_proxies <- LDproxy(snp, pop="CEU", r2d="r2", token=mytoken)
    df_proxies_filt = df_proxies[which(as.numeric(df_proxies$R2)>r2 & abs(as.numeric(df_proxies$Distance)) <= distance), ]
    as.character(df_proxies$RS_Number)
  }
  
