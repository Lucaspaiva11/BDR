-- Banco: limnologia_db (crie/ative conforme necessário)

-- CREATE DATABASE limnologia_db;

-- \c limnologia_db;
 
CREATE TABLE parametro (

  id_parametro SERIAL PRIMARY KEY,

  nome_parametro VARCHAR(100) NOT NULL

);
 
CREATE TABLE reservatorio (

  id_reservatorio SERIAL PRIMARY KEY,

  nome VARCHAR(150) NOT NULL

);
 
CREATE TABLE serie_temporal (

  id_serie SERIAL PRIMARY KEY,

  id_reservatorio INT NOT NULL REFERENCES reservatorio(id_reservatorio),

  id_parametro INT NOT NULL REFERENCES parametro(id_parametro),

  valor NUMERIC(6,3) NOT NULL,

  data_hora TIMESTAMP NOT NULL

);

 
-- Parâmetros
INSERT INTO parametro (id_parametro, nome_parametro) VALUES
(1, 'Oxigênio Dissolvido');

-- Reservatórios
INSERT INTO reservatorio (id_reservatorio, nome) VALUES
(1, 'Serra Azul'),
(2, 'Furnas'),
(3, 'Três Marias');

-- Medições (serie_temporal)
-- Serra Azul: média ~8.0 (7.8, 8.0, 8.2)
-- Furnas: único valor 7.4
-- Três Marias: média ~9.1 (9.0, 9.1, 9.2)

INSERT INTO serie_temporal (id_serie, id_reservatorio, id_parametro, valor, data_hora) VALUES
(1, 1, 1, 7.800, '2025-09-01 08:30:00'),
(2, 1, 1, 8.000, '2025-09-01 12:30:00'),
(3, 1, 1, 8.200, '2025-09-01 16:30:00'),
(4, 2, 1, 7.400, '2025-09-02 10:15:00'),
(5, 3, 1, 9.000, '2025-09-03 09:00:00'),
(6, 3, 1, 9.100, '2025-09-03 12:00:00'),
(7, 3, 1, 9.200, '2025-09-03 15:00:00');

 