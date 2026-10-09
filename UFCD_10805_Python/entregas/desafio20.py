n = int(input("Escreva o numero."))

def soma(n):
    # definir que o total e variavel limpa.
    total = 0
    # percorre numero no range 1, n + 1
    for i in range(1, n + 1):
        anterior = total
        total += i
        # Mostra o passo a passo de cada volta:
        print(f"{i}ª volta: total = {anterior} + {i} = {total}")
    return total
#n = 5  
resultado = soma(n)

print(f"A soma de 1 até {n} é: {resultado}")
#print(soma(10))