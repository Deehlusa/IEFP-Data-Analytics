# Desafio 32 - classe Produto com validação de preço usando @property e uma exceção personalizada
# PrecoInvalidoError é uma exceção personalizada: herda de Exception, por isso funciona como qualquer erro do Python (raise / except), mas com um nome próprio.
class PrecoInvalidoError(Exception):
    pass

class Produto:
# __init__ recebe o nome e o preço. Usa self.preco (sem _) para o valor passar pelo setter e ser validado logo na criação do produto.
    def __init__(self, nome, preco):
        self.nome = nome
        self.preco = preco

# @property transforma o método preco num "atributo": lê-se com p1.preco, sem parênteses. Devolve o valor guardado em self._preco.
# privado
    @property
    def preco(self):
        return self._preco

# @preco.setter é chamado sempre que se faz p1.preco = valor. Valida o valor: se for menor ou igual a zero lança PrecoInvalidoError, senão guarda-o em self._preco.
#privado apenas leitura.
    @preco.setter
    def preco(self, valor):
        if valor <= 0:
            raise PrecoInvalidoError(f"O Preço de {valor}E é inválido. Deve ser maior que 0")
        self._preco = valor

p1 = Produto("Portátil", 1200)
print(f"Produto {p1.nome} = {p1.preco}E")  # Produto Portátil = 1200E

# alterar o preço para -50 passa pelo setter, que lança PrecoInvalidoError; o except apanha o erro para o programa não parar.
try:
    p1.preco = -50
except PrecoInvalidoError as erro:
    print(f"Erro: {erro}")  # Erro: O Preço de -50E é inválido. Deve ser maior que 0
