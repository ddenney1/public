##import genotypes
newres.files <- list.files(pattern = "*.newres", full.names = F)
myfiles = sapply(newres.files, function (i){
  read.table(i, header = T)
}, USE.NAMES = T, simplify = F)

install.packages("dplyr")
library("dplyr")

#zygosity
l <- lapply(myfiles, function(x) x %>% select(zygosity) )
zygosity <- bind_rows(l, .id = "zygosity")
colnames(zygosity) <- c("genotype", "zygosity")
zygosity$genotype <- gsub("*.newres","",zygosity$genotype)
plot(zygosity$genotype, zygosity$zygosity)
plot(zygosity ~ factor(genotype), zygosity, las =3, xlab="", ylab = "Zygosity")

#rab Relatedness - higher = more inbreeding
m <- lapply(myfiles, function(x) x %>% select(rab))
rab <- bind_rows(m, .id = "rab")
colnames(rab) <- c("genotypes", "rab")
rab$genotypes <- gsub("*.newres","",rab$genotypes)
pdf("rab.pdf")
plot(rab ~ factor(genotypes), rab, las = 3, xlab="", ylab= "rab")
dev.off()

#J1 or identity
i <- lapply(myfiles, function(x) x%>% select(J1))
identity <- bind_rows(i, .id = "J1")
colnames(identity) <- c("genotypes", "identity")
identity$genotypes <- gsub("*.newres","",identity$genotypes)
plot(identity ~ factor(genotypes), identity, las = 3, xlab="", ylab= "identity")

#R0
r <- lapply(myfiles, function(x) x%>% select(R0))
R0 <- bind_rows(r, .id = "R0")
colnames(R0) <- c("genotypes", "R0")
R0$genotypes <- gsub("*.newres","",R0$genotypes)
plot(R0 ~ factor(genotypes), R0, las = 3, xlab="", ylab= "R0")

#Inbreed relatedness individual 1 to 2
ibr <- lapply(myfiles, function(x) x%>% select(inbred_relatedness_1_2))
IBR <- bind_rows(ibr, .id = "IBR")
colnames(IBR) <- c("genotypes", "IBR")
IBR$genotypes <- gsub("*.newres","",IBR$genotypes)
pdf("IBR.pdf")
plot(IBR ~ factor(genotypes), IBR, las = 3, xlab="", ylab= "IBR")
dev.off()

#F of individual a
a <- lapply(myfiles, function(x) x%>% select(Fa))
Fa <- bind_rows(a, .id = "Fa")
colnames(Fa) <- c("genotypes", "Fa")
Fa$genotypes <- gsub("*.newres","",Fa$genotypes)
plot(Fa ~ factor(genotypes), Fa, las = 3, xlab="", ylab= "Fa")

#Theta
t <- lapply(myfiles, function(x) x%>% select(theta))
theta <- bind_rows(t, .id = "theta")
colnames(theta) <- c("genotypes", "theta")
theta$genotypes <- gsub("*.newres","",theta$genotypes)
plot(theta ~ factor(genotypes), theta, las = 3, xlab="", ylab= "theta")

#Coverage
c <- lapply(myfiles, function(x) x%>% select(coverage))
coverage <- bind_rows(c, .id = "coverage")
colnames(coverage) <- c("genotypes", "coverage")
coverage$genotypes <- gsub("*.newres","",coverage$genotypes)
plot(coverage ~ factor(genotypes), coverage, las = 3, xlab="", ylab= "coverage")

#Fraternity
f <- lapply(myfiles, function(x) x%>% select(fraternity))
fraternity <- bind_rows(f, .id = "fraternity")
colnames(fraternity) <- c("genotypes", "fraternity")
fraternity$genotypes <- gsub("*.newres","",fraternity$genotypes)
plot(fraternity ~ factor(genotypes), fraternity, las = 3, xlab="", ylab= "fraternity")
