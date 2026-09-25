# P1 CRIACAO DE VARIAVEIS E TIPOS STR INT FLOAT BOOL
Nome = "André Luiz Sales Rodrigues"
Idade = int("32")
Altura = float("1.85")
Vip = True

# PRINT TYPES
print("--------STRING TIPOS---------")
print(type(Nome))
print(type(Idade))
print(type(Altura))
print(type(Vip))
print("----------------------")
# PRINT VALOR GUARDADO
# USA MAIUSCULO
print (Nome.upper())
# SPLIT e INDEXAÇÃO DE STRING - PEGA O PRIMEIRO NOME
print(Nome.split()[0])
# METODO TITTLE REDUNDANTE PQ ESCREVI AS PRIMEIRAS LETRAS DO NOME EM MAISCULA
print(Nome.title())
print(Nome, Idade, Altura, Vip)
print("----------------------")


# IDADE ATUAL E INPUT CONVERTE PRA INT 
Nascimento = int(input("Insira o ano de nascimento: "))
# VARIAVEL IDADE RECEBE NASCIMENTO E SUBTRAI
Idade = 2026 - Nascimento  # Ano atual - ano de nascimento
# INVOCA F STRING PARA FORMATAR O TEXTO E IMPRIMIR VALOR
print(f"A sua idade é: {Idade} anos")


# MOSTRA VALOR NAME E TEM IDADE "X" E É BOOLEAN TRUE
print(f"O Cliente {Nome} tem {Idade} anos e é VIP {Vip}")


# P2 CRIAR LISTA
# CRIA LISTA COM 5 PRODUTOS
Lista_compras = ["Leite", "Arroz", "Ovos", "Pão", "Azeite"] 
# ACRESCENTA APPEND NA LISTA E LARANJA GUARDA NA VARIAVEL lista_compras
Lista_compras.append("Laranja") 
# MOSTRA VALOR SORTED
print(sorted(Lista_compras)) #print resultado sorted mas nao guarda
# SLICING PEGA INICIO DA LISTA E IMPRIME ITENS 1,2,3,4
print(Lista_compras[0:4])

# P3 DICIONARIO
# CRIAR DICIONÁRIO CLIENTE
cliente = {
        "nome": Nome,
        "idade": Idade,
        "vip": Vip,
        "compras": Lista_compras
    }

# IMPRIME APENAS A CHAVE COMPRAS
print(cliente["compras"])

# ADICIONA NOVO CAMPO EMAIL
cliente["email"] = "andre@email.com"

# IMPRIME ITENS DO DICIONÁRIO EM F STRING ADICIONEI /N PARA QUEBRA DE LINHA
print(f"\nNome: {cliente['nome']} \nIdade: {cliente['idade']} \nVip: {cliente['vip']} \nCompras: {cliente['compras']} \nEmail: {cliente['email']}")