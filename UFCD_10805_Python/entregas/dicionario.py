# cria o dicionário do produto listas

produto1 = {
    "nome": "Teclado",
    "preco": 29.99,
    "stock": 10

    }
produto2 = {
    "nome": "Rato",
    "preco": 20,
    "stock": 10

    }


print(f"{produto1['preco']}€ SEM IVA")
print(produto1["preco"])
precofinal = produto1["preco"]*1.23
print(f"Preço final: {precofinal:.2f}€ COM IVA") # imprime o preco final em fstring o . separa inteiro o 2 forca exibicao de 2 casas decimais e o f imprime float

#print( f"O produto {produto1['nome']} custa {produto1['preco']} e possui {produto1['stock']} unidades em stock")
#print(produto1, produto2)