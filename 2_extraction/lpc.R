library(tuneR)

'
Funkcja pomocnicza zwaracj�ca wsp�czynnki LPC dla wektora danych.
Wej�cie:
1) vector_in  - wektor danych wej�ciowych
2) p          - rz�d predykcji (ilo�� zwracanych wsp�czynnik�w)

Zwraca poziomy wektor wsp�czynnik�w o rozmiarze p

'
    
lpc_single_vector <- function(vector_in, p){
	
	len <- length(vector_in)
	
	if(len%%p == 0){
	  len <- len-1
	}
	
	N <- as.integer(len/p)*p + 1
	U <- matrix(0, p, N-p)
  
	for(i in 1:(N-p)){
		  U[,i] <- vector_in[i:(i+p-1)]
	}
	
	x <- vector_in[(p+1):N]
	
	a <- solve((U %*% t(U))) %*% U %*% x
  
	return (t(a))
}

'
Funkcja zwaracj�ca wsp�czynnki LPC dla pr�bki w formacie wav.
Wej�cie:
1) wave_input  - pr�bka w formacie wav
2) p           - rz�d predykcji (optymalnie w przedziale 10-15) 

W przypadku sygna�u stereo zwraca osobny zestaw wsp�czynnik�w dla ka�dego kana�u.

Przyklad uzycia:
wave_file_input <- file.path("scie�ka_do_pliku_wav")
wave_input <- readWave(wave_file_input)
lpc <- lpc_coefficients(wave_input, 14)

'

lpc_coefficients <- function(wave_input, p){
  
  if(wave_input@stereo == TRUE){
      lpc_l <- lpc_single_vector(wave_input@left, p)
      lpc_r <- lpc_single_vector(wave_input@right, p)
      
      return (rbind(lpc_l, lpc_r))
  }
  else{
      return (lpc_single_vector(wave_input@left, p))
  }
    
}