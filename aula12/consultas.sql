-- ===============================================
-- RELATÓRIO: Média, mínimo e máximo de pH por reservatório
-- ===============================================
-- Cada subconsulta abaixo é executada para cada linha da tabela 'reservatorio'.
-- Elas são "correlacionadas" porque dependem do id_reservatorio atual.

SELECT 
  r.nome AS reservatorio,

  -- Subconsulta 1: média de pH
  (
    SELECT ROUND(AVG(s.valor), 2)
    FROM serie_temporal s
    JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE p.nome_parametro = 'pH'
      AND s.id_reservatorio = r.id_reservatorio
  ) AS media_ph,

  -- Subconsulta 2: menor valor de pH
  (
    SELECT MIN(s.valor)
    FROM serie_temporal s
    JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE p.nome_parametro = 'pH'
      AND s.id_reservatorio = r.id_reservatorio
  ) AS ph_minimo,

  -- Subconsulta 3: maior valor de pH
  (
    SELECT MAX(s.valor)
    FROM serie_temporal s
    JOIN parametro p ON s.id_parametro = p.id_parametro
    WHERE p.nome_parametro = 'pH'
      AND s.id_reservatorio = r.id_reservatorio
  ) AS ph_maximo

FROM reservatorio r
ORDER BY r.nome;