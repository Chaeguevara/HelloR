library(readxl)
dt <- read.table("wsdata.csv",
                 sep=",",
                 stringsAsFactors = F,
                 skip=1
                 )
dt
dt[,c(-1,-2)]
d1 <- as.vector(colMeans(dt[,c(-1,-2)]))
d1
d1 <- c(11,"MEAN",d1)
d1

d2 <- as.vector(colSums(dt[,c(-1,-2)]))
d2 <- c(12,"SUM",d2)
d2
str(dt)
dt
dt <- rbind(dt,d1)
dt <- rbind(dt,d2)
dt
