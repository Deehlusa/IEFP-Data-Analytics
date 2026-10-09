#Cria função adicionar com variáveis (despesas, descrição, valor)
def adicionar(despesas, descricao, valor):
    despesas.append((descricao, valor)) #Adiciona valor


def total(despesas):
    soma = 0
    for descricao, valor in despesas:
        soma = soma + valor
    return soma


def listar(despesas):
    if len(despesas) == 0:
        print("Ainda não há despesas.")
        return

    print("\n--- LISTA DE DESPESAS ---")
    for descricao, valor in despesas:
            print(descricao, "-", valor, "€")


def main():
    despesas = []
    adicionar(despesas, "Café", 1.20)
    adicionar(despesas, "Almoço", 10.50)
    adicionar(despesas, "Livro", 15.00)

    while True:
        print("\n=== MENU INTERATIVO ===")
        print("1 - ADICIONAR")
        print("2 - VER DESPESAS")
        print("3 - VER TOTAL")
        print("4 - SAIR")

        opcao = input("Escolha uma opção (1-4): ")

        match opcao:
            case "1":
                descricao = input("Descrição da despesa: ")
                valor = float(input("Valor (€): "))
                adicionar(despesas, descricao, valor)
                print("Despesa adicionada com sucesso!")

            case "2":
                listar(despesas)

            case "3":
                print(f"Total gasto: {total(despesas):.2f} €")

            case "4":
                print("Fechado. Até logo!")
                break

            case _:
                print("Opção inválida! Escolha entre 1 e 4.")


# Inicia o programa se for executado diretamente
if __name__ == "__main__":
    main()


    