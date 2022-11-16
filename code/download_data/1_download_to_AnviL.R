#goal: download harvard dataverse data to AnViL
#read the download.sh to local
library(data.table)
data = fread("./code/download_data/download.sh", 
             header = F)
eth = c("EUR", "AFR", "AMR", "EAS", "SAS")
download_anvil = rep("c", nrow(data))
temp = 1
for(k in 1:nrow(data)){
  #check which of the five ancestries it belongs to
  index = 0
  for(i in 1:5){
    result = grep(eth[i], data[k,4])  
    if(length(result)==1){
      down_text = c(paste0(data[k,1]," ",
                           data[k,2]," ",
                           data[k,3]," ",
                           data[k,4]," ",
                           "| gsutil cp - ",
                           "gs://fc-581f2645-31ba-4218-b41a-e734600eeec4/GenotypeData/",
                           eth[i],"/",data[k,4]," | rm ", data[k,4]))
      download_anvil[temp] = down_text
      temp = temp + 1
      remove_text = paste0("rm ~/Simu_Geno_Pipeline/code/download_data/",data[k,4])
      download_anvil[temp] = remove_text
      temp = temp + 1
      index = 1
    }
  
    
  }
  #if not belong to genotype data, then it belongs to SnpInfor
  if(index == 0){
    down_text = c(paste0(data[k,1]," ",
                         data[k,2]," ",
                         data[k,3]," ",
                         data[k,4]," ",
                         "| gsutil cp - ",
                         "gs://fc-581f2645-31ba-4218-b41a-e734600eeec4/SnpInfor/",
                         data[k,4]," | rm ", data[k,4]))
    download_anvil[temp] = down_text
    temp = temp + 1
    remove_text = paste0("rm ~/Simu_Geno_Pipeline/code/download_data/",data[k,4])
    download_anvil[temp] = remove_text
    temp = temp + 1
    index = 1
  }
  
}

write.table(download_anvil, file = "./code/download_data/download_anvil.sh", row.names = F,
            col.names = F, quote = F)
