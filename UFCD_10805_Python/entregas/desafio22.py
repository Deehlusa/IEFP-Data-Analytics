## MENU INTERATIVO (1 - SOMAR, 2 - MULTIPLICAR, 3 - SUBTRAIR, 4 - DIVISÃO, 5 - SAIR)
from desafio18 import tabuada  # Importa a função do desafio 18

def menu_interativo():
        while True:
            print("\n--- MENU INTERATIVO ---")
            print("1 - SOMAR")
            print("2 - MULTIPLICAR")
            print("3 - SUBTRAIR")
            print("4 - DIVISÃO")
            print("5 - SAIR")

            opcao = input("Escolha uma opção (1-5): ")

            if opcao == "1":
                n1 = float(input("Digite o 1º número: "))
                n2 = float(input("Digite o 2º número: "))
                print(f"Resultado da Soma: {n1 + n2}")

            elif opcao == "2":
                tabuada()

            elif opcao == "3":
                n1 = float(input("Digite o 1º número: "))
                n2 = float(input("Digite o 2º número: "))
                print(f"Resultado da Subtração: {n1 - n2}")

            elif opcao == "4":
                n1 = float(input("Digite o 1º número: "))
                n2 = float(input("Digite o 2º número: "))
                if n2 == 0:
                    print("Erro: Não é possível dividir por zero!")
                else:
                    print(f"Resultado da Divisão: {n1 / n2}")

            elif opcao == "5":
                print("A sair do programa... Até logo!")
                break  # Encerra o ciclo e a função termina

            else:
                print("Opção inválida! Escolha um número de 1 a 5.")


    # Para executar a função:
menu_interativo()