DROP TABLE IF EXISTS livros;

CREATE TABLE livros (
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo NVARCHAR(30) NOT NULL,
    autor NVARCHAR(30) NOT NULL,
    editora NVARCHAR(20) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    categoria NVARCHAR(20) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ativo BIT NOT NULL DEFAULT 1,
    data_adicao DATETIME DEFAULT GETDATE()
);

INSERT INTO livros (
    titulo, autor, editora, preco, stock, categoria, isbn, ativo
) VALUES (
    'A Sombra do Vento',
    'Carlos Ruiz Zafón',
    'Planeta',
    17.90,
    12,
    'Romance',
    '9788408172173',
    1
);

INSERT INTO livros (
    titulo, autor, editora, preco, stock, categoria, isbn, ativo
) VALUES (
    'Clean Code',
    'Robert C. Martin',
    'Prentice Hall',
    32.50,
    8,
    'Programação',
    '9780132350884',
    1
);

INSERT INTO livros (
    titulo, autor, editora, preco, stock, categoria, isbn, ativo
) VALUES (
    'SQL Para todos',
    'Ana Costa',
    'TechBooks',
    29.90,
    15,
    'Bases de dados',
    '9781234567890',
    1
);

INSERT INTO livros (
    titulo, autor, editora, preco, stock, categoria, isbn, ativo
) VALUES (
    'Python Avançado',
    'Pedro Santos',
    'CodePress',
    39.50,
    8,
    'Programação',
    '9781234567891',
    0
);

INSERT INTO livros (
    titulo, autor, editora, preco, stock, categoria, isbn, ativo
) VALUES (
    'Gestão de Projetos',
    'Maria Silva', 
    'GestãoPro', 
    24.90, 
    3, 
    'Gestão',
    '9781234567892', 
    1
);


-- Tarefa 1.1: CRUD na prática
-- 1: Mostrar todos os livros em stock bool 1 ativos
SELECT * FROM livros WHERE ativo = 1;

-- 2: Mostrar apenas dados principais de livros ativos
SELECT id, titulo, preco FROM livros WHERE ativo = 1;

-- 3: Mostrar com segurança o livro id 3
SELECT id, titulo, preco FROM livros WHERE id = 3;

-- 4: O Boss pediu pra aumentar o preço do SQL Para Todos para 32.90
UPDATE livros SET preco = 32.90 WHERE id = 3;

-- 5: O gestor pediu livros de Programação com stock < 10
SELECT titulo, autor, stock, preco 
FROM livros 
WHERE categoria = 'Programação' AND stock < 10;

-- PARTE 2: Construção de queries SQL
-- Tarefa 2.1 e 2.2 : CREATE Adicionar novo livro
INSERT INTO livros (titulo, autor, editora, preco, stock, categoria, isbn, ativo)
VALUES ('JavaScript Moderno', 'Carlos Ferreira', 'WebMaster', 34.90, 20,'Programação', '9781234567893', 1);

-- Tarefa 2.2 b: Livros de Programação com stock < 10
SELECT titulo, autor, stock, preco
FROM livros
WHERE categoria = 'Programação' AND stock < 10;
-- Confirmar que entrou na tabela:
SELECT * FROM livros WHERE isbn = '9781234567893';

--  READ CONSULTAR LIVROS ATIVOS 1 EM ORDEM ALFABETICA ORDER BY ASC
SELECT titulo, autor, preco, stock FROM livros WHERE ativo = 1 ORDER BY TITULO ASC;

-- 2.3 ALTERAR PREÇO DO LIVRO COM ID 3
UPDATE livros SET preco = 32.90 WHERE id = 3;
-- Tarefa 2.3 Atualizar Dados
-- MOSTRAR STOCK = 3
SELECT id, titulo, stock FROM livros WHERE id = 5;

-- UPDATE QUERY GESTAO DE PROJETOS
UPDATE livros SET stock = 0 WHERE id = 5

-- ATUALIZAR O STOCK
UPDATE livros
SET stock = 0
WHERE id = 5

-- O livro 'Python Avançado' foi descontinuado. Atualizar o seu estado para inativo (0), mantendo os dados no histórico
-- check seguro para confirmar tabela
SELECT id, titulo, ativo FROM LIVROS where id = 4

-- DESATIVAÇÃO SET ATIVO 0 e check id 4.
UPDATE livros
SET ativo = 0
WHERE id = 4

-- Tarefa 2.4: Inserir registo de teste
SELECT * FROM livros WHERE id = 99;
-- no results to display não tem id 99 no db
-- 0 rows affected pelo delete pois não existe id 99
DELETE FROM livros WHERE id = 99;

-- Tarefa 3.1: Boas práticas de verificação
-- Sempre rodar SELECT antes e depois do UPDATE para não fazer besteira no banco.
-- Feito nas tarefas anteriores com id 3, id 5 e id 4.

-- Tarefa 3.2: Análise de erros
-- Query 1: UPDATE livros SET preco = 50.00; CAOS TOTAL!
-- Não tem WHERE com id.
-- Muda o preço de todos os livros da loja pra 50 euros.
-- Correção: colocar WHERE id = X;

-- Query 2: DELETE FROM livros;
-- Não tem WHERE.
-- Apaga todos os registros da tabela de uma vez só.
-- Correção: colocar WHERE id = X ou usar UPDATE com ativo = 0.

-- Query 3: INSERT INTO livros (titulo, autor) VALUES ('Novo Livro', 'Autor Desconhecido');
-- Faltam os campos NOT NULL (editora, preco, stock, categoria, isbn).
-- O banco dá erro e recusa o insert porque esses campos não podem ser vazios.
-- Correção: preencher todos os campos obrigatórios no VALUES.

-- Tarefa 3.3: Reflexão

-- 1. Operação mais usada:
-- READ (SELECT). O cliente passa o dia pesquisando livro, navegando no site e vendo catálogo. Vende e cadastra bem menos do que consulta.

-- 2. Histórico de preços:
-- Afeta o UPDATE porque ele apaga o preço velho.
-- Para resolver, cria uma tabela de log/histórico e faz INSERT do preço antigo com a data da mudança toda vez que alterar.

-- 3. RGPD e exclusão de cliente:
-- O cliente pede DELETE, mas não dá pra apagar por causa da primary key amarrada nas faturas antigas e da lei fiscal de 10 anos.
-- Solução: UPDATE limpando os dados pessoais (nome 'anonimizado', email null) e ativo = 0. Mantém a integridade sem expor a pessoa.
