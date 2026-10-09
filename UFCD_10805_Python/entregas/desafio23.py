## CONTAR O NÚMERO DE OCORRÊNCIAS NUMA LISTA DE NÚMEROS
# conteúdo do ficheiro: UFCD_10805_Python/entregas/desafio23.py
lista = [1,2,2,3,3,1,2,2]

print("Lista de números:", len(set(lista))) #imprime o numero de elementos únicos na lista

vistos = [1]
for n in lista:
    if n not in vistos:
        vistos.append(n)
        print(f"O número {n} aparece {lista.count(n)} vezes.")  

# conceito de set() é uma coleção não ordenada de elementos únicos. 
# Ao converter a lista em um conjunto, obtemos apenas os elementos distintos.
# aplicando a função count() para contar as ocorrências de cada elemento na lista original, 
# podemos determinar quantas vezes cada número aparece.
for n in set(lista): 
    print(f"O número {n} aparece {lista.count(n)} vezes.")



