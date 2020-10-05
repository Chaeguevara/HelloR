m1 <-matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol=3)
colnames(m1) <- c("c1","c2","c3")
rownames(m1) <- c("R1","R2","R3")
m1[1:2, ]
nrow(m1)
ncol(m1)
d <- dim(m1)
d
m1

rowMeans(m1[c(1,2),])

d1 <- data.frame(name=c("kim","lee","seo"),
                 ko=c(90,80,98),
                 en=c(100,78,92),
                 ma=c(99,68,88))
str(d1)
dname <- d1$name
dname

dko <- d1$ko
dko
mean(dko)

d1$ko <- c(100,90,99)
d1$si <- c(90,80,88)
d1

d1$ko[c(1,2)]

typeof(d1)

d1[-1,c("ko","en","ma")]

result <- d1[,c("ko"),drop=T]

is.data.frame(result)

d1 <- data.frame(name=c("kim","lee","seo"),
                 ko=c(90,80,98),
                 en=c(100,78,92),
                 ma=c(99,68,88),
                 stringsAsFactors = F)
str(d1)
