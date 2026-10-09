-- ============================================================================
-- UFCD 10797 — Bases de Dados
-- Sistema de Gestão Hoteleira (Hotel Atlântico)
-- Padrão Exato do Google Docs / Draw.io (SQL Server T-SQL)
-- ============================================================================

-- 1. Limpeza de tabelas antigas
DROP TABLE IF EXISTS reserva_quarto;
DROP TABLE IF EXISTS reserva;
DROP TABLE IF EXISTS quarto;
DROP TABLE IF EXISTS hospede;
GO

-- 2. Tabela HOSPEDE
CREATE TABLE hospede (
    id_hospede INT IDENTITY(1,1) PRIMARY KEY,
    nif VARCHAR(20) NULL UNIQUE,
    nome_completo NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(25) NULL,
    pais_origem NVARCHAR(50) NOT NULL,
    data_registo DATETIME DEFAULT GETDATE()
);
GO

-- 3. Tabela QUARTO
CREATE TABLE quarto (
    numero_quarto INT PRIMARY KEY,
    tipo NVARCHAR(20) NOT NULL,
    preco_noite DECIMAL(10,2) NOT NULL,
    capacidade_max INT NOT NULL,
    piso INT NOT NULL
);
GO

-- 4. Tabela RESERVA (Nomes id_hospede e estado_reserva iguais ao Google Docs)
CREATE TABLE reserva (
    id_reserva INT IDENTITY(1,1) PRIMARY KEY,
    id_hospede INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    num_pessoas INT NOT NULL,
    estado_reserva NVARCHAR(30) NOT NULL DEFAULT 'Confirmada',
    data_criacao DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_reserva_hospede FOREIGN KEY (id_hospede) REFERENCES hospede(id_hospede)
);
GO

-- 5. Tabela RESERVA_QUARTO
CREATE TABLE reserva_quarto (
    id_reserva INT NOT NULL,
    numero_quarto INT NOT NULL,
    preco_noite_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_reserva, numero_quarto),
    CONSTRAINT FK_rq_reserva FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
    CONSTRAINT FK_rq_quarto FOREIGN KEY (numero_quarto) REFERENCES quarto(numero_quarto)
);
GO

-- ============================================================================
-- 6. INSERÇÃO DOS DADOS DE TESTE
-- ============================================================================
INSERT INTO hospede (nif, nome_completo, email, telefone, pais_origem) VALUES
('123456789', 'André Rodrigues', 'andre.rodrigues@email.pt', '+351 912345678', 'Portugal'),
(NULL, 'Pierre Dubois', 'pierre.dubois@email.fr', '+33 612345678', 'França'),
('234567890', 'Maria Santos', 'maria.santos@email.pt', '+351 923456789', 'Portugal');

INSERT INTO quarto (numero_quarto, tipo, preco_noite, capacidade_max, piso) VALUES
(101, 'Individual', 50.00, 1, 1),
(102, 'Duplo', 80.00, 2, 1),
(201, 'Suite', 150.00, 4, 2),
(301, 'Suite', 180.00, 4, 3);

-- Reserva 1: André aluga 2 quartos (101 e 102)
INSERT INTO reserva (id_hospede, data_entrada, data_saida, num_pessoas, estado_reserva) VALUES
(1, '2026-10-01', '2026-10-05', 3, 'Confirmada');

INSERT INTO reserva_quarto (id_reserva, numero_quarto, preco_noite_unitario) VALUES
(1, 101, 50.00),
(1, 102, 80.00);

-- Reserva 2: Pierre Dubois aluga a Suite 201
INSERT INTO reserva (id_hospede, data_entrada, data_saida, num_pessoas, estado_reserva) VALUES
(2, '2026-10-10', '2026-10-15', 2, 'Check-in realizado');

INSERT INTO reserva_quarto (id_reserva, numero_quarto, preco_noite_unitario) VALUES
(2, 201, 150.00);
GO

-- ============================================================================
-- 7. EXIBIR DB (Para ver no Results assim que der Run)
-- ============================================================================
SELECT * FROM hospede;
SELECT * FROM quarto;
SELECT * FROM reserva;
SELECT * FROM reserva_quarto;

-- Relatório Consolidado das Reservas
SELECT 
    r.id_reserva AS [Nº Reserva],
    h.nome_completo AS [Hóspede Titular],
    h.pais_origem AS [País],
    r.data_entrada AS [Entrada],
    r.data_saida AS [Saída],
    q.numero_quarto AS [Quarto],
    q.tipo AS [Tipo],
    rq.preco_noite_unitario AS [Preço/Noite (€)],
    r.estado_reserva AS [Estado]
FROM reserva r
INNER JOIN hospede h ON r.id_hospede = h.id_hospede
INNER JOIN reserva_quarto rq ON r.id_reserva = rq.id_reserva
INNER JOIN quarto q ON rq.numero_quarto = q.numero_quarto;
GO