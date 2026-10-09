DROP TABLE IF EXISTS Entrega;
DROP TABLE IF EXISTS Veiculo;
DROP TABLE IF EXISTS Motorista;

-- 1. CRIAR TABELA MOTORISTA
CREATE TABLE Motorista (
    MotoristaID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Categoria CHAR(2),
    DataAdmissao DATE,
    Cidade VARCHAR(50)
);

-- 2. CRIAR TABELA VEICULO
CREATE TABLE Veiculo (
    VeiculoID INT PRIMARY KEY,
    Matricula CHAR(8),
    TipoVeiculo VARCHAR(50),
    Capacidade INT,
    MotoristaID INT,
    -- Chave estrangeira ligando ao Motorista
    FOREIGN KEY (MotoristaID) REFERENCES Motorista(MotoristaID)
);

-- 3. CRIAR TABELA ENTREGA
CREATE TABLE Entrega (
    EntregaID INT PRIMARY KEY,
    VeiculoID INT,
    DataEntrega DATE,
    Destino VARCHAR(50),
    CustoServico DECIMAL(10, 2)
);

-- INSERIR DADOS
INSERT INTO Motorista (MotoristaID, Nome, Categoria, DataAdmissao, Cidade) VALUES
(1, 'João Pereira', 'A', '2020-03-15', 'Lisboa'),
(2, 'Maria Santos', 'B', '2019-07-20', 'Porto'),
(3, 'Carlos Oliveira', 'A', '2021-01-10', 'Coimbra'),
(4, 'Sofia Rodrigues', 'C', '2018-11-05', 'Braga'),
(5, 'André Ferreira', 'A', '2022-05-12', 'Faro');

INSERT INTO Veiculo (VeiculoID, Matricula, TipoVeiculo, Capacidade, MotoristaID) VALUES
(101, 'AA-11-BB', 'Carrinha', 1000, 1),
(102, 'CC-22-DD', 'Camião', 5000, 2),
(103, 'EE-33-FF', 'Carrinha', 1200, 1),
(104, 'GG-44-HH', 'Camião', 4500, NULL),
(105, 'II-55-JJ', 'Furgão', 800, 3);

INSERT INTO Entrega (EntregaID, VeiculoID, DataEntrega, Destino, CustoServico) VALUES
(501, 101, '2025-01-15', 'Setúbal', 120.00),
(502, 102, '2025-01-16', 'Aveiro', 450.00),
(503, 101, '2025-01-17', 'Santarém', 95.00),
(504, 103, '2025-01-18', 'Leiria', 110.00),
(505, 105, '2025-01-19', 'Viseu', 200.00),
(506, 106, '2025-01-20', 'Évora', 180.00);

SELECT * FROM Motorista;
SELECT * FROM Veiculo;
SELECT * FROM Entrega;


/*
ATIVIDADE 5: JOINS, AGREGAÇÃO E ORDENAÇÃO
Nome do formando: André Luiz Sales Rodrigues
Data: 01/10/2026
*/

-- === TAREFA 1: INNER JOIN ===

-- 1.1.1 Query:
-- 1.1.2 Resultado:
SELECT v.Matricula, v.TipoVeiculo, m.Nome, m.Cidade
FROM Veiculo v
INNER JOIN Motorista m ON v.MotoristaID = m.MotoristaID;

-- 1.2.1 Query:
-- 1.2.2 Resultado:
SELECT e.EntregaID, e.DataEntrega, e.Destino, v.Matricula, m.Nome
FROM Entrega e
INNER JOIN Veiculo v ON e.VeiculoID = v.VeiculoID
INNER JOIN Motorista m ON v.MotoristaID = m.MotoristaID;


-- === TAREFA 2: LEFT JOIN ===

-- 2.1.1 Query:
-- 2.1.2 Resultado:
SELECT m.Nome, m.Categoria, v.Matricula, v.TipoVeiculo
FROM Motorista m
LEFT JOIN Veiculo v ON m.MotoristaID = v.MotoristaID;


-- === TAREFA 3: RIGHT JOIN ===

-- 3.1.1 Query:
-- 3.1.2 Resultado:
SELECT e.EntregaID, e.DataEntrega, e.Destino, e.CustoServico, v.Matricula
FROM Veiculo v
RIGHT JOIN Entrega e ON v.VeiculoID = e.VeiculoID;


-- === TAREFA 4: FULL JOIN ===

-- 4.1.1 Query:
-- 4.1.2 Resultado:
SELECT m.Nome, m.Categoria, v.Matricula, v.TipoVeiculo
FROM Motorista m
FULL JOIN Veiculo v ON m.MotoristaID = v.MotoristaID;


-- === TAREFA 5: ANÁLISE DE DADOS ===

-- 5.1.1 Query:
-- 5.1.2 Resultado:
SELECT m.Nome, m.Cidade
FROM Motorista m
LEFT JOIN Veiculo v ON m.MotoristaID = v.MotoristaID
WHERE v.VeiculoID IS NULL;
-- 5.1.3 Resposta à pergunta: São 2 motoristas sem veículo: a Sofia Rodrigues (Braga) e o André Ferreira (Faro).

-- 5.2.1 Query:
-- 5.2.2 Resultado:
SELECT v.Matricula, v.TipoVeiculo
FROM Veiculo v
WHERE v.MotoristaID IS NULL;
-- 5.2.3 Resposta à pergunta: Sim, o camião GG-44-HH. Dá para passar esse camião para a Sofia ou para o André, para o carro não ficar parado no pátio.

-- 5.3.1 Query:
-- 5.3.2 Resultado:
SELECT e.EntregaID, e.VeiculoID, e.Destino, e.DataEntrega, v.Matricula
FROM Entrega e
LEFT JOIN Veiculo v ON e.VeiculoID = v.VeiculoID
WHERE e.EntregaID = 506;
-- 5.3.3 Diagnóstico: A entrega 506 foi lançada com o veículo 106, só que esse 106 nem sequer existe na tabela de veículos.
-- 5.3.4 Possíveis causas: Engano de quem digitou o ID na hora da entrega, o veículo é novo e esqueceram de cadastrar antes, ou faltou uma chave estrangeira para barrar ID errado.