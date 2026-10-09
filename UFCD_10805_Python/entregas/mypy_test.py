def somar(a: int, b: int) -> int:
    return a + b


# Chamada válida
print(somar(10, 20))

# Chamada com erro proposital (passando string onde se espera int)
print(somar(10, 30))