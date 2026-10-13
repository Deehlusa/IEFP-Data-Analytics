# criar uma classe aluno com nome e uma lista de notas que comeca vazia 
# criar 2 metodos adicionar nota e calcular media se nao tiver notas a media e 0 __str__ mostra nome e media

class Aluno:
# __init__ é um método especial que é chamado automaticamente quando um objeto da classe Aluno é criado. Ele inicializa os atributos do objeto, neste caso, o nome do aluno e a lista de notas vazia. 
    def __init__(self, nome):
        self.nome = nome
        self.notas = []
#  adicionar_nota é um método que adiciona uma nota à lista de notas do aluno. Ele recebe um parâmetro nota e a adiciona à lista self.notas usando o método append.
    def adicionar_nota(self, nota):
        self.notas.append(nota)
## calcular_media é um método que calcula a média das notas do aluno. Se não houver notas, retorna 0. Caso contrário, soma todas as notas e divide pelo número de notas para obter a média.
    def calcular_media(self):
        if len(self.notas) == 0:
            raise ZeroDivisionError("O Aluno ainda não tem notas registradas")
        return sum(self.notas) / len(self.notas)
## str__ é um método especial que define como o objeto será representado como uma string.
    def __str__(self):
        media = self.calcular_media()
        return f"Aluno: {self.nome}, Média: {media:.2f}"

    def aprovado(self):
        try:
            return self.calcular_media() >= 10
        except ZeroDivisionError:
            print(f"{self.nome} ainda não tem notas suficientes para calcular a média.")

alunos = []

aluno = Aluno("Maria")
alunos.append(aluno)

aluno = Aluno("Rui")
aluno.adicionar_nota(10) # adiciona a nota a lista por meio do metodo adicionar_nota se fizer print(c) vai mostrar o nome do aluno e a media das notas que e 10.00
aluno.adicionar_nota(8) # a media passa a ser (10 + 8) / 2 = 9.00 no qual chama o metodo calcular_media para calcular a media das notas do aluno e retorna o valor da media.
alunos.append(aluno)

aluno = Aluno("João")
aluno.adicionar_nota(10) # adiciona a nota a lista por meio do metodo adicionar_nota se fizer print(c) vai mostrar o nome do aluno e a media das notas que e 10.00
aluno.adicionar_nota(8) # a media passa a ser (10 + 8) / 2 = 9.00 no qual chama o metodo calcular_media para calcular a media das notas do aluno e retorna o valor da media.
alunos.append(aluno)

for aluno in alunos:
    resultado = aluno.aprovado()
    if resultado is None:
        continue  # sem notas: a mensagem já foi mostrada no except
    if resultado:
        print(f"{aluno.nome}: Aprovado")
    else:
        print(f"{aluno.nome}: Reprovado")