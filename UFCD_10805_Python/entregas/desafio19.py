def avaliar_turma(notas_alunos, nota_minima=10):
        aprovados = []  # 1. Usa lista [] em vez de dicionário {}

        # 2. Usa o argumento 'notas_alunos'
        for aluno, nota in notas_alunos.items():
            # 3. Usa >= para incluir a nota igual à mínima
            if nota >= nota_minima:
                aprovados.append(aluno)
        total_aprovados = len(aprovados)
        return total_aprovados, aprovados

turma = {"Ana": 16, "João": 8, "Maria": 14}
total, lista_nomes = avaliar_turma(turma)

print(f"Total de aprovados: {total}")
print(f"Lista de aprovados: {lista_nomes}")