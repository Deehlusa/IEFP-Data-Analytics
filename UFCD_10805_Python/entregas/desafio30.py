class animal:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

    def fazer_som(self):
        print("...")

class cachorro(animal):
    def fazer_som(self):
        return f"{self.nome} faz Au Au!"
class gato(animal):
    def fazer_som(self):
        return f"{self.nome} faz Miau!"
class vacaa(animal):
    def fazer_som(self):
        return f"{self.nome} faz Muuuu!"

animais = [cachorro("Rex", 5), gato("Mimi", 3), vacaa("Bessie", 7)]

for a in animais:
    # imprimir o tipo de animal
    print(f"Tipo de animal: {type(a).__name__}")
    print(a.fazer_som())