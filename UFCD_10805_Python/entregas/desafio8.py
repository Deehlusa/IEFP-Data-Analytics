## IMC = Peso / ( Altura ** 22 )
peso = float(input("Insira o seu peso: "))
altura = float(input("Insira a sua altura: ").replace(",", "."))
imc = peso / (altura ** 2)

print(f"O seu IMC é: {imc:.2f}") # nos temos que formatar o imc . 2 f 

if imc < 18.5:
    #altura = altura / 100
    print("Abaixo do peso")
elif imc < 25:
    print("Normal")
elif imc < 30:
    print("Excesso de peso")
else:
    print("Obesidade")
