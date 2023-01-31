# system(paste0("mkdir /data/zhangh24/Simu_Geno_Pipeline/result/hap"))
# eth_vec = c("EUR", "AFR", "AMR", "EAS", "SAS")
# for(i in 1:5){
#   system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/hap; mkdir ",eth_vec[i]))
# }
args <- commandArgs(trailingOnly = T)
#i represent ethnic groups
#j represent chromosome
#k is the simulate replicate
i = as.numeric(args[[1]])
j = as.numeric(args[[2]])
eth_vec = c("EUR", "AFR", "AMR", "EAS", "SAS")
# for(i in 1:5){
#   for(j in 1:22){
    system(paste0("cd /data/zhangh24/KG.impute2/",eth_vec[i],"; cp chr",j,".hap /data/zhangh24/Simu_Geno_Pipeline/result/hap/",eth_vec[i]))
#   }
# }
# for(i in 1:5){
#   for(j in 1:22){
    system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/hap/", eth_vec[i], "; zip chr",j,".hap.zip chr",j,".hap"))
#   }
# }
# for(i in 1:5){
#   for(j in 1:22){
    system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/hap/", eth_vec[i], "; rm chr",j,".hap"))
#   }
# }
