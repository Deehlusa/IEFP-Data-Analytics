# TABUADA DE 5
"""
"""
numero = int(input("Insira o numero da tabuada: "))
def tabuada5():
    for i in range(1, 11):
        resultado = numero * i
        print(f"{numero} x {i} = {resultado}")

tabuada5()