# Script to returns the table of SNPs that are in linkage desequilibrium with input SNPs

# core function:

get_LD_snps <- function(snp, mytoken, r2=0.3, distance=50000){
    df_proxies <- LDproxy(snp, pop="CEU", r2d="r2", token=mytoken)
    df_proxies_filt = df_proxies[which(as.numeric(df_proxies$R2)>r2 & abs(as.numeric(df_proxies$Distance)) <= distance), ]
    as.character(df_proxies$RS_Number)
  }
  
# compute the LD SNPs:

all_snps = as.character(read.table(input_file, h=T, stringsAsFactors = F)[,1]) #input_file should be a tab delimited file with first column=RS IDs
  
  for(snp in all_snps){
    print(paste(date(), " working on snp: ", snp, sep=""))
    restmp = try(get_LD_snps(snp))
    if(!"try-error" %in% class(restmp)){
      #restmp = get_LD_snps(snp)
      res = restmp[which(grepl("rs", restmp$RS)),] 
      if(match(snp, all_snps) == 1) { LD_snps = res } else { LD_snps = rbind(LD_snps, res) }
    }
  }
