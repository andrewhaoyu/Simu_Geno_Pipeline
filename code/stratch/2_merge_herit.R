library(data.table)
result_list = list()
for(i1 in 1:100){
  load(paste0("/data/zhangh24/Simu_Geno_Pipeline/result/herit/h2_estimate_",i1,".rdata"))
  result_list[[i1]] = as.data.frame(result)
}
result = as.data.frame(rbindlist(result_list))
colMeans(result)
apply(result,2,sd)
chisq.test(result[,1],result[,2])
#install.packages("TauStar")
library(independence)
library(TauStar)
hoeffding.refined.test(result[,1],result[,2])
hoeffding.D.test(result[,1],result[,2])
cor(result[,1],result[,2])
#cor(rank(result[,1]),rank(result[,2]))
save(result, file = 
       paste0("/data/zhangh24/Simu_Geno_Pipeline/result/herit/h2_estimate"))
