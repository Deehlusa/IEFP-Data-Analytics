## CLASSES - versão simples
# Ideia central: uma CLASSE é um molde. Um OBJETO é uma coisa feita com esse molde.
# Molde "Pessoa"  ->  objetos: a Ana, o Rui, a Marta...


# ---------------------------------------------------------------
# PASSO 1: criar o molde (a classe)
# ---------------------------------------------------------------
class Pessoa:
    # __init__ é uma função especial.
    # O Python executa-a SOZINHO sempre que crias uma pessoa nova.
    # Serve para guardar os dados iniciais (nome, idade) dentro do objeto.
    def __init__(self, nome, idade):
        # "self" quer dizer "este objeto que estou a criar".
        # self.nome = nome  -> guarda o nome DENTRO deste objeto.
        self.nome = nome
        self.idade = idade

    # Uma função dentro de uma classe chama-se MÉTODO.
    # O método pode usar os dados guardados no objeto através do self.
    def apresentar(self):
        print(f"Olá, o meu nome é {self.nome} e tenho {self.idade} anos.")


# Criar objetos (chamar o molde com os dados):
ana = Pessoa("Ana", 30)
rui = Pessoa("Rui", 25)

print(ana.nome)  # Ana  -> ler um dado do objeto: objeto.dado
print(rui.idade)  # 25
ana.apresentar()  # usar um método: objeto.metodo()
# Cada objeto tem os SEUS dados: a Ana e o Rui não se misturam.


# ---------------------------------------------------------------
# PASSO 2: __str__ (o que aparece quando fazes print do objeto)
# ---------------------------------------------------------------
class Veiculo:
    def __init__(self, modelo, cor):
        self.modelo = modelo
        self.cor = cor

    # Sem __str__, print(carro) mostra algo feio tipo <__main__.Veiculo object at 0x...>
    # Com __str__, tu decides o texto. Tem de devolver (return) um texto.
    def __str__(self):
        return f"{self.modelo} ({self.cor})"


carro = Veiculo("Golf", "preto")
print(carro)  # Golf (preto)

carro.cor = "azul"  # podes alterar um dado do objeto quando quiseres
print(carro)  # Golf (azul)


# ---------------------------------------------------------------
# PASSO 3: herança (reaproveitar um molde para não repetir código)
# ---------------------------------------------------------------
# Queremos uma pessoa igual à Pessoa, mas com mais um dado: "ativo".
# Em vez de copiar o código todo, escrevemos Pessoa entre parênteses.
# Assim PessoaV3 JÁ TEM nome, idade e o método apresentar().
class PessoaV3(Pessoa):
    def __init__(self, nome, idade, ativo=False):  # ativo=False -> valor por defeito
        # super() = "a classe de onde herdo" (Pessoa).
        # Esta linha chama o __init__ da Pessoa para guardar nome e idade.
        super().__init__(nome, idade)
        # E aqui guardamos só o que é novo:
        self.ativo = ativo


marta = PessoaV3("Marta", 41)  # ativo não indicado -> fica False
joao = PessoaV3("João", 19, ativo=True)

print(marta.nome, marta.ativo)  # Marta False
print(joao.nome, joao.ativo)  # João True
joao.apresentar()  # método herdado da Pessoa, não foi preciso escrevê-lo outra vez


# ---------------------------------------------------------------
# PASSO 4: dataclass (atalho para classes que só guardam dados)
# ---------------------------------------------------------------
from dataclasses import dataclass


# @dataclass pede ao Python para escrever o __init__ e o __str__ por ti.
# Só tens de listar os dados e o tipo de cada um.
@dataclass
class PessoaDataClass:
    nome: str
    idade: int
    ativo: bool = False  # valor por defeito


p = PessoaDataClass("Sofia", 33)
print(p)  # PessoaDataClass(nome='Sofia', idade=33, ativo=False)
print(p.nome)  # Sofia


# ---------------------------------------------------------------
# RESUMO
# ---------------------------------------------------------------
# class        -> molde
# objeto       -> coisa criada com o molde: ana = Pessoa("Ana", 30)
# __init__     -> corre ao criar o objeto e guarda os dados
# self         -> "este objeto"
# método       -> função dentro da classe (apresentar)
# __str__      -> define o texto do print(objeto)
# herança      -> class Filha(Mae): reaproveita o código da Mae
# @dataclass   -> o Python escreve o __init__ por ti
