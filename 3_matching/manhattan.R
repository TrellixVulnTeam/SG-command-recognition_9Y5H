manhattan <- function(a, b) {

# setwd("D:\\Uczelnia/Projekty/R") <- dodawanie sciezki
# ???????????????????????????????????????? #
#  #
# Zaprogramowano przez:								  #
# Junior R Developer Szczepan Mr๓wka					  #
# R Algorithmic Manager Mateusz Woniak					  #
# Wejcie: a,b - wektory TEJ SAMEJ dณugoci				  #
# Wyjcie: wektor - odlegณoๆ mi๊dzy a i b w metryce miejskiej	  #
# All rights reserved ฎ								  #
#  #
# ???????????????????????????????????????? #

n1 <- length(a)
n2 <- length(b)

if(n1 != n2) {
	print("Wektory roznej dlugosci!")
	return(0)
}
else {
	wynik <- c()
	suma <- 0

	for(i in 1:n1) {
		wynik[i] <- abs(a[i]-b[i])
		suma <- suma + wynik[i]
	}
	return(wynik) 
}
}