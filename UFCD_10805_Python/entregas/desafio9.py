    ## Mini calculadora

numb1 = float(input("Introduza o número 1: "))
numb2 = float(input("Introduza o número 2: "))
operacao = input("Indique a sua operação (+, -, *, /): ").strip()

    # processar a operação
match operacao:
        case "+":
            resultado = numb1 + numb2
            print(f"{numb1} + {numb2} = {resultado}")

        case "-":
            resultado = numb1 - numb2
            print(f"{numb1} - {numb2} = {resultado}")

        case "*":
            resultado = numb1 * numb2
            print(f"{numb1} * {numb2} = {resultado}")

        case "/":
            if numb2 == 0:  # corrigido para ==
                print("Não é possível dividir por zero!")
            else:
                resultado = numb1 / numb2
                print(f"{numb1} / {numb2} = {resultado}")

        case _:
            print("Operação inválida! Escolha entre +, -, * ou /.")