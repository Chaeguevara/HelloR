library(readxl)
library(dplyr)
library(descr)
library(psych)
y16 <- as.data.frame(read_excel("y16.xlsx"))
y17 <- as.data.frame(read_excel("y17.xlsx"))
y16
y17

bind_col <- left_join(y16,y17, by="ID")
bind_col
bind_col_inner <- inner_join(y16,y17,by="ID")
bind_col_inner
bind_col_full <- full_join(y16, y17, by="ID")
bind_col_full
r5 <- bind_col_inner

SUM_AMT = rowSums(bind_col_full %>% select(AMT16, AMT17),na.rm=T)
SUM_CNT = rowSums(bind_col_full %>% select(Y16_CNT, Y17_CNT),na.rm=T)

bind_col_full$SUM_AMT <- SUM_AMT
bind_col_full$SUM_CNT <- SUM_CNT

smr4 = bind_col_full %>% group_by(AREA) %>%
  summarise(AVG_AMT = mean(SUM_AMT),AVG_CNT = mean(SUM_CNT))

smr4 <- as.data.frame(smr4)
smr4$AREA <- ifelse(is.na(smr4$AREA),'NONE',smr4$AREA)

smr4 %>% arrange(desc(AVG_AMT))
smr4 %>% arrange(desc(AVG_CNT))

describe(smr4)
fq <- freq(r5$AREA, plot = T)

hist(r5$AGE)
boxplot(r5$AGE)
