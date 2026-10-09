# Escrever script básico que recebe input print positivo negativo ou 0

valor = int(input("Digite o valor: "))

if valor > 0:
    print("Valor é positivo")
elif valor < 0:
    print("Valor é negativo")
else:
    print("Valor é igual a zero")