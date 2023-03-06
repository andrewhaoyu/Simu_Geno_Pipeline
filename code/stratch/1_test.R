
args = commandArgs(trailingOnly = T)
i1 = as.numeric(args[[1]])
ar1_cor <- function(n, rho) {
  exponent <- abs(matrix(1:n - 1, nrow = n, ncol = n, byrow = TRUE) - 
                    (1:n - 1))
  rho^exponent
}
library(MASS)
library(mvtnorm)
p = 100
n = 1000
rho = 0.8
sigma = ar1_cor(p,rho)

sample = mvrnorm(n = n,
                 mu = rep(0,p),
                 Sigma = sigma)
genotype_data = matrix(sample, 
                       n, 
                       p)
GRM = genotype_data%*%t(genotype_data)

n_rep = 10
h2 = 0.4
GWAS = function(y,genotype_data){
  p = ncol(genotype_data)
  chisquare_vec = rep(0,p)
  for(l in 1:ncol(genotype_data)){
    model = lm(y ~ genotype_data[, l])
    model.sum = summary(model)
    chisquare_vec[l] = coefficients(model.sum)[2,3]^2
  }
  return(chisquare_vec)
}
LDScore = function(genotype_data){
  ld = cor(genotype_data)^2
  
  return(rowSums(ld))
}
ld_score = LDScore(genotype_data)
LDscoreReg = function(chisquare_vec,ld_score,n,p){
  ld_score_scale = ld_score*n/p
  model = lm(chisquare_vec~ld_score_scale)
  model.sum = summary(model)
  h2_estimate = coefficients(model.sum)[2,1]
  return(h2_estimate)
}
h2_reml = rep(0,n_rep)
h2_ldscore = rep(0,n_rep)
for(k in 1:n_rep){
  if(k%%10==0)print(k)
  beta = rnorm(p, mean = 0, sd = sqrt(h2/p))
  error = rnorm(p, mean = 0, sd = sqrt(1-h2))
  y = genotype_data%*%beta+error
  
  
  MixedModelLL = function(y,GRM,p,h2){
    n = length(y)
    sigma = GRM*h2/p+(1-h2)*diag(n)
    y  = as.vector(y)
    mu = rep(0,n)
    ll <- mvtnorm::dmvnorm(x = y, mean = mu,
                           sigma = sigma, log = TRUE)
    return(ll)
  }


  h2_reml[k] = optimize(function(x){MixedModelLL(y=y,GRM=GRM,p=p,x)},
                         c(0,1),maximum = T)$maximum

  
  chisquare_vec = GWAS(y,genotype_data)
  h2_ldscore[k] = LDscoreReg(chisquare_vec,ld_score,n,p)
  
  
}
result = cbind(h2_reml,h2_ldscore)
save(result, 
     file = paste0("/data/zhangh24/Simu_Geno_Pipeline/result/herit/h2_estimate_",i1,".rdata"))
