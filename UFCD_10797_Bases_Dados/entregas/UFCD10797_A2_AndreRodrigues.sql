-- ============================================================================
-- UFCD 10797 — Bases de Dados
-- Atividade 2: Modelação do Sistema Hoteleiro (Hotel Atlântico)
-- Formando: André Luiz Sales Rodrigues
-- Base de Dados: T-SQL / Azure SQL Edge / SQL Server
-- ============================================================================

-- 0. Limpeza prévia caso as tabelas já existam (ordem inversa das dependências)
DROP TABLE IF EXISTS reserva_quarto;
DROP TABLE IF EXISTS reserva;
DROP TABLE IF EXISTS quarto;
DROP TABLE IF EXISTS hospede;
GO

-- 1. Tabela HOSPEDE
CREATE TABLE hospede (
    id_hospede INT IDENTITY(1,1) PRIMARY KEY,
    nif VARCHAR(20) NOT NULL UNIQUE,
    nome_completo NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(25) NOT NULL,
    pais_origem NVARCHAR(50) NOT NULL,
    data_registo DATETIME DEFAULT GETDATE()
);
GO

-- 2. Tabela QUARTO
CREATE TABLE quarto (
    numero_quarto INT PRIMARY KEY,
    tipo NVARCHAR(20) NOT NULL CHECK (tipo IN ('Individual', 'Duplo', 'Suite')),
    preco_noite DECIMAL(10,2) NOT NULL CHECK (preco_noite > 0),
    capacidade_max INT NOT NULL CHECK (capacidade_max > 0),
    piso INT NOT NULL
);
GO

-- 3. Tabela RESERVA
CREATE TABLE reserva (
    id_reserva INT IDENTITY(1,1) PRIMARY KEY,
    id_hospede_titular INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    num_pessoas INT NOT NULL CHECK (num_pessoas > 0),
    estado NVARCHAR(30) NOT NULL DEFAULT 'Confirmada' 
        CHECK (estado IN ('Confirmada', 'Check-in realizado', 'Check-out realizado', 'Cancelada')),
    data_criacao DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_reserva_hospede FOREIGN KEY (id_hospede_titular) 
        REFERENCES hospede(id_hospede) ON DELETE NO ACTION,
    CONSTRAINT CK_datas_reserva CHECK (data_saida > data_entrada)
);
GO

-- 4. Tabela Associativa RESERVA_QUARTO (Relação N:M entre Reserva e Quarto)
CREATE TABLE reserva_quarto (
    id_reserva INT NOT NULL,
    numero_quarto INT NOT NULL,
    preco_unitario_noite DECIMAL(10,2) NOT NULL, -- Preserva histórico tarifário
    PRIMARY KEY (id_reserva, numero_quarto),
    CONSTRAINT FK_rq_reserva FOREIGN KEY (id_reserva) 
        REFERENCES reserva(id_reserva) ON DELETE CASCADE,
    CONSTRAINT FK_rq_quarto FOREIGN KEY (numero_quarto) 
        REFERENCES quarto(numero_quarto) ON DELETE NO ACTION
);
GO

-- ============================================================================
-- POVOAMENTO COM DADOS DE TESTE (Cenário do Enunciado)
-- ============================================================================

INSERT INTO hospede (nif, nome_completo, email, telefone, pais_origem) VALUES
('123456789', 'Carlos Ruiz Silva', 'carlos.silva@email.pt', '+351 912345678', 'Portugal'),
('987654321', 'Marie Laurent', 'marie.laurent@france.fr', '+33 612345678', 'França'),
('234567890', 'John Smith', 'john.smith@uk.co.uk', '+44 712345678', 'Reino Unido');

INSERT INTO quarto (numero_quarto, tipo, preco_noite, capacidade_max, piso) VALUES
(101, 'Individual', 55.00, 1, 1),
(102, 'Duplo', 85.00, 2, 1),
(201, 'Duplo', 90.00, 2, 2),
(202, 'Suite', 160.00, 4, 2),
(301, 'Suite', 180.00, 4, 3);

-- Reserva 1: Carlos Silva reserva 2 quartos (família com 4 pessoas)
INSERT INTO reserva (id_hospede_titular, data_entrada, data_saida, num_pessoas, estado) VALUES
(1, '2026-10-01', '2026-10-05', 4, 'Confirmada');

INSERT INTO reserva_quarto (id_reserva, numero_quarto, preco_unitario_noite) VALUES
(1, 102, 85.00),
(1, 201, 90.00);

-- Reserva 2: Marie Laurent reserva 1 Suite
INSERT INTO reserva (id_hospede_titular, data_entrada, data_saida, num_pessoas, estado) VALUES
(2, '2026-10-10', '2026-10-15', 2, 'Check-in realizado');

INSERT INTO reserva_quarto (id_reserva, numero_quarto, preco_unitario_noite) VALUES
(2, 202, 160.00);

GO

-- ============================================================================
-- QUERIES DE VALIDAÇÃO (Respostas da PARTE D)
-- ============================================================================

-- 1. Saber todas as reservas que um determinado hóspede já fez
SELECT 
    h.nome_completo,
    r.id_reserva,
    r.data_entrada,
    r.data_saida,
    r.num_pessoas,
    r.estado
FROM reserva r
INNER JOIN hospede h ON r.id_hospede_titular = h.id_hospede
WHERE h.nif = '123456789';

-- 2. Saber que quartos estão incluídos numa reserva específica (ex: Reserva 1)
SELECT 
    rq.id_reserva,
    q.numero_quarto,
    q.tipo,
    q.piso,
    rq.preco_unitario_noite
FROM reserva_quarto rq
INNER JOIN quarto q ON rq.numero_quarto = q.numero_quarto
WHERE rq.id_reserva = 1;

-- 3. Listar todos os quartos do tipo "Suite"
SELECT 
    numero_quarto,
    tipo,
    preco_noite,
    capacidade_max,
    piso
FROM quarto
WHERE tipo = 'Suite';

-- 4. Cálculo do valor total estimado de uma reserva
SELECT 
    r.id_reserva,
    h.nome_completo,
    DATEDIFF(day, r.data_entrada, r.data_saida) AS total_noites,
    SUM(rq.preco_unitario_noite) * DATEDIFF(day, r.data_entrada, r.data_saida) AS valor_total_estadia
FROM reserva r
INNER JOIN hospede h ON r.id_hospede_titular = h.id_hospede
INNER JOIN reserva_quarto rq ON r.id_reserva = rq.id_reserva
GROUP BY r.id_reserva, h.nome_completo, r.data_entrada, r.data_saida;
