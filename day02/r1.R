sh <- read.csv("shop.txt",
               header = F,
               stringsAsFactors = F,
               fileEncoding = "UTF-8"
               )
#colnames(sh) <- c("ID","NAME","AGE","TEMP","PRICE","QT")
sh
tt <- sh$PRICE * sh$QT
sh$TOTAL <- tt
write.csv(
  sh,
  file="shoptotal.csv",
  row.names = T,
  fileEncoding ="UTF-8"
)
save(sh,file="shoptotal.rda")
sht <- load("shoptotal.rda")
tt <- sum(sh$TOTAL)
mn <- mean(sh$TOTAL)
tt <- rowSums(sh[,c(4:7)])
tt
tt <- rowSums(sh[,c(4:7)],na.rm = T)
tt