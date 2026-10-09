# SEPARAR OS NÚMEROS PARES E ÍMPARES DE UMA LISTA
# conteúdo do ficheiro: UFCD_10805_Python/entregas/desafio24.py
lista = [1,2,3,4,5,6,]

pares = []
impares = []
# definicao de um ciclo conceito: de for é usado para iterar sobre cada elemento da lista. A variável n representa o elemento atual em cada iteração.
for n in lista: 
    if n % 2 == 0:
        pares.append(n)
    else:
        impares.append(n)
print("Números pares:", pares)
print("Números ímpares:", impares)

# explicação: O código percorre cada número na lista e verifica se é par ou ímpar usando o operador módulo (%).
# n append() é usado para adicionar os números pares à lista 'pares' e os números ímpares à lista 'impares'.
# [] os colchetes são usados para criar listas vazias para armazenar os números pares e ímpares.
# o operador % retorna o resto da divisão de n por 2. Se o resto for 0, o número é par; caso contrário, é ímpar.
