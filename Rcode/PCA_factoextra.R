### script to perform a PCA analysis using factoextra R package ###
# inspiration from http://www.sthda.com/english/articles/31-principal-component-methods-in-r-practical-guide/118-principal-component-analysis-in-r-prcomp-vs-princomp/

library(factoextra)

res.pca <- prcomp(mydata, scale = TRUE)

# eigen values plot
fviz_eig(res.pca)

# PCA plot
fviz_pca_ind(res.pca)
