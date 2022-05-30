# how to use the doParallel R package to parallelize your computations

# load the package
library(doParallel)

# create the cluster
clus <- makeCluster(nb_cpu)
clusterExport(clus, list("object1", "object2")) # put here the functions/variables that you will need in the parlapply

# run the loop
par_res = parallel::parLapply(clus, my_input_vector, function(s){
      res = s # here put all the stuff you want to apply to the s item
      return(res)
})
