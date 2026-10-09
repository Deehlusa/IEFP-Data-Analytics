## CLASSES (baseado no slide 277)
from dataclasses import dataclass


# 1. Classe base: o molde de uma pessoa
class Pessoa:
    def __init__(self, nome: str, idade: int):  # __init__ corre quando criamos o objeto
        self.nome = nome  # self = o objeto que está a ser criado
        self.idade = idade


# 2. PessoaV2: repete o código de Pessoa e acrescenta "ativo"
class PessoaV2:
    def __init__(self, nome: str, idade: int, ativo: bool = False):
        self.nome = nome
        self.idade = idade
        self.ativo = ativo


# 3. PessoaV3: herda de Pessoa, por isso não repete nome e idade
class PessoaV3(Pessoa):
    def __init__(self, nome: str, idade: int, ativo: bool = False):
        super().__init__(nome, idade)  # chama o __init__ da classe Pessoa
        self.ativo = ativo


# 4. Dataclass: o Python escreve o __init__ por nós
@dataclass
class PessoaDataClass:
    pessoa: str
    idade: int
    ativo: bool = False


# 5. Veiculo: atributo "privado" com property (ler) e setter (alterar)
class Veiculo:
    def __init__(self, modelo: str, cor: str):
        self.__modelo = modelo  # __ à frente = uso interno da classe
        self.__cor = cor

    def __str__(self) -> str:  # o que o print() mostra
        return f"{self.modelo} ({self.cor})"

    @property
    def modelo(self) -> str:  # só leitura, não tem setter
        return self.__modelo

    @property
    def cor(self) -> str:
        return self.__cor

    @cor.setter
    def cor(self, cor) -> None:  # permite veiculo.cor = "azul"
        self.__cor = cor


# 6. Computador: __slots__ limita os atributos permitidos
SISTEMAS = {1: "Windows", 2: "Linux", 3: "macOS"}


class Computador:
    __slots__ = ("hostname", "sistema", "endereco")

    def __init__(self, hostname: str, so: int, ip: str) -> None:
        self.hostname = hostname
        self.sistema = SISTEMAS[so]
        self.endereco = ip or "127.0.0.1"  # se ip vier vazio, usa o valor por defeito

    def __str__(self) -> str:
        return f"{self.hostname} ({self.sistema}) - {self.endereco}"


# --- Testes ---
p2 = PessoaV2("Ana", 30)
p3 = PessoaV3("Rui", 25, ativo=True)
pd = PessoaDataClass("Marta", 41)
print(p2.nome, p2.ativo)  # Ana False
print(p3.nome, p3.idade, p3.ativo)  # Rui 25 True
print(pd)  # a dataclass já tem um print bonito

carro = Veiculo("Golf", "preto")
print(carro)  # Golf (preto)
carro.cor = "azul"  # usa o setter
print(carro)  # Golf (azul)

pc = Computador("srv-01", 2, "")
print(pc)  # srv-01 (Linux) - 127.0.0.1
