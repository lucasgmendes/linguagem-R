#Lista de Exerc�cios 3
#Lucas Guimar�es Mendes

#Exerc�cio 1
'
Os amigos David Gilmour, Robert Plant, Nick Manson e Jimmy
Page desejam fazer um amigo oculto entre eles. Estime a probabilidade de
que este amigo oculto n�o d� errado. Em seguida, crie uma fun��o para
estimar esta probabilidade em um grupo com n pessoas. Obs: um amigo
oculto d� errado quando uma pessoa sorteia ela mesma.
'
#Parte 1:

resultado <- c()

for(j in 1:10000){
  participantes <- c(1:3)
  sorteio <- sample(participantes, length(participantes), replace = FALSE)
  
  for (i in participantes) {
    if(sorteio[i] != participantes[i]){ #Deu certo!
      indicador <- 1
    }
    else{
      indicador <- 0
      break
    }
  }
  resultado[j] <- indicador
}
print(mean(resultado))


#Parte 2:

func_sorteio <- function(n,m){ #(Nro. de Participantes, Nro. de repeti��es)
  resultado <- c()
  
  for(j in 1:m){
    participantes <- c(1:n)
    sorteio <- sample(participantes, length(participantes), replace = FALSE)
    
    for (i in participantes) {
      if(sorteio[i] != participantes[i]){ #Deu certo!
        indicador <- 1
      }
      else{
        indicador <- 0
        break
      }
    }
    resultado[j] <- indicador
  }
  return(mean(resultado))
}

func_sorteio(1000,10000)

# Exerc�cio 2

#Um dado equilibrado � lan�ado 2 vezes e os n�meros obtidos
#nos dois lan�amentos s�o registrados. Estime a seguinte probabilidade: a
#soma dos dois resultados � 7 ou 11.

resultados <- c()

for(i in 1:10000){
  lancamentos <- c()
  lancamentos <- sample(1:6, 2, replace = TRUE)
  
  resultados[i] <- sum(lancamentos) == 7 || sum(lancamentos) == 11
}
print(mean(resultados))


# Exerc�cio 3
'
Considere tr�s urnas com as seguintes configura��es: a urna I
cont�m 6 bolas pretas, 3 brancas e 4 vermelhas; a urna II cont�m 3 bolas
pretas, 5 brancas e 2 vermelhas; a urna III cont�m 4 bolas pretas, 2 brancas
e 2 vermelhas. Lan�a-se um dado equilibrado. Se sair 5, uma bola da urna
I � retirada; se sair 1, 4 ou 6, ent�o uma bola da urna II � retirada; se sair
2 ou 3, ent�o uma bola da urna III � retirada. Estime a probabilidade da
bola retirada ser vermelha.
'

# Soul�ao escrita:
'
V = {sair bola vermelha}

P(V) = ?
  
  P(U1) = 1/6  
P(U2) = 3/6  
P(U3) = 2/6  

P(V|U1) = 4/13  
P(V|U2) = 2/10  
P(V|U3) = 2/8  


P(V) = P(V ^ U1) + P(V ^ U2) + P(V ^ U3)  

P(V) = P(U1) P(V|U1) + P(U2) P(V ^ U2) + P(U3) P(V|U3)  

P(V) =  (1/6)(4/13) + (3/6)(2/10) + (2/6)(2/8)  
'

# Simula��o:
U1 <- c(rep("p",6), rep("b",3), rep("v",4))
U2 <- c(rep("p",3), rep("b",5), rep("v",2))
U3 <- c(rep("p",4), rep("b",2), rep("v",2))

vet_bolas <- c()
for(i in 1:10000){
  dado <- sample(1:6, 1)
  
  if(dado == 5){
    bola <- sample(U1, 1)
  }
  if(dado == 1 || dado == 4 || dado == 6){
    bola <- sample(U2, 1)
  }
  if(dado == 2 || dado == 3){
    bola <- sample(U3, 1)
  }
  vet_bolas[i] <- bola
}
print(mean(vet_bolas == "v"))



# Exerc�cio 4
'
No jogo de Craps dois dados s�o lan�ados:  
  
* se a soma for 7 ou 11, ent�o voc� ganha o jogo;
* se a soma for 2,3 ou 12, ent�o voc� perde o jogo;
* caso contr�rio, os dois dados s�o rolados novamente at� obter-se 7 (voc� perde) ou at� obter-se a soma inicial (voc� ganha).  

Estime a probabilidade de voc� vencer o jogo de Craps.  

Exemplo: as seguintes sequ�ncias (cada entrada � a soma dos dois dados) resultam
em vit�ria: (9), (11), (5, 4, 5), (4, 5, 6, 12, 4); as seguintes sequ�ncias
resultam em derrota: (2), (4, 11, 7), (8, 5, 2, 3, 9, 7).
'

resultado <- c()
for(i in 1:10000){
  dados <- sample(1:6, 2, replace = TRUE)
  soma <- sum(dados)
  
  if(soma == 7 || soma == 11){
    resultado[i] <- 1 #Venceu
  } else if(soma == 2 || soma == 3 || soma == 12){
    resultado[i] <- 0 #Perdeu
  } else{
    dados <- sample(1:6, 2, replace = TRUE)
    soma <- sum(dados)
    primeiro <- soma
    
    while(soma != 7 && soma != primeiro){
      dados <- sample(1:6, 2, replace = TRUE)
      soma <- sum(dados)
    }
    
    if(soma == 7){
      resultado[i] <- 0 #Perdeu
    } else{
      resultado[i] <- 1 #Venceu
    }
  }
}

print(mean(resultado))

# Exerc�cio 5
#Utilize o m�todo de MC para estimar as seguintes integrais:

#Integral 1
a = -1
b = 2

x <- runif(10, a, b)
x <- (-x*x)/2
result <- exp(x)/sqrt(2*pi)
print(mean(result)*(b - a))


#Integral 2
a = 0
b = pi

x <- runif(10000, a, b)
result <- cos(x)*cos(x)
mean(result)*(b - a)

