lista = [1, 2, 3, 4, 5, 6]

def separar(lista):
    pares = [n for n in lista if n % 2 == 0]
    impares = [n for n in lista if n % 2 == 1]
    return pares, impares

p, i = separar(lista)
print("Pares: ", p)
print("Ímpares: ", i)
