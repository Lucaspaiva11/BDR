CREATE TABLE reservatorio (
  id_reservatorio SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

-- ==========================
-- Tabela: parametro
-- ==========================
CREATE TABLE parametro (
  id_parametro SERIAL PRIMARY KEY,
  nome_parametro VARCHAR(100) NOT NULL
);

-- ==========================
-- Tabela: serie_temporal
-- ==========================
CREATE TABLE serie_temporal (
  id_serie SERIAL PRIMARY KEY,
  id_reservatorio INT REFERENCES reservatorio(id_reservatorio),
  id_parametro INT REFERENCES parametro(id_parametro),
  valor NUMERIC(5,2),
  data_hora TIMESTAMP
);

-- Reservatórios monitorados (NOVOS VALORES)
INSERT INTO reservatorio (nome) VALUES
('Serra Azul'),
('Três Marias'),
('Furnas');

-- Parâmetros monitorados (NOVOS VALORES)
INSERT INTO parametro (nome_parametro) VALUES
('Oxigênio Dissolvido'),
('Condutividade'),
('Salinidade');

-- Séries temporais simuladas (valores para Oxigênio Dissolvido)
INSERT INTO serie_temporal (id_reservatorio, id_parametro, valor, data_hora) VALUES
(1, 1, 8.2, '2025-02-01 07:30'),
(1, 1, 8.0, '2025-02-02 07:30'),
(1, 1, 8.3, '2025-02-03 07:30'),
(2, 1, 7.5, '2025-02-01 09:00'),
(3, 1, 9.1, '2025-02-01 10:30'),
(3, 1, 9.0, '2025-02-02 10:30'),
(3, 1, 9.2, '2025-02-03 10:30'),

-- valores de outro parâmetro (para teste de filtragem)
(1, 2, 320.0, '2025-02-01 07:30'),
(2, 3, 0.6, '2025-02-01 09:00');
