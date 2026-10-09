numero = 0
#numero = int(input("Insira o numero da tabuada: "))
def tabuada():
        while True:
            numero = int(input("Insira o número entre 0 e 20: "))
            if 0 <= numero <= 20:
                break  # Sai do while se o número for válido
            print("Número Inválido. Tente novamente.\n")

        print(f"\n--- TABUADA DO {numero} ---")
        for i in range(1, 11):
            resultado = numero * i
            print(f"{numero} x {i} = {resultado}")

if __name__ == "__main__":
    tabuada()
