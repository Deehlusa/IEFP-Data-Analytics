def conversor_tempo(c):
    return c * 1.8  + 32

c = 29.8

temperatura = conversor_tempo(c)
print(f"Temperatura: {c:.0f}°C")  # Temperatura: 26°C # O {valor:.0f} arredonda e retira as casas decimais
print(f"Temperatura: {temperatura:.0f}°F")  # Output: F: funcao conversor_tempo # O {valor:.0f} arredonda e retira as casas decimais
