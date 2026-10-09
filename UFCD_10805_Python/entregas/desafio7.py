## Escrever 1 script que pede ao utilizador um mes e apresente estação
mes = input("Introduza o mês (Ex: Janeiro, Fevereiro):\n").strip().lower()

if mes and not mes.isdigit():

    match mes:
            case "dezembro" | "janeiro" | "fevereiro":
                print("A estação é o Inverno.")
            case "março" | "marco" | "abril" | "maio":
                print("A estação é a Primavera.")
            case "junho" | "julho" | "agosto":
                print("A estação é o Verão.")
            case "setembro" | "outubro" | "novembro":
                print("A estação é o Outono.")
            case _:
                print("Mês não reconhecido! Verifique a ortografia.")
else:
    print("Entrada inválida! Por favor insira o nome de um mês.")