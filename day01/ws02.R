library(readxl)
dt <- read.table("한국공항공사_공항시설관리정보_20200918.csv",
                 sep=",",
                 stringsAsFactors = F,
                 header=T
)
dt
str(dt)