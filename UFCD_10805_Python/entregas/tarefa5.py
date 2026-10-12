# Com base na classe Forma com um metodo area() que nao faz nada
# depois cria uma com o seu proprio metodo area() 
# quadrado, circulo e triangulo com o seu proprio metodo area()
# Tarefa 05 Polimorfismo - UFCD_10805_Python 
## André Luiz Sales Rodrigues
import math

class Forma:
    def area(self):
        pass

    def __str__(self):
        return "Forma"

class Retangulo(Forma):
    def __init__(self, base, altura):
        self.base = base
        self.altura = altura

    def area(self):
        return self.base * self.altura

    def __str__(self):
        return "Retângulo"

class Quadrado(Forma):
    def __init__(self, lado):
        self.lado = lado

    def area(self):
        return self.lado ** 2

    def __str__(self):
        return "Quadrado"


class Circulo(Forma):
    def __init__(self, raio):
        self.raio = raio

    def area(self):
        return math.pi * self.raio ** 2

    def __str__(self):
        return "Círculo"

class Triangulo(Forma):
    def __init__(self, base, altura):
        self.base = base
        self.altura = altura

    def area(self):
        return self.base * self.altura / 2

    def __str__(self):
        return "Triângulo"

formas = [Retangulo(3, 4), Quadrado(2), Circulo(6), Triangulo(3, 6)]

for f in formas:
    print(f"{f}: {f.area():.2f}")
