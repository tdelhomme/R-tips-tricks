# plot_palette is a function to add a continuous color palette to an exising plot

plot_palette <- function(topright=FALSE, cut_max_qvals=100, palette=rev(rainbow(cut_max_qvals+1,start=0, end=4/6)),
                         nb_levels=6, xright=NULL) {
  xmin=par("usr")[1]
  xmax=par("usr")[2]
  ymin=par("usr")[3]
  ymax=par("usr")[4]
  if(is.null(xright)) xright=xmin+(xmax-xmin)*(1-0.9)
  xleft=xright - 0.04*(xmax-xmin)
  if(topright){xright=xmin+(xmax-xmin)*0.9;xleft=xmin+(xmax-xmin)*0.94}
  ybottom=ymin+(ymax-ymin)*0.72
  ytop=ymin+(ymax-ymin)*0.94

  rasterImage(as.raster(matrix(rev(palette), ncol=1)),xright,ybottom,xleft,ytop )
  rect(xright ,ybottom ,xleft,ytop )
  text(x=(xright+xleft)/2, y = ytop+(ytop-ybottom)*0.1, labels = "QVAL", cex=0.8)
  keep_labels=seq(0,cut_max_qvals,l=nb_levels)
  keep_labels_pos=seq(ybottom,ytop,l=length(keep_labels))
  tick_width=-(xleft-xright)/5
  for (i in 1:length(keep_labels)) {
    if (topright) {
      lines(c(xright,xright+tick_width),c(keep_labels_pos[i],keep_labels_pos[i]))
    } else {
      lines(c(xleft,xleft-tick_width),c(keep_labels_pos[i],keep_labels_pos[i]))
    }
  }
  if(topright) {
    text(x=xright+1.5*tick_width, y = keep_labels_pos, labels = keep_labels,adj = c(1,0.5), cex = 0.8)
  } else {
    text(x=xleft-1.5*tick_width, y = keep_labels_pos, labels = keep_labels,adj = c(1,0.5), cex = 0.8)
  }
}
