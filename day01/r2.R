library(readxl)
ex2 <- read.table("data.csv",
                  encoding = "UTF-8",
                  header = T,
                  sep=",",
                  stringsAsFactors = F
                  )

ex2
str(ex2)

