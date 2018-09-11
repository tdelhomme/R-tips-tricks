# stacked barplot with ggplot2
library(ggpubr)
library(plyr)
library(dplyr)
library(ggsci) # this package loads scientific journals palettes

myclasses = "stat1"
mysubclasses = "stat2"

dataframe = data.frame(n=c(50,10,30,30),
               stat1=c("Y","O","Y","O"),
               stat2=c("R","R","V","V"))

df_transform <- function(df, classes, subclasses){
  colnames(df)[which(colnames(df)==classes)] = "cl"
  colnames(df)[which(colnames(df)==subclasses)] = "scl"
  colnames(df)[which(colnames(df) != "cl" & colnames(df) != "scl")][1] = "len"
  res = df #arrange(aggregate(len ~ cl + scl, df, length), cl, len)
  ddply(res, "cl", transform, ylabel_pos = cumsum(len) )
}


df=df_transform(dataframe, myclasses, mysubclasses)
p = ggbarplot(df, x = "cl", y = "len",
          fill = "scl", color = "scl",
          label = TRUE, lab.col = "white", lab.pos = "in", legend.title=mysubclasses,
          xlab=myclasses, ylab="counts")
p + theme_minimal() + scale_fill_npg() + scale_color_npg()
