#Lista de Exerc�cios 2
#Lucas Guimar�es Mendes


# Exerc�cio 1
#Crie os seguintes vetores:

#a) (1, 2, 3, ... , 19, 20);
vet <- c(1:20)
print(vet)

#b) (20, 19, 18, ... , 2, 1);
vet <- c(20:1)
print(vet)


#c) (1, 2, 3, ... , 19, 20, 19, 18, ... , 2, 1);
vet <- c(1:20,19:1)
print(vet)


#d) (0.1^3 0.2^1, 0.1^6 0.2^4, ... , 0.1^36 0.2^34);
vet <- c()
n <- 3
m <- 1
for(i in 1:12){
  vet[i] <- (0.1)^n * (0.2)^m
  n <- n + 3
  m <- m + 3
}
print(vet)


#e) (4, 6, 3, 4, 6, 3, ... , 4, 6, 3), em que h� 10 ocorr�ncias do n�mero 4;
  
vet <- c(4,6,3)
vet <- rep(vet, 10)
print(vet)

#f) (4, 6, 3, 4, 6, 3, . . . , 4, 6, 3, 4), em que h� 11 ocorr�ncias do n�mero 4, 10 ocorr�ncias do n�mero 6 e 10 ocorr�ncias do n�mero 3;

vet <- c(4,6,3)
vet <- rep(vet, 11, length.out = ((11*3)-2))
print(vet)

#Exerc�cio 2
#Crie um vetor cujas as entradas s�o dadas pelo valor de (e^x)cos(x) nos pontos x = 3, 3.1, 3.2, 3.3, ... , 6.
  
vet_x <- seq(from = 3, to = 6, by = 0.1)
vet <- c()
i <- 0
for(x in vet_x){
  vet <- c(vet, exp(x)*cos(x))
}
print(vet)


# Exerc�cio 3
#a)
soma <- 0

for(i in 10:100){
  soma <- soma + (i^3) + (4*(i^2))
}
print(soma)


#b)
soma <- 0
for(i in 10:25){
  soma <- soma + (2^i)/i + ((3^i)/(i^2))
}

print(soma)


# Exerc�cio 4
#A fun��o sample � utlizada para realizar sorteios de um dado conjunto. Exemplo: sample(x = 1:5, size = 10, replace = TRUE) sortear� 10 (size = 10) n�meros do conjunto/vetor {1, 2, 3, 4, 5} (x = 1:5) com reposi��o (replace = TRUE). Caso se deseje realizar um sorteio sem reposi��o deve-se utlizar replace = FALSE. 

xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)


#Suponha que xVec seja representado por (x1, x2, ... , xn) e que o vetor yVec seja representado por (y1; x2; ... ; yn) em que n = 250.
  
#a) Crie um vetor com as entradas �mpares de xVec;
impares <- c()
impares <- xVec[xVec %% 2 != 0]
print(impares)


#b) Crie o vetor (y2 - x1, ... , yn - xn-1);
vet <- c()
for(i in 2:250){
  vet <- c(vet, yVec[i] - xVec[i-1])
}

print(vet)

#c)
vet <- c()
for(i in 2:250){
  vet <- c(vet, sin(yVec[i])/cos(xVec[i-1]))
}
print(vet)


#d)
vet <- c()
for(i in 3:250){
  vet <- c(vet, xVec[i-2] + (2*xVec[i-1]) - xVec[i])
}

print(vet)

#e)
soma <- 0
for(i in 1:249){
  soma <- soma + ((exp(-xVec[i+1]))/(xVec[i]+10))
}
print(soma)

# Exerc�cio 5
#Este exerc�cio ainda utilizar� os vetores xVec e yVec definidos no Exerc�cio 4. Tente utilizar, a seguir, algumas das seguintes fun��es: sort, order, mean, sqrt, sum, abs, max, which.

#a) Quais s�o os �ndices do vetor yVec que correspondem a valores maiores do que 600?
print(which(yVec > 600))

#b) Selecione os valores de yVec que sejam maiores do que 600.
print(yVec[which(yVec > 600)])


#c) Quais valores do vetor xVec correspondem as entradas do vetor yVec que s�o maiores do que 600?
iguais <- c()
for(i in 1:250){
  for(j in 1:250){
    if(xVec[i] == yVec[j] && xVec[i] > 600){
      iguais <- c(iguais, xVec[i])
    }
  }
}
print(iguais)


#d)
vet <- c()
for(i in 1:250){
  vet <- c(vet, abs(xVec[i] - mean(xVec))^(1/2))
}
print(vet)

#e) Quantos valores do vetor yVec est�o a uma dist�ncia de at� 200 do valor m�ximo deste vetor?

maximo <- max(yVec)
resultado <- sum(abs(yVec-maximo) <= 200)
print(resultado)


#f) Quantos n�meros de xVec s�o divis�veis por 2?
soma_div_2 <- sum(xVec %% 2 == 0)
print(soma_div_2)

#g) Ordene os valores de xVec na ordem que deixa os valores de yVec crescentes.
posicao_y <- c()
posicao_y <- order(yVec)

print(xVec[posicao_y])

#h) Seleciones os valores de yVec que est�o nas posi��es 1, 4, 7, 10,...
selecao <- c()
selecao <- seq(from = 1, to = 250, by = 3)
print(yVec[selecao])

# Exerc�cio 6
vet <- c(1)
for(i in 3:39){
  vet <- c(vet,((i-1)/i))
}
print(sum(cumprod(vet)))
