# my_table should contains 2 columns, one for the my_table_col_prop values and one for the my_table_col values
my_table = read.table("my_input.txt", stringsAsFactors=F, header=T, sep="\t")
xclasses = seq(0,1,by=0.1) # here define the x-axis of the plot (classes)
my_table_col = "" # here define the column of my_table where values will be compared to xclasses
names_subclasses = c("") # here define the names (to order and control for NA in proportion table) of subclasses
my_table_col_prop = "" # here define the name of the column that contains names_subclasses values

l = lapply(1:(length(xclasses)-1), function(i){
  cl = xclasses[i:(i+1)]
  t = table(my_table[which(my_table[,my_table_col]>=cl[1] & my_table[,my_table_col]<cl[2]),my_table_col_prop])[names_subclasses]
  t[which(is.na(t))] = 0 # set 0 if nothing in the class
  names(t) = names_subclasses # correct names, because if NA in the table, the name was not kept
  t / sum(t) # return the result
})

prop_subst = matrix(unlist(l), ncol = length(l), byrow = F)
barplot(prop_subst, space=0, xlab="", ylab="", las=2, main="")
axis(1, at=0:(length(xclasses)-1), labels=round(xclasses,2))
