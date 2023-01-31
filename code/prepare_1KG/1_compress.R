#goal: compress legend and map file
for(j in 1:22){
  system(paste0("cd /data/zhangh24/KG.impute2/1000GP_Phase3; cp genetic_map_chr",j,"_combined_b37.txt /data/zhangh24/Simu_Geno_Pipeline/result/genetic_map/"))
}
for(j in 1:22){
  system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/genetic_map/; zip genetic_map_chr",j,"_combined_b37.txt.zip genetic_map_chr",j,"_combined_b37.txt"))
}
for(j in 1:22){
  system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/genetic_map/; rm genetic_map_chr",j,"_combined_b37.txt"))
}
system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/; zip -r genetic_map.zip genetic_map"))


for(j in 1:22){
  system(paste0("cd /data/zhangh24/KG.impute2/1000GP_Phase3; cp 1000GP_Phase3_chr",j,".legend /data/zhangh24/Simu_Geno_Pipeline/result/legend/"))
}
for(j in 1:22){
  system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/legend/; zip 1000GP_Phase3_chr",j,".legend.zip 1000GP_Phase3_chr",j,".legend"))
}
for(j in 1:22){
  system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/legend/; rm 1000GP_Phase3_chr",j,".legend"))
}
system(paste0("cd /data/zhangh24/Simu_Geno_Pipeline/result/; zip -r legend.zip legend"))
