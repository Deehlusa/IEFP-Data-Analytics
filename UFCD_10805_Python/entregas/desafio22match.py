def menu():
    print("\n === MENU INTERATIVO ===")
    print("1 - SOMAR")
    print("2 - MULTIPLICAR")
    print("3 - SUBTRAIR")
    print("4 - DIVISÃO")
    print("5 - SAIR")

while True:
    menu()
    opcao = input("Escolha uma opção: ")
    match opcao:
        case "1":
            print("")
        case "2":
            print("")
        case "3":
            print("")
        case "4":
            print("")
        case "5":
            print("")
            break
        case _:
            print("Opção Inválida. Introduza um número entre 1 a 5.")