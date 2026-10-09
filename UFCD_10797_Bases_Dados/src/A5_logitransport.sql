-- ============================================================================
-- UFCD 10797 — Bases de Dados
-- ATIVIDADE 5: Exploração dos Dados Usando JOINS (LogiTransport)
-- Versão Oficial: Estrutura do Professor
-- ============================================================================

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

-- ============================================================================
-- POVOAMENTO DE DADOS (Oficial da Atividade 5)
-- ============================================================================

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
