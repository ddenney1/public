files <- list.files(pattern="*.ml")
heterozygotes <- NULL
names <- NULL
for (i in files) {
	a <- scan(i)
	het <- a[2]/sum(a)
	names <- c(names, i)
	heterozygotes <- c(heterozygotes, het)
}
heterozygosity <- data.frame(names,heterozygotes)
write.csv(heterozygosity, file="heterozygosity")
