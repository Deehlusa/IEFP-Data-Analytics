def checa_pares(numero):
    """Verifica se um número é par.

    Args:
        n (int): O número a ser validado.

    Returns:
        bool: True se for par, False caso contrário.
    """
    if numero % 2 == 0:
        return "par"
    else:
        return "ímpar"

numero1 = 4
checa_pares(4)  # Retorna True
checa_pares(7)  # Retorna: False
# Usar print() para expor o output no console
print(checa_pares(4))  # Output: True
print(checa_pares(7))  # Output: False

print (numero1)
print (numero1 / 2)
print (numero1 % 2)
print(checa_pares(numero1))