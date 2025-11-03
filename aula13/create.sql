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

-- Reservatórios monitorados
INSERT INTO reservatorio (nome) VALUES
('Serra Azul'),
('Três Marias'),
('Furnas'),
('Itupararanga');

-- Parâmetros monitorados 
INSERT INTO parametro (nome_parametro) VALUES
('Condutividade Elétrica'),
('Salinidade'),
('pH'),
('Turbidez');

-- Séries temporais (dados simulados)
INSERT INTO serie_temporal (id_reservatorio, id_parametro, valor, data_hora) VALUES
(1, 3, 7.8, '2025-03-01 08:15'),  -- Serra Azul - pH
(3, 3, 8.0, '2025-03-01 10:20'),  -- Furnas - pH
(2, 1, 312.5, '2025-03-01 09:00'), -- Três Marias - Condutividade
(4, 4, 5.6, '2025-03-01 07:45');  -- Itupararanga - Turbidez
