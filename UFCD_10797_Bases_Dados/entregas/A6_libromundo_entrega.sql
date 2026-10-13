-- UFCD 10797 - Atividade 6 - Subquery - LibroMundo
-- André Luiz Sales Rodrigues.


-- PARTE A
-- A.1.1 Preço acima da média da categoria
-- Tipo: correlacionada.
-- Porquê: a média muda com a categoria de cada livro.
-- Alternativa: JOIN com subquery agrupada por categoria, ou CTE.

-- A.1.2 Clientes sem encomendas
-- Tipo: múltiplas linhas, com NOT IN.
-- Porquê: quero os clientes que não estão na lista de ENCOMENDA.
-- Alternativa: LEFT JOIN com IS NULL, ou NOT EXISTS.

-- A.1.3 Maior encomenda de cada cliente
-- Tipo: correlacionada.
-- Porquê: o máximo é calculado só com as encomendas de cada cliente.
-- Alternativa: JOIN com subquery agrupada por cliente, ou ROW_NUMBER.


-- PARTE B
-- B.1 Passo 1: média geral
-- Valor: 25,96.
SELECT AVG(preco) FROM LIVRO;

-- B.1 Passo 2: livros acima da média
SELECT titulo, autor, categoria, preco, preco - (SELECT AVG(preco) FROM LIVRO) AS acima_da_media
FROM LIVRO
WHERE preco > (SELECT AVG(preco) FROM LIVRO)
ORDER BY preco DESC;

-- B.1 Passo 3: quantos livros
-- 14 de 55. Tecnologia e Arte e Fotografia custam cerca de 50 e puxam a média para cima.
SELECT COUNT(*) FROM LIVRO WHERE preco > (SELECT AVG(preco) FROM LIVRO);

-- B.2 Média da categoria
-- Correlacionada, a média muda com a categoria.
-- Coluna usada da consulta externa: categoria.
SELECT l.titulo, l.autor, l.categoria, l.preco, l.preco - (SELECT AVG(l2.preco) FROM LIVRO l2 WHERE l2.categoria = l.categoria) AS acima_da_media_categoria
FROM LIVRO l
WHERE l.preco > (SELECT AVG(l2.preco) FROM LIVRO l2 WHERE l2.categoria = l.categoria)
ORDER BY l.categoria, l.preco DESC;


-- PARTE C
-- C.1 Com IN
SELECT cliente_id, nome, email
FROM CLIENTE
WHERE cliente_id IN (SELECT cliente_id FROM ENCOMENDA);

-- C.1 Com EXISTS
SELECT c.cliente_id, c.nome, c.email
FROM CLIENTE c
WHERE EXISTS (SELECT 1 FROM ENCOMENDA e WHERE e.cliente_id = c.cliente_id);

-- Resultados idênticos, 10 clientes.
-- Prefiro EXISTS porque não falha com NULL.

-- C.2 Clientes sem encomendas
-- IS NOT NULL na subquery, porque um NULL faria o NOT IN devolver vazio.
SELECT nome, email, DATEDIFF(CURDATE(), data_registo) AS dias_desde_registo
FROM CLIENTE
WHERE cliente_id NOT IN (SELECT cliente_id FROM ENCOMENDA WHERE cliente_id IS NOT NULL)
ORDER BY data_registo ASC;


-- PARTE D
-- D.1 Maior encomenda por cliente
SELECT c.nome, e.encomenda_id, e.valor_total, e.data_encomenda
FROM CLIENTE c
JOIN ENCOMENDA e ON e.cliente_id = c.cliente_id
WHERE e.valor_total = (SELECT MAX(e2.valor_total) FROM ENCOMENDA e2 WHERE e2.cliente_id = e.cliente_id)
ORDER BY c.nome;


-- PARTE E
-- E.1 Categorias acima da média geral
-- Primeiro a média por categoria com GROUP BY.
-- Uma subquery chega, a média geral.
SELECT categoria, ROUND(AVG(preco), 2) AS media_categoria, ROUND((SELECT AVG(preco) FROM LIVRO), 2) AS media_geral, ROUND(AVG(preco) - (SELECT AVG(preco) FROM LIVRO), 2) AS diferenca
FROM LIVRO
GROUP BY categoria
HAVING AVG(preco) > (SELECT AVG(preco) FROM LIVRO)
ORDER BY diferenca DESC;
