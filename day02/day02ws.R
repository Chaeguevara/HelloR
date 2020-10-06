mid_exam <- as.data.frame(read_excel("mid_exam.xlsx"))
mid_exam <- rename(mid_exam,MATH_MID = MATH, ENG_MID = ENG)

final_exam <- as.data.frame(read_excel("final_exam.xlsx"))
final_exam <- rename(final_exam,MATH_FINAL = MATH, ENG_FINAL = ENG)

total_exam <- full_join(mid_exam,final_exam,by="ID")
total_exam$MATH_AVG <- rowMeans(total_exam %>% select(MATH_MID,MATH_FINAL),na.rm = T)
total_exam$ENG_AVG <- rowMeans(total_exam %>% select(ENG_MID,ENG_FINAL),na.rm = T)
total_exam

valid_score_df <- total_exam %>% filter(is.na(MATH_MID) != TRUE &
                                   is.na(ENG_MID) != TRUE &
                                   is.na(MATH_FINAL) != TRUE &
                                   is.na(ENG_FINAL) != TRUE)
valid_score_df <- as.data.frame(valid_score_df)

#TOTAL_AVG <- rowMeans(valid_score_df %>% select(-MATH_AVG,-ENG_AVG,-CLASS,-ID))
TOTAL_AVG <- as.data.frame(valid_score_df %>% group_by(ID) %>% summarise(MATH_AVG=mean(MATH_AVG),ENG_AVG=mean(ENG_AVG)))


AVG <- colMeans(total_exam %>% select(MATH_AVG,ENG_AVG))
AVG

total_exam %>% filter(MATH_MID >=80 & ENG_MID>=90)

boxplot(TOTAL_AVG$MATH_AVG,TOTAL_AVG$ENG_AVG,ylim=c(0,100), main = 'AVG score', names = c("수학평균","영어평균"), col = c("cyan","magenta"))
