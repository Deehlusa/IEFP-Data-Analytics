# ATIVIDADE 3: NORMALIZAÇÃO - SISTEMA GESTÃO HOTELEIRA

**Formando:** André Luiz Sales Rodrigues  
**Data:** 28/09/2026  
**Módulo:** UFCD 10797 — Bases de Dados  

---

## === TAREFA 1: ANÁLISE ===

### 1.1 Violações identificadas

A estrutura original (`Tabela Reservas_Hoteis`) apresenta severas violações às três primeiras formas normais, comprometendo a integridade dos dados e originando anomalias:

* **Violação da 1NF (Valores Não Atómicos e Grupos Repetitivos):**
  * As colunas `Contactos_Cliente`, `Hoteis_Reservados`, `Quartos_Reservados` e `Servicos_Extra` armazenam múltiplos valores separados por vírgulas numa única célula (ex.: `"912345678, 213456789"`, `"SolMar Lisboa, SolMar Porto"`).
  * Criação artificial de colunas com sufixo numérico (`Categoria_Hotel1`, `Cidade_Hotel1`, `Gerente_Hotel1`, etc.), o que impede acomodar múltiplos hotéis de forma elegante e padronizada.
  * **Anomalias associadas:** Dificuldade extrema em indexar, pesquisar ou filtrar por quartos, serviços ou contactos individuais.

* **Violação da 2NF (Dependências Parciais):**
  * Na tentativa de desdobrar listas criando chaves compostas (ex.: `Num_Reserva` + `Quarto`), os atributos como o `Hotel` ao qual o quarto pertence dependem unicamente do `Quarto` e não da `Reserva` em si.
  * **Anomalias associadas (Atualização):** Se um hotel alterar detalhes físicos, todas as reservas históricas com quartos desse hotel teriam de ser atualizadas linha a linha.

* **Violação da 3NF (Dependências Transitivas):**
  * Existem atributos não-chave que dependem funcionalmente de outros atributos não-chave:
    * `Num_Reserva` $\rightarrow$ `Email_Cliente` $\rightarrow$ `Nome_Cliente`
    * `Num_Reserva` $\rightarrow$ `Nome_Hotel` $\rightarrow$ `Cidade_Hotel`, `Categoria_Hotel`, `Gerente_Hotel`
    * `Gerente_Hotel` $\rightarrow$ `Email_Gerente`, `Dept_Gerente`
  * **Anomalias associadas:**
    * *Inserção:* Impossível registar um novo hotel ou gerente no sistema sem que exista previamente pelo menos uma reserva efetuada.
    * *Atualização:* Quando a gerente Ana Martins mudou de email, algumas linhas não foram atualizadas, gerando inconsistência de dados.
    * *Eliminação:* Se cancelarmos ou eliminarmos a única reserva de um cliente ou hotel, todos os dados cadastrais dessa entidade desaparecem da base de dados.

---

### 1.2 Dependências funcionais

Identificação formal das regras e dependências funcionais ($X \rightarrow Y$):

1. **Entidade Cliente:**
   * `Email_Cliente` $\rightarrow$ `Nome_Cliente`
   * `Email_Cliente` $\rightarrow\rightarrow$ `Telefone` *(dependência multivalorada)*
2. **Entidade Hotel & Gerência:**
   * `Nome_Hotel` $\rightarrow$ `Cidade_Hotel`, `Categoria_Hotel`, `Gerente_Hotel`, `Email_Gerente`, `Dept_Gerente`
   * `Gerente_Hotel` $\rightarrow$ `Email_Gerente`, `Dept_Gerente`
3. **Entidade Quarto:**
   * `Quarto` $\rightarrow$ `Nome_Hotel`
4. **Entidade Reserva:**
   * `Num_Reserva` $\rightarrow$ `Email_Cliente`
   * `(Num_Reserva, Quarto)` $\rightarrow$ *Identifica a alocação de quartos a uma reserva*
   * `(Num_Reserva, Servico_Extra)` $\rightarrow$ *Identifica os serviços solicitados na reserva*

---

## === TAREFA 2: PRIMEIRA FORMA NORMAL ===

### 2.1 Campos com valores múltiplos
Identificaram-se 4 atributos com múltiplos valores empacotados por vírgula:
1. `Contactos_Cliente` (ex.: `"912345678, 213456789"`)
2. `Hoteis_Reservados` (ex.: `"SolMar Lisboa, SolMar Porto"`)
3. `Quartos_Reservados` (ex.: `"101, 102"`)
4. `Servicos_Extra` (ex.: `"Pequeno-almoço, SPA"`)

---

### 2.2 Estrutura das tabelas em 1NF

* **TABELA: `Reservas_Principal`**
  * **Campos:** `Num_Reserva`, `Nome_Cliente`, `Email_Cliente`, `Categoria_Hotel1`, `Cidade_Hotel1`, `Gerente_Hotel1`, `Email_Gerente1`, `Dept_Gerente1`
  * **Chave Primária (PK):** `Num_Reserva`

* **TABELA: `Reserva_Contactos` (Tabela A)**
  * **Campos:** `Num_Reserva`, `Telefone`
  * **Chave Primária (PK):** `(Num_Reserva, Telefone)`

* **TABELA: `Reserva_Quartos` (Tabela B)**
  * **Campos:** `Num_Reserva`, `Hoteis_Reservados`, `Quartos_Reservados`
  * **Chave Primária (PK):** `(Num_Reserva, Quartos_Reservados)`

* **TABELA: `Reserva_Servicos` (Tabela C)**
  * **Campos:** `Num_Reserva`, `Servicos_Extra`
  * **Chave Primária (PK):** `(Num_Reserva, Servicos_Extra)`

---

### 2.3 Justificação das decisões
A opção por decompor os grupos repetitivos em novas tabelas (em vez de adicionar colunas como `Telefone1`, `Telefone2`) garante escalabilidade ilimitada (um cliente pode ter $N$ contactos e uma reserva pode ter $N$ quartos sem alterar a estrutura do esquema relacional) e elimina a ocorrência de campos nulos (`NULL`) para reservas sem serviços extras.

---

## === TAREFA 3: SEGUNDA FORMA NORMAL ===

### 3.1 Identificar as dependências parciais
Na tabela `Reserva_Quartos` (Tabela B), a chave primária composta é `(Num_Reserva, Quartos_Reservados)`.
* O campo `Hoteis_Reservados` depende unicamente do número físico do `Quarto` (`Quartos_Reservados` $\rightarrow$ `Hoteis_Reservados`), pois a localização física de um quarto não varia em função da reserva.
* **Violação da 2NF:** Existência de dependência parcial da chave primária composta.

---

### 3.2 Estrutura das tabelas em 2NF

* **TABELA: `Reservas_Principal`**
  * **Campos:** `Num_Reserva`, `Nome_Cliente`, `Email_Cliente`, `Categoria_Hotel1`, `Cidade_Hotel1`, `Gerente_Hotel1`, `Email_Gerente1`, `Dept_Gerente1`
  * **Chave Primária (PK):** `Num_Reserva`

* **TABELA: `Reserva_Contactos` (Tabela A)**
  * **Campos:** `Num_Reserva`, `Telefone`
  * **Chave Primária (PK):** `(Num_Reserva, Telefone)`

* **TABELA: `Reserva_Quartos` (Tabela B)**
  * **Campos:** `Num_Reserva`, `Quartos_Reservados`
  * **Chave Primária (PK):** `(Num_Reserva, Quartos_Reservados)`

* **TABELA: `Reserva_Servicos` (Tabela C)**
  * **Campos:** `Num_Reserva`, `Servicos_Extra`
  * **Chave Primária (PK):** `(Num_Reserva, Servicos_Extra)`

* **TABELA: `Quartos` (Tabela D — Isolada na 2NF)**
  * **Campos:** `Quartos_Reservados`, `Hoteis_Reservados`
  * **Chave Primária (PK):** `Quartos_Reservados`

---

### 3.3 Explicar as eliminações
Ao separar a tabela física de quartos (`Quartos`) da tabela associativa de reservas (`Reserva_Quartos`), eliminou-se a dependência parcial. 
* **Prevenção de anomalias:** O hotel associado a cada quarto passa a estar declarado exatamente uma vez. Se o quarto for marcado em 50 reservas futuras, o nome do hotel não é redundado nem sujeito a erros de escrita.

---

## === TAREFA 4: TERCEIRA FORMA NORMAL ===

### 4.1 Identificar as dependências transitivas
Na tabela `Reservas_Principal`, identificaram-se duas fortes cadeias transitivas a partir de atributos não-chave:
1. `Num_Reserva` $\rightarrow$ `Email_Cliente` $\rightarrow$ `Nome_Cliente` (O nome depende do cliente, não da reserva).
2. `Num_Reserva` $\rightarrow$ `Nome_Hotel` $\rightarrow$ `Cidade`, `Categoria`, `Gerente` $\rightarrow$ `Email_Gerente`, `Dept_Gerente` (Os dados do hotel e dos seus colaboradores pertencem à entidade Hotel).
3. Os contactos na Tabela A pertencem ao cliente titular (`Email_Cliente`), não à reserva transacional.

---

### 4.2 Estrutura final na 3NF (Modelo Completo)

O modelo relacional normalizado até à 3NF é constituído por **7 tabelas**:

```text
1. CLIENTES (Email_Cliente [PK], Nome_Cliente)
2. CLIENTES_CONTATO (Email_Cliente [PK, FK], Telefone [PK])
3. HOTEIS (Nome_Hotel [PK], Cidade, Categoria, Gerente, Email_Gerente, Dept_Gerente)
4. QUARTOS (Quarto [PK], Nome_Hotel [FK])
5. RESERVAS (Num_Reserva [PK], Email_Cliente [FK])
6. RESERVA_QUARTOS (Num_Reserva [PK, FK], Quarto [PK, FK])
7. RESERVA_SERVICOS (Num_Reserva [PK, FK], Servico_Extra [PK])
```

#### Dicionário de Dados Técnico:

| Tabela | Atributos | Tipo de Dados | Chave Primária (PK) | Chave Estrangeira (FK) | Referência FK |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **`CLIENTES`** | `Email_Cliente`<br>`Nome_Cliente` | VARCHAR(100)<br>VARCHAR(100) | `Email_Cliente` | — | — |
| **`CLIENTES_CONTATO`** | `Email_Cliente`<br>`Telefone` | VARCHAR(100)<br>VARCHAR(20) | `(Email_Cliente, Telefone)` | `Email_Cliente` | `CLIENTES(Email_Cliente)` |
| **`HOTEIS`** | `Nome_Hotel`<br>`Cidade`<br>`Categoria`<br>`Gerente`<br>`Email_Gerente`<br>`Dept_Gerente` | VARCHAR(50)<br>VARCHAR(50)<br>VARCHAR(20)<br>VARCHAR(100)<br>VARCHAR(100)<br>VARCHAR(50) | `Nome_Hotel` | — | — |
| **`QUARTOS`** | `Quarto`<br>`Nome_Hotel` | INT<br>VARCHAR(50) | `Quarto` | `Nome_Hotel` | `HOTEIS(Nome_Hotel)` |
| **`RESERVAS`** | `Num_Reserva`<br>`Email_Cliente` | VARCHAR(10)<br>VARCHAR(100) | `Num_Reserva` | `Email_Cliente` | `CLIENTES(Email_Cliente)` |
| **`RESERVA_QUARTOS`** | `Num_Reserva`<br>`Quarto` | VARCHAR(10)<br>INT | `(Num_Reserva, Quarto)` | `Num_Reserva`<br>`Quarto` | `RESERVAS(Num_Reserva)`<br>`QUARTOS(Quarto)` |
| **`RESERVA_SERVICOS`** | `Num_Reserva`<br>`Servico_Extra` | VARCHAR(10)<br>VARCHAR(50) | `(Num_Reserva, Servico_Extra)` | `Num_Reserva` | `RESERVAS(Num_Reserva)` |

---

### 4.3 Documentar as decisões
* **Eliminação de Dependências Transitivas:** Dados de pessoas (`CLIENTES`), unidades hoteleiras (`HOTEIS`) e serviços são geridos de forma desacoplada da transação pontual de reserva.
* **Integridade e Desempenho:** A base de dados reduz o espaço de armazenamento consumido por repetições de texto e ganha rapidez em operações transacionais e atualizações pontuais.

---

## === TAREFA 5: VALIDAÇÃO E REFLEXÃO ===

### 5.1 Resolução dos problemas reportados pela equipa

1. **Problema 1 (Atualização de contactos do cliente em múltiplos registos):**  
   * *Resolução:* Os contactos estão isolados em `CLIENTES_CONTATO` por `Email_Cliente`. Quando o João Ferreira altera o seu número, altera-se apenas uma vez na sua ficha, refletindo-se automaticamente em todas as suas reservas passadas e futuras.
2. **Problema 2 (Inconsistência de email da gerente Ana Martins):**  
   * *Resolução:* O email do gerente reside exclusivamente na tabela `HOTEIS`. Havendo uma alteração de colaborador ou contacto, o `UPDATE` incide sobre uma única linha.
3. **Problema 3 (Impossibilidade de registar novos hotéis sem reservas associadas):**  
   * *Resolução:* Resolvida a anomalia de inserção. A tabela `HOTEIS` é independente e aceita a inserção de novos edifícios sem necessidade de existir qualquer registo na tabela `RESERVAS`.
4. **Problema 4 (Repetição da categoria e cidade em todas as reservas):**  
   * *Resolução:* Eliminada a redundância. Cidade e categoria são descritos apenas uma vez em `HOTEIS`.
5. **Problema 5 (Dificuldade em consultar hotéis de 5 estrelas ou gerentes de Operações):**  
   * *Resolução:* A resposta é obtida com queries SQL simples e imediatas:  
     `SELECT * FROM HOTEIS WHERE Categoria = '5 estrelas';`  
     `SELECT Gerente FROM HOTEIS WHERE Dept_Gerente = 'Operações';`
6. **Problema 6 (Inconsistência histórica em preços de quartos e serviços):**  
   * *Resolução:* O desacoplamento das tabelas de catálogo permite adicionar campos de preço contratado na tabela associativa (`RESERVA_QUARTOS`), congelando o valor no momento da reserva sem afetar o histórico.

---

### 5.2 Avaliação da necessidade de BCNF (Boyce-Codd)
O modelo final foi submetido à análise de BCNF:
* Uma relação está em BCNF se, para toda a dependência funcional $X \rightarrow Y$, $X$ for uma superchave.
* No modelo de 7 tabelas obtido:
  * Em `CLIENTES`: `Email_Cliente` é chave candidata/primária.
  * Em `HOTEIS`: `Nome_Hotel` é chave candidata/primária.
  * Em `QUARTOS`: `Quarto` é chave candidata/primária.
  * Em `RESERVAS`: `Num_Reserva` é chave candidata/primária.
  * Nas associativas, as chaves determinantes são as próprias chaves primárias compostas.
* **Conclusão:** Não existem determinantes funcionais que não sejam superchaves, nem chaves candidatas sobrepostas. Logo, **o modelo já cumpre integralmente os requisitos de BCNF**, não sendo necessária nenhuma decomposição adicional.

---

### 5.3 Análise crítica
* **Vantagens concretas para a SolMar Hotels:** Eliminação total de redundância, prevenção de erros humanos em atualizações, integridade referencial nativa com chaves estrangeiras (`FK`) e flexibilidade total para expandir o negócio.
* **Desafios e Trade-offs de Desempenho:**  
  Para extrair relatórios integrados (ex.: *"Todas as reservas de um cliente com detalhes dos hotéis e serviços"*), o motor de base de dados necessita de executar operações de junção (`INNER JOIN`) entre 6 tabelas (`RESERVAS`, `CLIENTES`, `RESERVA_QUARTOS`, `QUARTOS`, `HOTEIS`, `RESERVA_SERVICOS`).
* **Isto é um problema?**  
  Em sistemas transacionais relacionais (OLTP), **não é um problema**. Os motores de base de dados relacionais modernos utilizam índices baseados nas chaves primárias e estrangeiras, executando estas junções em milissegundos. A garantia de consistência e integridade dos dados supera em larga escala o custo marginal das junções. Se a empresa futuramente necessitar de relatórios analíticos massivos (Big Data / OLAP), poderá utilizar uma *View* desnormalizada ou um Data Warehouse à parte, mantendo o coração operacional perfeitamente normalizado.
