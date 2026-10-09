CREATE TABLE produto (
    id_produto INT IDENTITY(1,1) CONSTRAINT PK_produtos PRIMARY KEY,
    nome_produto VARCHAR(30) NOT NULL,
    categoria VARCHAR(20),
    marca VARCHAR(20),
    preco DECIMAL(7, 2),
    stock INT DEFAULT 0,
    fornecedor VARCHAR(20),
    garantia_meses INT,
    lancamento DATE,
    descontinuado BIT DEFAULT 0
);

INSERT INTO produto (nome_produto, categoria, marca, preco, stock, fornecedor, garantia_meses, lancamento, descontinuado)
VALUES
('Portátil ProBook 450', 'Computadores', 'HP', 899.00, 15, 'TechDist', 24, '2025-03-15', 0),
('Monitor UltraWide 34"', 'Monitores', 'LG', 450.00, 8, 'DisplayPro', 36, '2025-01-20', 0),
('Teclado Mecânico RGB', 'Periféricos', 'Logitech', 89.90, 45, 'PerifShop', 12, '2024-11-10', 0),
('Rato Ergonómico MX', 'Periféricos', 'Logitech', 79.90, 52, 'PerifShop', 12, '2025-02-05', 0),
('Portátil Gaming Legion', 'Computadores', 'Lenovo', 1299.00, 5, 'TechDist', 24, '2025-05-12', 0),
('Webcam HD Pro', 'Periféricos', 'Logitech', 120.00, 0, 'PerifShop', 24, '2024-08-20', 1),
('Impressora LaserJet', 'Impressoras', 'HP', 320.00, 12, 'PrintSupply', 12, '2025-04-01', 0),
('Monitor Gamer 27"', 'Monitores', 'ASUS', 380.00, 18, 'DisplayPro', 36, '2025-06-15', 0),
('Disco SSD 1TB', 'Armazenamento', 'Samsung', 95.00, 67, 'StorageHub', 60, '2025-02-28', 0),
('Router WiFi 6', 'Redes', 'TP-Link', 65.00, 30, 'NetWorkShop', 24, '2025-03-10', 0),
('Tablet Pro 11"', 'Tablets', 'Samsung', 599.00, 9, 'MobileTech', 24, '2025-07-01', 0),
('Auriculares Bluetooth', 'Periféricos', 'Sony', 150.00, 23, 'AudioCenter', 12, '2025-01-15', 0),
('Portátil MacBook Air', 'Computadores', 'Apple', 1199.00, 7, 'AppleStore PT', 12, '2025-08-20', 0),
('Cadeira Ergonómica Pro', 'Mobiliário', 'Herman', 450.00, 4, 'OfficeComfort', 60, '2024-12-05', 0),
('Hub USB-C 7 Portas', 'Periféricos', 'Anker', 45.00, 88, 'PerifShop', 18, '2025-04-18', 0);

SELECT * FROM produto;


  /*
    ATIVIDADE 4: QUERIES SIMPLES
    Nome do formando: André Luiz Sales Rodrigues
    Data: 28/09/2026
    */

    -- === TAREFA 1: CONSULTAS SIMPLES ===
    -- 1.1 Query:
    SELECT nome_produto
    FROM produto;
    -- 1.2 Explicação: Seleção simples tabela produto por nome_produto
    -- === TAREFA 3: FILTRO COM OPERADOR DE COMPARAÇÃO ===
    -- 2.1 Query:
    SELECT nome_produto, marca, preco
    FROM produto
    WHERE preco > 500;
    -- 2.2 Explicação: Tabela produto, colunas nome_produto, marca, preco operador WHERE para filtrar preco maior do que 500
    -- === TAREFA 3: MÚLTIPLAS CONDIÇÕES COM AND ===
    -- 3.1 Query:
    SELECT nome_produto, categoria, marca, stock
    FROM produto
    WHERE marca = 'Logitech' AND stock > 40;
    -- 3.2 Explicação: Inclusåo do WHERE e operador logico AND e garantir de ambas as condicoes sejam verdadeiras a marca tem de ser 'Logitech'e o valor da coluna superior a 40.

    -- === Tarefa 4: Condições Alternativas com OR === 
    -- 4.1 Query:
    SELECT nome_produto, fornecedor, preco
    FROM produto
    WHERE fornecedor = 'TechDist' OR fornecedor = 'DisplayPro';
    -- 4.2 Explicação: Seleciona nome_produto, fornecedor e preco. e retorna valor retornando uma das condições ex TechDist ou DisplayPro

    -- === Tarefa 5: Operador IN ===
    -- 5.1 Query:
    SELECT nome_produto, categoria, preco
    FROM produto
    WHERE categoria IN ('Computadores', 'Tablets', 'Monitores');
    -- 5.2 Explicação:

    -- === Tarefa 6: Operador BETWEEN === 
    -- 6.1 Query:
    SELECT nome_produto, preco, categoria
    FROM produto
    WHERE preco BETWEEN 50.00 AND 100.00
    -- 6.2 Explicação: Define um range na tabela preco entre valor 50 a 100 filtro de valor.

    -- === Tarefa 6: Condições Alternativas com OR === 
