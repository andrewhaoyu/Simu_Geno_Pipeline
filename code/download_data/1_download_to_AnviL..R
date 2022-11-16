#goal: download harvard dataverse data to AnViL
#read the download.sh to local
library(data.table)
data = fread("./code/download_data/download.sh", 
             header = F)
eth = c("EUR", "AFR", "AMR", "EAS", "SAS")
download_anvil = rep("c", nrow(data))
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
                           "gs://fc-e8cabdb2-325a-48af-9f8e-8e360431e61f/GenotypeData/",
                           eth[i],"/",data[k,4]," | rm ", data[k,4]))
      download_anvil[k] = down_text
      index = 1
    }
    #if not belong to genotype data, then it belongs to SnpInfor
    if(index == 0){
      down_text = c(paste0(data[k,1]," ",
                           data[k,2]," ",
                           data[k,3]," ",
                           data[k,4]," ",
                           "| gsutil cp - ",
                           "gs://fc-e8cabdb2-325a-48af-9f8e-8e360431e61f/SnpInfor/",
                           data[k,4]," | rm ", data[k,4]))
      download_anvil[k] = down_text
      index = 1
    }
    
  }
  
  
}

write.table(download_anvil, file = "./code/download_data/download_anvil.sh", row.names = F,
            col.names = F, quote = F)