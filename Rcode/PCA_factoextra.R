### script to perform a PCA analysis using factoextra R package ###

library(factoextra)

res.pca <- prcomp(mydata, scale = TRUE)

# eigen values plot
fviz_eig(res.pca)

# PCA plot
fviz_pca_ind(res.pca)
