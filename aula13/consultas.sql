-- ===============================================
-- PASSO 1 — Conferir os parâmetros disponíveis
-- ===============================================
-- Mostra todos os parâmetros cadastrados para identificar o ID do "Oxigênio Dissolvido".

SELECT * FROM parametro;


-- ===============================================
-- PASSO 2 — Rodar a subconsulta isolada
-- ===============================================
-- Retorna a lista de IDs de reservatórios que têm registros de "Oxigênio Dissolvido".
-- Essa subconsulta sozinha mostra quais reservatórios possuem medições desse parâmetro.

SELECT DISTINCT s.id_reservatorio
FROM serie_temporal s
JOIN parametro p ON s.id_parametro = p.id_parametro
WHERE p.nome_parametro = 'Oxigênio Dissolvido';


-- ===============================================
-- PASSO 3 — Query completa com IN
-- ===============================================
-- Agora usamos a subconsulta dentro do WHERE.
-- A consulta principal (reservatorio) só traz nomes que estão na lista retornada acima.

SELECT nome AS reservatorio
FROM reservatorio
WHERE id_reservatorio IN (
  SELECT DISTINCT s.id_reservatorio
  FROM serie_temporal s
  JOIN parametro p ON s.id_parametro = p.id_parametro
  WHERE p.nome_parametro = 'Oxigênio Dissolvido'
)
ORDER BY nome;


-- ===============================================
-- PASSO 4 — Reescrever usando EXISTS
-- ===============================================
-- O resultado é o mesmo, mas o PostgreSQL executa de forma diferente:
-- Ele verifica se "existe ao menos uma linha" que satisfaça a condição.

SELECT r.nome AS reservatorio
FROM reservatorio r
WHERE EXISTS (
  SELECT 1
  FROM serie_temporal s
  JOIN parametro p ON s.id_parametro = p.id_parametro
  WHERE p.nome_parametro = 'Oxigênio Dissolvido'
    AND s.id_reservatorio = r.id_reservatorio
)
ORDER BY r.nome;


-- ===============================================
-- PASSO 5 — Comparar desempenho (opcional)
-- ===============================================
-- Mostra os planos de execução das duas queries.
-- Com poucos dados, não há diferença perceptível.
-- Com grandes volumes, EXISTS tende a ser mais eficiente.

EXPLAIN ANALYZE
SELECT nome AS reservatorio
FROM reservatorio
WHERE id_reservatorio IN (
  SELECT DISTINCT s.id_reservatorio
  FROM serie_temporal s
  JOIN parametro p ON s.id_parametro = p.id_parametro
  WHERE p.nome_parametro = 'Oxigênio Dissolvido'
);

EXPLAIN ANALYZE
SELECT r.nome AS reservatorio
FROM reservatorio r
WHERE EXISTS (
  SELECT 1
  FROM serie_temporal s
  JOIN parametro p ON s.id_parametro = p.id_parametro
  WHERE p.nome_parametro = 'Oxigênio Dissolvido'
    AND s.id_reservatorio = r.id_reservatorio
);