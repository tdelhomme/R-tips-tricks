# R script to compare two versions of the glmrob.nb function on simulated data, one compiled and the other one not
library(compiler)
library(microbenchmark)
library(ggplot2)
library(Rcurl)

eval(parse(text = getURL("https://raw.githubusercontent.com/IARCbioinfo/needlestack/master/bin/glm_rob_nb.r")))

comp_glmrob.nb = cmpfun(glmrob.nb)

rbetabin <- function(n,e,F,k) {
  p=rbeta(n,e*(1-F)/F,(1-e)*(1-F)/F)
  rbinom(n,k,p)
}

comp_glm <- function(fun="non compiled"){
  e = sample(c(0.001,0.005,0.01,0.05), 1, replace = TRUE)
  F = sample(c(0.01,0.1,1), 1, replace = TRUE) * e
  x = round(seq(1000,10000,l=100))
  y = rbetabin(length(x), e, F, x)
  if(fun=="non compiled") {res = glmrob.nb(y,x)} else {res = comp_glmrob.nb(y,x)}
}

compare <- microbenchmark(comp_glm(fun="not compiled"), comp_glm(fun="compiled"), times = 30)

autoplot(compare, log = FALSE)
