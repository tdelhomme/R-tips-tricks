# stacked boxplot with ggplot2
library(ggpubr)
library(ggsci)

myclasses = "classes"
mysubclasses = "subclasses"

df_transform <- function(df, classes, subclasses){
  colnames(df)[which(colnames(df)==classes)] = "cl"
  colnames(df)[which(colnames(df)==subclasses)] = "scl"
  colnames(df)[which(colnames(df) != "cl" & colnames(df) != "scl")][1] = "len"
  res = arrange(aggregate(len ~ cl + scl, df, length), cl, len)
  ddply(res, "cl", transform, ylabel_pos = cumsum(len) )
}


df=df_transform(ctDNA_dataset_disc_df[which(ctDNA_dataset_disc$SCLC_status==1),], myclasses, mysubclasses)
p = ggbarplot(df, x = "cl", y = "len",
          fill = "scl", color = "scl",
          label = TRUE, lab.col = "white", lab.pos = "in", palette = "NPG", legend.title=mysubclasses,
          xlab=myclasses, ylab="counts")
p + theme_minimal() + scale_fill_npg() + scale_color_npg()
