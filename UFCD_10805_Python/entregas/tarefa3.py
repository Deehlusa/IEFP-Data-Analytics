idade = int(input("Introduza a idade do cliente: "))
dia = input("Indique o dia da semana (ou número de 1 a 7): ").strip().lower()

## criar 2 matchs com idade e dia da semana
match idade:
    case n if n < 12:
        preco_base = 5.0
    case n if n <= 17:
        preco_base = 6.0
    case n if n <= 64:
        preco_base = 8.0
    case _:
        preco_base = 4.0

match dia:
    case "segunda" | "segunda-feira" | "1":
        desconto = 0.20
    case "quarta"| "quarta-feira" | "3":
        desconto = 0.10
    case _:
        desconto = 0.0 # restantes dias

# calculo final bilhete
preco_final = preco_base * (1 - desconto)

# print do resultado
print("\n" + "=" * 25)
print(f"1. Idade:  {idade} anos")
print(f"2. Dia:    {dia}")
print(f"3. Preço Final: {preco_final:.2f}€")
print("=" * 25)