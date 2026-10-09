dias_semana = {
    1: "Segunda-Feira",
    2: "Terça-Feira",
    3: "Quarta-Feira",
    4: "Quinta-Feira",
    5: "Sexta-Feira",
    6: "Sábado",
    7: "Domingo"
}

idade = int(input("Introduza um valor entre 1 e 7: "))

for chave, valor in dias_semana.items():
    if chave == dias_semana:
        print(valor)
        break
    else:
        print("Número inválidio! Deve ser entre 1 e 7")