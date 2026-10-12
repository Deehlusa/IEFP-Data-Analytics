class Retangulo:
# O método __init__ é o construtor da classe Retangulo, que é chamado quando um objeto da classe é criado. 
# Ele recebe dois parâmetros, base e altura, e os atribui aos atributos do objeto self.base e self.altura.
    def __init__(self, base, altura):
        self.base = base
        self.altura = altura
# explicita que a função pertence à classe Retangulo, e não a um objeto específico.
    def area(self):
        return self.base * self.altura
# O método perimetro calcula o perímetro do retângulo usando a fórmula 2 * (base + altura) e retorna o resultado.
    def perimetro(self):
        return 2 * (self.base + self.altura)

print("Área:", Retangulo(5, 10).area())  # Área: 50
print("Perímetro:", Retangulo(5, 10).perimetro()) 
