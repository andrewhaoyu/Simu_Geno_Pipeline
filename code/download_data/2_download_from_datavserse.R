library(readtext)
raw_txt = readtext("./data/download_datavers.txt")
idx = grep("https://dataverse.harvard.edu/api/access/datafile/",raw_txt$text )
get_id <- function(x) {
  pattern <- "https://dataverse.harvard.edu/api/access/datafile/[0-9]+"
  match <- regexpr(pattern, x)
  if (match == -1) {
    return(NA)
  } else {
    return(regmatches(x, match)[1])
  }
}
result <- sapply(idx, function(i) {
  id <- get_id(raw_txt[i])
  file_name <- gsub("<labl>|</labl>", "", raw_txt[i + 1])
  paste0("wget ", id, " -O ", file_name)
})

write.table(result, file = paste0("./code/download_data/download_update.sh"),
            row.names = F, col.names = F, quote = F)
