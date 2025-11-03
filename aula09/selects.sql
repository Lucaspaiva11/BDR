-- ============================================
-- CONSULTA A
-- ============================================
-- Retorna o título do evento e o nome do tipo do evento.
-- Usa INNER JOIN porque todo evento precisa ter um tipo.

SELECT 
    e.titulo AS titulo_evento,
    t.nome_tipo AS tipo_evento
FROM evento e
INNER JOIN tipo_evento t 
    ON e.id_tipo_evento = t.id_tipo_evento;

-- ============================================
-- CONSULTA B
-- ============================================
-- Retorna o título do evento, cidade e sigla do estado.
-- Usa INNER JOIN pois queremos apenas eventos que já possuem local.

SELECT 
    e.titulo AS titulo_evento,
    l.cidade,
    l.sigla_estado
FROM evento e
INNER JOIN localizacao l
    ON e.id_localizacao = l.id_localizacao;

-- ============================================
-- CONSULTA C
-- ============================================
-- Retorna o título do evento, tipo do evento e cidade.
-- Usa LEFT JOIN em localizacao, pois pode haver eventos sem local definido.
-- O INNER JOIN com tipo_evento é mantido porque todo evento deve ter tipo.

SELECT 
    e.titulo AS titulo_evento,
    t.nome_tipo AS tipo_evento,
    l.cidade
FROM evento e
INNER JOIN tipo_evento t
    ON e.id_tipo_evento = t.id_tipo_evento
LEFT JOIN localizacao l
    ON e.id_localizacao = l.id_localizacao;

-- Explicação:
-- O LEFT JOIN garante que eventos sem localização ainda apareçam no resultado,
-- com os campos de cidade nulos.

-- ============================================
-- CONSULTA D
-- ============================================
-- Reescrita da Consulta B usando RIGHT JOIN.
-- A ordem das tabelas foi invertida, mas o resultado é o mesmo.
-- Diferença: a leitura fica menos natural, pois o foco é o evento, 
-- e agora ele aparece à direita.

SELECT 
    e.titulo AS titulo_evento,
    l.cidade,
    l.sigla_estado
FROM localizacao l
RIGHT JOIN evento e
    ON e.id_localizacao = l.id_localizacao;

-- ============================================
-- CONSULTA E
-- ============================================
-- Mostra, para cada cidade, a quantidade de eventos.
-- Usa JOIN + GROUP BY para agrupar por cidade.

SELECT 
    l.cidade,
    COUNT(e.id_evento) AS quantidade_eventos
FROM localizacao l
LEFT JOIN evento e
    ON e.id_localizacao = l.id_localizacao
GROUP BY l.cidade
ORDER BY quantidade_eventos DESC;

-- ============================================
-- FIM DO SCRIPT
-- ============================================