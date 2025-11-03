-- ==============================================
-- 7. INNER JOIN — RELATÓRIO DE PRODUTOS VENDIDOS
-- ==============================================
SELECT 
    p.nome AS produto,
    l.nome_loja,
    v.quantidade
FROM venda v
INNER JOIN produto p ON v.id_produto = p.id_produto
INNER JOIN loja l ON v.id_loja = l.id_loja;

-- ==============================================
-- 8. INNER JOIN + GROUP BY — TOTAL DE PRODUTOS VENDIDOS POR LOJA
-- ==============================================
SELECT 
    l.nome_loja,
    SUM(v.quantidade) AS total_vendido
FROM venda v
INNER JOIN loja l ON v.id_loja = l.id_loja
GROUP BY l.nome_loja;

-- ==============================================
-- 9. INNER JOIN + HAVING — LOJAS DE ALTO DESEMPENHO
-- ==============================================
SELECT 
    l.nome_loja,
    SUM(v.quantidade) AS total_vendido
FROM venda v
INNER JOIN loja l ON v.id_loja = l.id_loja
GROUP BY l.nome_loja
HAVING SUM(v.quantidade) > 30;

-- ==============================================
-- 10. SUBCONSULTA + INNER JOIN — FABRICANTES COM PRODUTOS VENDIDOS
-- ==============================================
SELECT 
    f.nome_fabricante
FROM fabricante f
WHERE f.id_fabricante IN (
    SELECT p.id_fabricante
    FROM produto p
    INNER JOIN venda v ON v.id_produto = p.id_produto
);