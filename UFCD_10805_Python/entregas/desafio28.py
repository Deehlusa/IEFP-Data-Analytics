# metodo incrementar +1
# metodo dementar -1
# metodo resetar 0
# A classe Contador tem quatro métodos: incrementar, decrementar, resetar e mostrar. 
# O método incrementar aumenta o valor em 1, o método decrementar diminui o valor em 1, o método resetar redefine o valor para 0
# e o método mostrar exibe o valor atual do contador.
class Contador:
    def __init__(self):
        self.valor = 0
    def incrementar(self):
        self.valor += 1

    def decrementar(self):
        self.valor -= 1

    def resetar(self):
        self.valor = 0

    def mostrar(self):
        print(f"Valor atual: {self.valor}")
