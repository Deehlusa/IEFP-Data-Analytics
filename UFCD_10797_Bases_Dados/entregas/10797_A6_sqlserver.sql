-- =======================================
--   CRIAÇÃO DA BASE DE DADOS LIBROMUNDO
-- =======================================

-- Eliminar tabelas se já existirem (para permitir reexecução)

DROP TABLE IF EXISTS ITEM_ENCOMENDA;
DROP TABLE IF EXISTS ENCOMENDA;
DROP TABLE IF EXISTS LIVRO;
DROP TABLE IF EXISTS CLIENTE;

-- =================
--   TABELA: LIVRO
-- =================
CREATE TABLE LIVRO (
    livro_id INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    ano_publicacao INT,
    editora VARCHAR(100)
);

-- ===================
--   TABELA: CLIENTE
-- ===================
CREATE TABLE CLIENTE (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cidade VARCHAR(50),
    data_registo DATE NOT NULL,
    nivel_fidelidade VARCHAR(20)
);

-- =====================
--   TABELA: ENCOMENDA
-- =====================
CREATE TABLE ENCOMENDA (
    encomenda_id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_encomenda DATE NOT NULL,
    valor_total DECIMAL(8,2) NOT NULL,
    estado VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id)
);

-- ===========================
--   TABELA: ITEM_ENCOMENDA
-- ===========================
CREATE TABLE ITEM_ENCOMENDA (
    item_id INT PRIMARY KEY,
    encomenda_id INT NOT NULL,
    livro_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (encomenda_id) REFERENCES ENCOMENDA(encomenda_id),
    FOREIGN KEY (livro_id) REFERENCES LIVRO(livro_id)
);

-- ============================
--   INSERÇÃO DE DADOS: LIVRO
-- ============================

-- Categoria: Romance (preço médio: ~15€)
INSERT INTO LIVRO VALUES (1, 'O Amor nos Tempos do Cólera', 'Gabriel García Márquez', 'Romance', 16.90, 1985, 'Dom Quixote');
INSERT INTO LIVRO VALUES (2, 'Orgulho e Preconceito', 'Jane Austen', 'Romance', 12.50, 1813, 'Penguin Classics');
INSERT INTO LIVRO VALUES (3, 'A Sombra do Vento', 'Carlos Ruiz Zafón', 'Romance', 17.95, 2001, 'Presença');
INSERT INTO LIVRO VALUES (4, 'Norwegian Wood', 'Haruki Murakami', 'Romance', 15.90, 1987, 'Alfaguara');
INSERT INTO LIVRO VALUES (5, 'Anna Karenina', 'Liev Tolstói', 'Romance', 19.90, 1877, 'Porto Editora');
INSERT INTO LIVRO VALUES (6, 'Brooklyn', 'Colm Tóibín', 'Romance', 14.50, 2009, 'ASA');
INSERT INTO LIVRO VALUES (7, 'A Culpa é das Estrelas', 'John Green', 'Romance', 13.90, 2012, 'Intrinseca');

-- Categoria: Ficção Científica (preço médio: ~24€ - ACIMA DA MÉDIA GERAL)
INSERT INTO LIVRO VALUES (8, 'Dune', 'Frank Herbert', 'Ficção Científica', 22.90, 1965, 'Saída de Emergência');
INSERT INTO LIVRO VALUES (9, 'Fundação', 'Isaac Asimov', 'Ficção Científica', 18.50, 1951, 'Aleph');
INSERT INTO LIVRO VALUES (10, 'Neuromancer', 'William Gibson', 'Ficção Científica', 21.90, 1984, 'Ace Books');
INSERT INTO LIVRO VALUES (11, 'O Jogo do Exterminador', 'Orson Scott Card', 'Ficção Científica', 19.90, 1985, 'Saída de Emergência');
INSERT INTO LIVRO VALUES (12, 'Guia do Mochileiro das Galáxias', 'Douglas Adams', 'Ficção Científica', 16.90, 1979, 'Dom Quixote');
INSERT INTO LIVRO VALUES (13, 'A Máquina do Tempo', 'H.G. Wells', 'Ficção Científica', 24.50, 1895, 'Relógio D Água');
INSERT INTO LIVRO VALUES (14, 'Projeto Hail Mary', 'Andy Weir', 'Ficção Científica', 21.90, 2021, 'Presença');
INSERT INTO LIVRO VALUES (15, 'Solaris', 'Stanisław Lem', 'Ficção Científica', 23.90, 1961, 'Faber & Faber');
INSERT INTO LIVRO VALUES (16, 'Snow Crash', 'Neal Stephenson', 'Ficção Científica', 26.50, 1992, 'Bantam Books');

-- Categoria: Policial (preço médio: ~16€)
INSERT INTO LIVRO VALUES (17, 'Assassinato no Expresso do Oriente', 'Agatha Christie', 'Policial', 14.90, 1934, 'ASA');
INSERT INTO LIVRO VALUES (18, 'A Rapariga no Comboio', 'Paula Hawkins', 'Policial', 16.90, 2015, 'Presença');
INSERT INTO LIVRO VALUES (19, 'Gone Girl', 'Gillian Flynn', 'Policial', 17.50, 2012, 'Planeta');
INSERT INTO LIVRO VALUES (20, 'O Silêncio dos Inocentes', 'Thomas Harris', 'Policial', 15.90, 1988, 'Gradiva');
INSERT INTO LIVRO VALUES (21, 'A Mulher na Janela', 'A.J. Finn', 'Policial', 16.50, 2018, 'Bertrand');
INSERT INTO LIVRO VALUES (22, 'Big Little Lies', 'Liane Moriarty', 'Policial', 15.90, 2014, 'Penguin');

-- Categoria: Tecnologia (preço médio: ~29€ - ACIMA DA MÉDIA GERAL)
INSERT INTO LIVRO VALUES (23, 'Clean Code', 'Robert C. Martin', 'Tecnologia', 45.90, 2008, 'Prentice Hall');
INSERT INTO LIVRO VALUES (24, 'The Pragmatic Programmer', 'David Thomas', 'Tecnologia', 42.50, 1999, 'Addison-Wesley');
INSERT INTO LIVRO VALUES (25, 'Python Crash Course', 'Eric Matthes', 'Tecnologia', 38.90, 2015, 'No Starch Press');
INSERT INTO LIVRO VALUES (26, 'Eloquent JavaScript', 'Marijn Haverbeke', 'Tecnologia', 32.90, 2011, 'No Starch Press');
INSERT INTO LIVRO VALUES (27, 'Design Patterns', 'Erich Gamma', 'Tecnologia', 52.90, 1994, 'Addison-Wesley');
INSERT INTO LIVRO VALUES (28, 'Introduction to Algorithms', 'Thomas Cormen', 'Tecnologia', 65.00, 1990, 'MIT Press');
INSERT INTO LIVRO VALUES (29, 'The Art of Computer Programming Vol. 1', 'Donald Knuth', 'Tecnologia', 58.50, 1968, 'Addison-Wesley');
INSERT INTO LIVRO VALUES (30, 'Database System Concepts', 'Abraham Silberschatz', 'Tecnologia', 55.00, 1986, 'McGraw-Hill');

-- Categoria: Biografia (preço médio: ~18€)
INSERT INTO LIVRO VALUES (31, 'Steve Jobs', 'Walter Isaacson', 'Biografia', 21.90, 2011, 'Bertrand');
INSERT INTO LIVRO VALUES (32, 'Educated', 'Tara Westover', 'Biografia', 17.50, 2018, 'Random House');
INSERT INTO LIVRO VALUES (33, 'Long Walk to Freedom', 'Nelson Mandela', 'Biografia', 19.90, 1994, 'Little Brown');
INSERT INTO LIVRO VALUES (34, 'Becoming', 'Michelle Obama', 'Biografia', 22.50, 2018, 'Crown');
INSERT INTO LIVRO VALUES (35, 'Elon Musk', 'Ashlee Vance', 'Biografia', 18.90, 2015, 'Virgin Books');
INSERT INTO LIVRO VALUES (36, 'The Diary of a Young Girl', 'Anne Frank', 'Biografia', 12.90, 1947, 'Contact Publishing');

-- Categoria: Arte e Fotografia (preço médio: ~33€ - MUITO ACIMA DA MÉDIA GERAL)
INSERT INTO LIVRO VALUES (37, 'The Art Book', 'Phaidon Editors', 'Arte e Fotografia', 42.90, 1994, 'Phaidon');
INSERT INTO LIVRO VALUES (38, 'Ways of Seeing', 'John Berger', 'Arte e Fotografia', 18.50, 1972, 'Penguin');
INSERT INTO LIVRO VALUES (39, 'National Geographic: The Photographs', 'National Geographic', 'Arte e Fotografia', 55.00, 2008, 'National Geographic');
INSERT INTO LIVRO VALUES (40, 'Magnum Contact Sheets', 'Kristen Lubben', 'Arte e Fotografia', 48.90, 2011, 'Thames & Hudson');
INSERT INTO LIVRO VALUES (41, 'The Complete Works of Leonardo da Vinci', 'Leonardo da Vinci', 'Arte e Fotografia', 68.00, 2006, 'Taschen');
INSERT INTO LIVRO VALUES (42, 'Sebastião Salgado: Genesis', 'Sebastião Salgado', 'Arte e Fotografia', 75.00, 2013, 'Taschen');

-- Categoria: História (preço médio: ~20€)
INSERT INTO LIVRO VALUES (43, 'Sapiens', 'Yuval Noah Harari', 'História', 19.90, 2011, 'Elsinore');
INSERT INTO LIVRO VALUES (44, 'Homo Deus', 'Yuval Noah Harari', 'História', 21.50, 2015, 'Elsinore');
INSERT INTO LIVRO VALUES (45, 'Guns, Germs, and Steel', 'Jared Diamond', 'História', 22.90, 1997, 'Norton');
INSERT INTO LIVRO VALUES (46, 'The Silk Roads', 'Peter Frankopan', 'História', 24.50, 2015, 'Bloomsbury');
INSERT INTO LIVRO VALUES (47, 'A People s History of the United States', 'Howard Zinn', 'História', 18.90, 1980, 'Harper');
INSERT INTO LIVRO VALUES (48, 'SPQR: A History of Ancient Rome', 'Mary Beard', 'História', 23.90, 2015, 'Profile Books');

-- Categoria: Infantil (preço médio: ~11€ - ABAIXO DA MÉDIA GERAL)
INSERT INTO LIVRO VALUES (49, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Infantil', 14.90, 1997, 'Presença');
INSERT INTO LIVRO VALUES (50, 'O Principezinho', 'Antoine de Saint-Exupéry', 'Infantil', 9.90, 1943, 'Kalandraka');
INSERT INTO LIVRO VALUES (51, 'Where the Wild Things Are', 'Maurice Sendak', 'Infantil', 12.50, 1963, 'Harper Collins');
INSERT INTO LIVRO VALUES (52, 'Charlotte s Web', 'E.B. White', 'Infantil', 10.90, 1952, 'Harper Collins');
INSERT INTO LIVRO VALUES (53, 'The Gruffalo', 'Julia Donaldson', 'Infantil', 8.90, 1999, 'Macmillan');
INSERT INTO LIVRO VALUES (54, 'Matilda', 'Roald Dahl', 'Infantil', 11.50, 1988, 'Puffin');
INSERT INTO LIVRO VALUES (55, 'The Very Hungry Caterpillar', 'Eric Carle', 'Infantil', 7.90, 1969, 'Philomel');

-- ==============================
--   INSERÇÃO DE DADOS: CLIENTE
-- ==============================

-- Clientes ativos (com encomendas)
INSERT INTO CLIENTE VALUES (1, 'Ana Silva', 'ana.silva@email.pt', 'Lisboa', '2020-03-15', 'Ouro');
INSERT INTO CLIENTE VALUES (2, 'Bruno Costa', 'bruno.costa@email.pt', 'Porto', '2021-06-22', 'Prata');
INSERT INTO CLIENTE VALUES (3, 'Carla Mendes', 'carla.mendes@email.pt', 'Braga', '2022-01-10', 'Bronze');
INSERT INTO CLIENTE VALUES (4, 'Daniel Oliveira', 'daniel.oliveira@email.pt', 'Coimbra', '2020-11-05', 'Ouro');
INSERT INTO CLIENTE VALUES (5, 'Eva Santos', 'eva.santos@email.pt', 'Faro', '2023-02-14', 'Bronze');
INSERT INTO CLIENTE VALUES (6, 'Fernando Rodrigues', 'fernando.rodrigues@email.pt', 'Lisboa', '2021-09-30', 'Prata');
INSERT INTO CLIENTE VALUES (7, 'Gabriela Pereira', 'gabriela.pereira@email.pt', 'Aveiro', '2022-07-18', 'Bronze');
INSERT INTO CLIENTE VALUES (8, 'Hugo Ferreira', 'hugo.ferreira@email.pt', 'Setúbal', '2020-05-20', 'Ouro');
INSERT INTO CLIENTE VALUES (9, 'Inês Marques', 'ines.marques@email.pt', 'Viseu', '2023-04-12', 'Bronze');
INSERT INTO CLIENTE VALUES (10, 'João Almeida', 'joao.almeida@email.pt', 'Porto', '2021-12-03', 'Prata');

-- Clientes inativos (SEM encomendas - para testar NOT IN/NOT EXISTS)
INSERT INTO CLIENTE VALUES (11, 'Laura Cardoso', 'laura.cardoso@email.pt', 'Lisboa', '2024-01-15', 'Bronze');
INSERT INTO CLIENTE VALUES (12, 'Miguel Teixeira', 'miguel.teixeira@email.pt', 'Funchal', '2023-11-20', 'Bronze');
INSERT INTO CLIENTE VALUES (13, 'Nádia Sousa', 'nadia.sousa@email.pt', 'Ponta Delgada', '2024-02-28', 'Bronze');
INSERT INTO CLIENTE VALUES (14, 'Orlando Ribeiro', 'orlando.ribeiro@email.pt', 'Évora', '2023-08-10', 'Bronze');
INSERT INTO CLIENTE VALUES (15, 'Paula Gonçalves', 'paula.goncalves@email.pt', 'Bragança', '2024-03-05', 'Bronze');

-- ================================
--   INSERÇÃO DE DADOS: ENCOMENDA
-- ================================

-- Encomendas de Ana Silva (cliente_id=1) - Cliente VIP com múltiplas encomendas
INSERT INTO ENCOMENDA VALUES (1, 1, '2024-01-15', 156.80, 'Entregue');
INSERT INTO ENCOMENDA VALUES (2, 1, '2024-03-22', 89.70, 'Entregue');
INSERT INTO ENCOMENDA VALUES (3, 1, '2024-06-10', 245.50, 'Entregue'); -- Maior encomenda de Ana
INSERT INTO ENCOMENDA VALUES (4, 1, '2024-09-05', 132.40, 'Entregue');

-- Encomendas de Bruno Costa (cliente_id=2)
INSERT INTO ENCOMENDA VALUES (5, 2, '2024-02-14', 65.80, 'Entregue');
INSERT INTO ENCOMENDA VALUES (6, 2, '2024-07-20', 198.90, 'Entregue'); -- Maior encomenda de Bruno
INSERT INTO ENCOMENDA VALUES (7, 2, '2024-10-12', 45.80, 'Em Processamento');

-- Encomendas de Carla Mendes (cliente_id=3)
INSERT INTO ENCOMENDA VALUES (8, 3, '2024-03-05', 78.40, 'Entregue');
INSERT INTO ENCOMENDA VALUES (9, 3, '2024-08-18', 124.60, 'Entregue'); -- Maior encomenda de Carla

-- Encomendas de Daniel Oliveira (cliente_id=4) - Cliente tecnologia
INSERT INTO ENCOMENDA VALUES (10, 4, '2024-01-20', 318.70, 'Entregue'); -- Maior encomenda de Daniel
INSERT INTO ENCOMENDA VALUES (11, 4, '2024-05-15', 187.90, 'Entregue');
INSERT INTO ENCOMENDA VALUES (12, 4, '2024-11-02', 98.80, 'Enviado');

-- Encomendas de Eva Santos (cliente_id=5)
INSERT INTO ENCOMENDA VALUES (13, 5, '2024-04-08', 42.80, 'Entregue');
INSERT INTO ENCOMENDA VALUES (14, 5, '2024-10-25', 56.70, 'Em Processamento'); -- Maior encomenda de Eva

-- Encomendas de Fernando Rodrigues (cliente_id=6)
INSERT INTO ENCOMENDA VALUES (15, 6, '2024-02-28', 167.50, 'Entregue'); -- Maior encomenda de Fernando
INSERT INTO ENCOMENDA VALUES (16, 6, '2024-09-14', 89.90, 'Entregue');

-- Encomendas de Gabriela Pereira (cliente_id=7) - Fã de Romance
INSERT INTO ENCOMENDA VALUES (17, 7, '2024-03-12', 91.30, 'Entregue');
INSERT INTO ENCOMENDA VALUES (18, 7, '2024-07-07', 134.80, 'Entregue'); -- Maior encomenda de Gabriela
INSERT INTO ENCOMENDA VALUES (19, 7, '2024-11-20', 67.50, 'Enviado');

-- Encomendas de Hugo Ferreira (cliente_id=8) - Cliente História
INSERT INTO ENCOMENDA VALUES (20, 8, '2024-01-25', 156.30, 'Entregue');
INSERT INTO ENCOMENDA VALUES (21, 8, '2024-06-15', 223.70, 'Entregue'); -- Maior encomenda de Hugo
INSERT INTO ENCOMENDA VALUES (22, 8, '2024-10-30', 98.40, 'Em Processamento');

-- Encomendas de Inês Marques (cliente_id=9)
INSERT INTO ENCOMENDA VALUES (23, 9, '2024-05-22', 73.80, 'Entregue'); -- Maior (e única) encomenda de Inês

-- Encomendas de João Almeida (cliente_id=10) - Mix de categorias
INSERT INTO ENCOMENDA VALUES (24, 10, '2024-02-10', 112.40, 'Entregue');
INSERT INTO ENCOMENDA VALUES (25, 10, '2024-08-05', 189.60, 'Entregue'); -- Maior encomenda de João

-- =====================================
--   INSERÇÃO DE DADOS: ITEM_ENCOMENDA
-- =====================================

-- Encomenda 1 (Ana Silva) - Mix Romance + Ficção Científica
INSERT INTO ITEM_ENCOMENDA VALUES (1, 1, 1, 2, 16.90);  -- O Amor nos Tempos do Cólera x2
INSERT INTO ITEM_ENCOMENDA VALUES (2, 1, 8, 1, 22.90);  -- Dune
INSERT INTO ITEM_ENCOMENDA VALUES (3, 1, 3, 3, 17.95);  -- A Sombra do Vento x3
INSERT INTO ITEM_ENCOMENDA VALUES (4, 1, 12, 2, 16.90); -- Guia do Mochileiro x2

-- Encomenda 2 (Ana Silva) - Romance
INSERT INTO ITEM_ENCOMENDA VALUES (5, 2, 2, 1, 12.50);
INSERT INTO ITEM_ENCOMENDA VALUES (6, 2, 4, 2, 15.90);
INSERT INTO ITEM_ENCOMENDA VALUES (7, 2, 6, 3, 14.50);

-- Encomenda 3 (Ana Silva) - Ficção Científica + Tecnologia
INSERT INTO ITEM_ENCOMENDA VALUES (8, 3, 14, 2, 21.90); -- Projeto Hail Mary x2
INSERT INTO ITEM_ENCOMENDA VALUES (9, 3, 15, 1, 23.90); -- Solaris
INSERT INTO ITEM_ENCOMENDA VALUES (10, 3, 16, 2, 26.50); -- Snow Crash x2
INSERT INTO ITEM_ENCOMENDA VALUES (11, 3, 23, 3, 45.90); -- Clean Code x3

-- Encomenda 4 (Ana Silva) - História
INSERT INTO ITEM_ENCOMENDA VALUES (12, 4, 43, 2, 19.90); -- Sapiens x2
INSERT INTO ITEM_ENCOMENDA VALUES (13, 4, 44, 1, 21.50); -- Homo Deus
INSERT INTO ITEM_ENCOMENDA VALUES (14, 4, 45, 2, 22.90); -- Guns, Germs x2
INSERT INTO ITEM_ENCOMENDA VALUES (15, 4, 46, 1, 24.50); -- Silk Roads

-- Encomenda 5 (Bruno Costa) - Policial
INSERT INTO ITEM_ENCOMENDA VALUES (16, 5, 17, 1, 14.90);
INSERT INTO ITEM_ENCOMENDA VALUES (17, 5, 18, 2, 16.90);
INSERT INTO ITEM_ENCOMENDA VALUES (18, 5, 19, 1, 17.50);

-- Encomenda 6 (Bruno Costa) - Tecnologia
INSERT INTO ITEM_ENCOMENDA VALUES (19, 6, 24, 1, 42.50);
INSERT INTO ITEM_ENCOMENDA VALUES (20, 6, 25, 2, 38.90);
INSERT INTO ITEM_ENCOMENDA VALUES (21, 6, 26, 1, 32.90);
INSERT INTO ITEM_ENCOMENDA VALUES (22, 6, 23, 1, 45.90);

-- Encomenda 7 (Bruno Costa) - Infantil
INSERT INTO ITEM_ENCOMENDA VALUES (23, 7, 49, 1, 14.90);
INSERT INTO ITEM_ENCOMENDA VALUES (24, 7, 50, 2, 9.90);
INSERT INTO ITEM_ENCOMENDA VALUES (25, 7, 54, 1, 11.50);

-- Encomenda 8 (Carla Mendes) - Romance + Policial
INSERT INTO ITEM_ENCOMENDA VALUES (26, 8, 1, 1, 16.90);
INSERT INTO ITEM_ENCOMENDA VALUES (27, 8, 20, 2, 15.90);
INSERT INTO ITEM_ENCOMENDA VALUES (28, 8, 21, 2, 16.50);

-- Encomenda 9 (Carla Mendes) - Biografia
INSERT INTO ITEM_ENCOMENDA VALUES (29, 9, 31, 2, 21.90);
INSERT INTO ITEM_ENCOMENDA VALUES (30, 9, 32, 1, 17.50);
INSERT INTO ITEM_ENCOMENDA VALUES (31, 9, 34, 2, 22.50);
INSERT INTO ITEM_ENCOMENDA VALUES (32, 9, 35, 1, 18.90);

-- Encomenda 10 (Daniel Oliveira) - TECNOLOGIA (valor alto)
INSERT INTO ITEM_ENCOMENDA VALUES (33, 10, 27, 1, 52.90); -- Design Patterns
INSERT INTO ITEM_ENCOMENDA VALUES (34, 10, 28, 1, 65.00); -- Introduction to Algorithms
INSERT INTO ITEM_ENCOMENDA VALUES (35, 10, 29, 2, 58.50); -- Art of Computer Programming x2
INSERT INTO ITEM_ENCOMENDA VALUES (36, 10, 30, 1, 55.00); -- Database System Concepts

-- Encomenda 11 (Daniel Oliveira) - Tecnologia
INSERT INTO ITEM_ENCOMENDA VALUES (37, 11, 23, 2, 45.90);
INSERT INTO ITEM_ENCOMENDA VALUES (38, 11, 24, 1, 42.50);
INSERT INTO ITEM_ENCOMENDA VALUES (39, 11, 25, 1, 38.90);

-- Encomenda 12 (Daniel Oliveira) - Ficção Científica
INSERT INTO ITEM_ENCOMENDA VALUES (40, 12, 8, 1, 22.90);
INSERT INTO ITEM_ENCOMENDA VALUES (41, 12, 9, 2, 18.50);
INSERT INTO ITEM_ENCOMENDA VALUES (42, 12, 14, 1, 21.90);
INSERT INTO ITEM_ENCOMENDA VALUES (43, 12, 15, 1, 23.90);

-- Encomenda 13 (Eva Santos) - Infantil
INSERT INTO ITEM_ENCOMENDA VALUES (44, 13, 50, 3, 9.90);
INSERT INTO ITEM_ENCOMENDA VALUES (45, 13, 52, 1, 10.90);
INSERT INTO ITEM_ENCOMENDA VALUES (46, 13, 55, 1, 7.90);

-- Encomenda 14 (Eva Santos) - Romance
INSERT INTO ITEM_ENCOMENDA VALUES (47, 14, 2, 2, 12.50);
INSERT INTO ITEM_ENCOMENDA VALUES (48, 14, 4, 1, 15.90);
INSERT INTO ITEM_ENCOMENDA VALUES (49, 14, 7, 1, 13.90);

-- Encomenda 15 (Fernando Rodrigues) - História + Biografia
INSERT INTO ITEM_ENCOMENDA VALUES (50, 15, 43, 2, 19.90);
INSERT INTO ITEM_ENCOMENDA VALUES (51, 15, 45, 1, 22.90);
INSERT INTO ITEM_ENCOMENDA VALUES (52, 15, 46, 2, 24.50);
INSERT INTO ITEM_ENCOMENDA VALUES (53, 15, 31, 2, 21.90);
INSERT INTO ITEM_ENCOMENDA VALUES (54, 15, 35, 1, 18.90);

-- Encomenda 16 (Fernando Rodrigues) - Policial
INSERT INTO ITEM_ENCOMENDA VALUES (55, 16, 17, 2, 14.90);
INSERT INTO ITEM_ENCOMENDA VALUES (56, 16, 18, 1, 16.90);
INSERT INTO ITEM_ENCOMENDA VALUES (57, 16, 19, 1, 17.50);
INSERT INTO ITEM_ENCOMENDA VALUES (58, 16, 22, 2, 15.90);

-- Encomenda 17 (Gabriela Pereira) - ROMANCE
INSERT INTO ITEM_ENCOMENDA VALUES (59, 17, 1, 1, 16.90);
INSERT INTO ITEM_ENCOMENDA VALUES (60, 17, 2, 2, 12.50);
INSERT INTO ITEM_ENCOMENDA VALUES (61, 17, 3, 1, 17.95);
INSERT INTO ITEM_ENCOMENDA VALUES (62, 17, 4, 2, 15.90);

-- Encomenda 18 (Gabriela Pereira) - Romance
INSERT INTO ITEM_ENCOMENDA VALUES (63, 18, 5, 2, 19.90);
INSERT INTO ITEM_ENCOMENDA VALUES (64, 18, 6, 3, 14.50);
INSERT INTO ITEM_ENCOMENDA VALUES (65, 18, 7, 2, 13.90);
INSERT INTO ITEM_ENCOMENDA VALUES (66, 18, 1, 2, 16.90);

-- Encomenda 19 (Gabriela Pereira) - Romance
INSERT INTO ITEM_ENCOMENDA VALUES (67, 19, 2, 1, 12.50);
INSERT INTO ITEM_ENCOMENDA VALUES (68, 19, 3, 2, 17.95);
INSERT INTO ITEM_ENCOMENDA VALUES (69, 19, 4, 1, 15.90);

-- Encomenda 20 (Hugo Ferreira) - HISTÓRIA
INSERT INTO ITEM_ENCOMENDA VALUES (70, 20, 43, 2, 19.90);
INSERT INTO ITEM_ENCOMENDA VALUES (71, 20, 44, 1, 21.50);
INSERT INTO ITEM_ENCOMENDA VALUES (72, 20, 45, 2, 22.90);
INSERT INTO ITEM_ENCOMENDA VALUES (73, 20, 47, 2, 18.90);
INSERT INTO ITEM_ENCOMENDA VALUES (74, 20, 48, 1, 23.90);

-- Encomenda 21 (Hugo Ferreira) - História
INSERT INTO ITEM_ENCOMENDA VALUES (75, 21, 43, 3, 19.90);
INSERT INTO ITEM_ENCOMENDA VALUES (76, 21, 44, 2, 21.50);
INSERT INTO ITEM_ENCOMENDA VALUES (77, 21, 45, 1, 22.90);
INSERT INTO ITEM_ENCOMENDA VALUES (78, 21, 46, 3, 24.50);
INSERT INTO ITEM_ENCOMENDA VALUES (79, 21, 48, 1, 23.90);

-- Encomenda 22 (Hugo Ferreira) - Biografia
INSERT INTO ITEM_ENCOMENDA VALUES (80, 22, 31, 1, 21.90);
INSERT INTO ITEM_ENCOMENDA VALUES (81, 22, 33, 1, 19.90);
INSERT INTO ITEM_ENCOMENDA VALUES (82, 22, 34, 1, 22.50);
INSERT INTO ITEM_ENCOMENDA VALUES (83, 22, 35, 1, 18.90);

-- Encomenda 23 (Inês Marques) - Mix variado
INSERT INTO ITEM_ENCOMENDA VALUES (84, 23, 2, 1, 12.50);
INSERT INTO ITEM_ENCOMENDA VALUES (85, 23, 17, 2, 14.90);
INSERT INTO ITEM_ENCOMENDA VALUES (86, 23, 50, 2, 9.90);
INSERT INTO ITEM_ENCOMENDA VALUES (87, 23, 43, 1, 19.90);

-- Encomenda 24 (João Almeida) - Ficção Científica + Policial
INSERT INTO ITEM_ENCOMENDA VALUES (88, 24, 8, 1, 22.90);
INSERT INTO ITEM_ENCOMENDA VALUES (89, 24, 9, 2, 18.50);
INSERT INTO ITEM_ENCOMENDA VALUES (90, 24, 17, 1, 14.90);
INSERT INTO ITEM_ENCOMENDA VALUES (91, 24, 19, 2, 17.50);

-- Encomenda 25 (João Almeida) - Arte e Fotografia
INSERT INTO ITEM_ENCOMENDA VALUES (92, 25, 37, 1, 42.90);
INSERT INTO ITEM_ENCOMENDA VALUES (93, 25, 39, 1, 55.00);
INSERT INTO ITEM_ENCOMENDA VALUES (94, 25, 40, 1, 48.90);
INSERT INTO ITEM_ENCOMENDA VALUES (95, 25, 38, 2, 18.50);

-- ===============================
--   VERIFICAÇÕES E ESTATÍSTICAS
-- ===============================

-- Verificar total de livros por categoria
SELECT categoria, COUNT(*) as total_livros, ROUND(AVG(preco), 2) as preco_medio
FROM LIVRO
GROUP BY categoria
ORDER BY preco_medio DESC;

-- Verificar clientes com e sem encomendas
SELECT 
  (SELECT COUNT(*) FROM CLIENTE WHERE cliente_id IN (SELECT DISTINCT cliente_id FROM ENCOMENDA)) as clientes_com_encomendas,
  (SELECT COUNT(*) FROM CLIENTE WHERE cliente_id NOT IN (SELECT DISTINCT cliente_id FROM ENCOMENDA)) as clientes_sem_encomendas,
  (SELECT COUNT(*) FROM CLIENTE) as total_clientes;

-- Verificar preço médio geral
SELECT ROUND(AVG(preco), 2) as preco_medio_geral
FROM LIVRO;

-- Verificar distribuição de encomendas por cliente
SELECT c.nome, COUNT(e.encomenda_id) as num_encomendas, ROUND(SUM(e.valor_total), 2) as valor_total
FROM CLIENTE c
LEFT JOIN ENCOMENDA e ON c.cliente_id = e.cliente_id
GROUP BY c.cliente_id, c.nome
ORDER BY num_encomendas DESC;

-- ===============================
--   TAREFA A
-- ===============================

SELECT ROUND(AVG(preco), 2) as preco_medio_geral FROM LIVRO;

-- ===============================
--   TAREFA B
-- ===============================



-- ===============================
--   TAREFA C
-- ===============================