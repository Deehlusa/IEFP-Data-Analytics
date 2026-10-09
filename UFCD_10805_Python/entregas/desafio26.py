# adivinha numero gera numero aleatorio entre 1 e 100 e o utilizador tem de adivinhar dica random.randint(1, 100)
# numa funcao jogo(), o utilizados tenta adivinhas com dicas maior ou menor e no fim mostra o numero de tentativas e se acertou ou nao
import random

def jogo():
    numero_aleatorio = random.randint(1, 10)
    tentativas = 0
    acertou = False
    while not acertou:
        palpite = int(input("Adivinhe o número entre 1 e 10: "))
        tentativas += 1
        if palpite < numero_aleatorio:
            print("O número é maior.")
        elif palpite > numero_aleatorio:
            print("O número é menor.")
        else:
            acertou = True
            print(f"Parabéns! Você acertou o número {numero_aleatorio} em {tentativas} tentativas.")

# rodar o jogo
jogo()