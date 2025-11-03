-- ===============================================
-- CONSULTA 1 — Biblioteca
-- ===============================================
-- Lista quantos livros cada autor possui.
SELECT 
  a.nome AS autor,
  COUNT(l.id_livro) AS total_livros
FROM autor a
LEFT JOIN livro l ON a.id_autor = l.id_autor
GROUP BY a.nome;

-- ===============================================
-- CONSULTA 2 — Biblioteca
-- ===============================================
-- Mostra a média de páginas dos livros por editora.
SELECT 
  e.nome AS editora,
  AVG(l.paginas) AS media_paginas
FROM editora e
JOIN livro l ON e.id_editora = l.id_editora
GROUP BY e.nome;

-- ===============================================
-- CONSULTA 3 — limnologia_db
-- ===============================================
-- Lista o total de campanhas por reservatório.
SELECT 
  r.nome AS reservatorio,
  COUNT(c.id_campanha) AS total_campanhas
FROM reservatorio r
LEFT JOIN campanha c ON r.id_reservatorio = c.id_reservatorio
GROUP BY r.nome;

-- ===============================================
-- CONSULTA 4 — limnologia_db
-- ===============================================
-- Mostra a média de valores de cada parâmetro em séries temporais.
SELECT 
  p.nome AS parametro,
  ROUND(AVG(s.valor), 2) AS media_valores
FROM parametro p
JOIN serie_temporal s ON p.id_parametro = s.id_parametro
GROUP BY p.nome;

-- ===============================================
-- CONSULTA 5 — limnologia_db
-- ===============================================
-- Exibe apenas as instituições que realizaram mais de 3 campanhas.
SELECT 
  i.nome AS instituicao,
  COUNT(c.id_campanha) AS total_campanhas
FROM instituicao i
JOIN campanha c ON i.id_instituicao = c.id_instituicao
GROUP BY i.nome
HAVING COUNT(c.id_campanha) > 3;