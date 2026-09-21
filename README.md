# Data Analytics & Engineering Workspace — IEFP
> **Programa:** Especialização em Análise de Dados (`FME94SI0001` · 300h)  
> **Owner:** André Rodrigues  
> **Runtime:** macOS Apple Silicon (ARM64) · Local-First Architecture

---

## 1. Arquitetura do Repositório (Separation of Concerns)

O repositório adota isolamento modular estrito por Unidade de Formação de Curta Duração (UFCD). Cada módulo divide-se em três camadas herméticas: `docs` (especificações e material de leitura), `src` (código-fonte e ensaios) e `entregas` (artefactos canónicos submetidos para avaliação).

```text
IEFP-Data-Analytics/
├── UFCD_10797_Bases_Dados/          # RDBMS, Modelação Relacional & T-SQL
│   ├── docs/                        # Enunciados oficiais ([10797]A1..T3)
│   ├── src/                         # DDL/DML de desenvolvimento
│   └── entregas/                    # Scripts finais auditados (UFCD10797_A1_*.sql)
│
├── UFCD_10805_Python/               # Core Python, Tratamento & Análise de Dados
│   ├── docs/                        # Guias e requisitos analíticos
│   ├── src/                         # Pipelines ETL, Notebooks e Scripts (.py)
│   └── entregas/                    # Relatórios e módulos finalizados
│
├── UFCD_10806_Scripting_Bash/       # Shell Scripting, Automação POSIX & Tooling
│   ├── docs/                        # Documentação de ambiente e manuais
│   ├── src/                         # Shell scripts (.sh) e utilitários CLI
│   └── entregas/                    # Projetos de automação submetidos
│
└── shared/                          # Infraestrutura Compartilhada
    └── docker/                      # Definições de runtime e compose multi-serviço
```

---

## 2. Infraestrutura & Runtime Local

* **RDBMS Engine:** Microsoft Azure SQL Edge (Docker Container `sqlserver`)
  * Port: `1433` (TCP) · Image: `mcr.microsoft.com/azure-sql-edge:latest`
  * Dialect: Transact-SQL (T-SQL) com idempotência declarativa (`DROP TABLE IF EXISTS`, restrições declarativas).
* **Shell Runtime:** Zsh / POSIX compliant (Apple Darwin ARM64).
* **Python Toolchain:** Python 3.12 (Ambientes virtuais isolados por projeto, zero dependências globais).

---

## 3. Diretrizes de Engenharia & Qualidade

1. **Idempotência Obrigatória:** Qualquer script DDL/DML deve ser reexecutável do início ao fim sem causar erros de colisão ou duplicação de dados.
2. **Verificação Pré-Mutação (Safe DML):** Mutações de estado (`UPDATE`, `DELETE`) exigem sempre verificação prévia explícita (`SELECT`) antes de qualquer execução destrutiva.
3. **Soft-Delete por Defeito:** Dados com valor transacional ou histórico devem priorizar inativação lógica (`ativo = 0`) em detrimento de purga física.
4. **Rastreabilidade de Entregas:** A pasta `entregas/` é imutável após a submissão formal no Moodle/FaD, servindo como histórico auditável de conformidade.
