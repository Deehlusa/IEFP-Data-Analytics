##
numero = int(input("Indique um número entre 1 e 7: "))

match numero:
    case 1:
        print("Segunda-Feira")
    case 2:
        print("Terça-Feira")
    case 3:
        print("Quarta-Feira")
    case 4: 
        print("Quinta-Feira")
    case 5:
        print("Sexta-Feira")
    case 6:
        print("Sábado")
    case 7:
        print("Domingo")
    case _:
        print("Número iunválido! Deve ser entre 1 e 7.")