# stacked boxplot with ggplot2

df_transform <- function(df, classes, subclasses){
  colnames(df)[which(colnames(df)==classes)] = "cl"
  colnames(df)[which(colnames(df)==subclasses)] = "scl"
  colnames(df)[which(colnames(df) != "cl" & colnames(df) != "scl")][1] = "len"
  res = arrange(aggregate(len ~ cl + scl, df, length), cl, len)
  ddply(res, "cl", transform, ylabel_pos = cumsum(len) - max(res$len)*0.03 )
}

ggplot(data = df_transform(ctDNA_dataset_disc_df[which(ctDNA_dataset_disc$SCLC_status==0),], myclasses, mysubclasses),
       aes(x = cl, y = len, fill = scl )) +
  geom_bar(stat="identity") +
  geom_text(aes(y=ylabel_pos, label=len), color="white", size=3.5) +
  scale_fill_brewer(palette="Paired") +
  theme_minimal()
