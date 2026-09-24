# Entity Relationship Diagram (ERD)
## Entidades
## Atributos
## Relacionamentos/Relações
## Cardinalidade das relações
## Participação nas relações
## Atributos das relações
## Entidades fracas
## Notações de ERD
- Notação de Chen (clássica)
- Notação Crow's Foot (pé de galinha)
- Notação UML

## APPS ÚTEIS

https://app.diagrams.net/

https://dbdiagram.io

https://miro.com

![alt IMG](10797_Chen_CrowsFoot_Example.png)

## 1. Modelo Relacional Conceitual Completo (ERD)

```mermaid
erDiagram
    CATEGORIA ||--o{ LIVRO : "classifica (1:N)"
    AUTOR ||--o{ LIVRO_AUTOR : "escreve (1:N)"
    LIVRO ||--o{ LIVRO_AUTOR : "possui (1:N)"
    CLIENTE ||--o{ ENCOMENDA : "realiza (1:N)"
    ENCOMENDA ||--o{ LINHA_ENCOMENDA : "composta_por (1:N)"
    LIVRO ||--o{ LINHA_ENCOMENDA : "incluido_em (1:N)"

    CATEGORIA {
        int ID_Categoria PK
        string Nome_Categoria
        string Descricao
    }

    LIVRO {
        string ISBN PK
        int FK_Categoria FK
        string Titulo
        int Ano_Publicacao
        decimal Preco
        int Num_Paginas
    }

    AUTOR {
        int ID_Autor PK
        string Nome_Completo
        string Nacionalidade
    }

    LIVRO_AUTOR {
        int PK_LivroAutor PK
        string FK_ISBN FK
        int FK_ID_Autor FK
    }

    ENCOMENDA {
        int ID_Encomenda PK
        string FK_Email_Cliente FK
        date Data_Encomenda
        string Estado
        decimal Valor_Total
    }

    LINHA_ENCOMENDA {
        int PK_EncomendaLivro PK
        int FK_ID_Encomenda FK
        string FK_ISBN FK
        int Quantidade
        decimal Preco_Unitario
    }

    CLIENTE {
        string Email PK
        string Nome
        string Telefone
        string Rua
        string Codigo_Postal
        string Cidade
        string Pais
    }
```

## 2. Conversão para Tabelas SQL (Prévia do Esquema Físico)

```mermaid
erDiagram
    CATEGORIA ||--o{ LIVRO : "1:N (FK ID_Categoria)"
    AUTOR ||--o{ LIVRO_AUTOR : "1:N (FK ID_Autor)"
    LIVRO ||--o{ LIVRO_AUTOR : "1:N (FK ISBN)"
    CLIENTE ||--o{ ENCOMENDA : "1:N (FK Email_Cliente)"
    ENCOMENDA ||--o{ LINHA_ENCOMENDA : "1:N (FK ID_Encomenda)"
    LIVRO ||--o{ LINHA_ENCOMENDA : "1:N (FK ISBN)"

    CATEGORIA {
        INT ID_Categoria PK
        VARCHAR Nome_Categoria
        TEXT Descricao
    }

    AUTOR {
        INT ID_Autor PK
        VARCHAR Nome_Completo
        VARCHAR Nacionalidade
    }

    LIVRO {
        VARCHAR ISBN PK
        VARCHAR Titulo
        INT Ano_Publicacao
        DECIMAL Preco
        INT Num_Paginas
        INT ID_Categoria FK "Chave Estrangeira"
    }

    CLIENTE {
        VARCHAR Email PK
        VARCHAR Nome
        VARCHAR Telefone
        VARCHAR Rua
        VARCHAR Codigo_Postal
        VARCHAR Cidade
        VARCHAR Pais
    }

    ENCOMENDA {
        INT ID_Encomenda PK
        DATETIME Data_Encomenda
        VARCHAR Estado
        DECIMAL Valor_Total
        VARCHAR Email_Cliente FK "Chave Estrangeira"
    }

    LIVRO_AUTOR {
        VARCHAR ISBN PK "PK Composta e FK -> LIVRO"
        INT ID_Autor PK "PK Composta e FK -> AUTOR"
    }

    LINHA_ENCOMENDA {
        INT ID_Encomenda PK "PK Composta e FK -> ENCOMENDA"
        VARCHAR ISBN PK "PK Composta e FK -> LIVRO"
        INT Quantidade
        DECIMAL Preco_Unitario
    }
```



# LINKS ÚTEIS 

https://www.geeksforgeeks.org/sql/cascade-in-sql/

https://www.geeksforgeeks.org/mysql/datetime-vs-timestamp-data-type-in-mysql/

https://lucid.co/pt/diagrama/entidade-relacionamento/tutorial?usecase=erd
