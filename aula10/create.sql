-- ==========================
-- BANCO DE DADOS: Biblioteca
-- ==========================

-- Tabela de autores
CREATE TABLE autor (
  id_autor SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

-- Tabela de editoras
CREATE TABLE editora (
  id_editora SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

-- Tabela de livros
CREATE TABLE livro (
  id_livro SERIAL PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  paginas INT,
  id_autor INT REFERENCES autor(id_autor),
  id_editora INT REFERENCES editora(id_editora)
);

-- Inserts para autores (NOVOS VALORES)
INSERT INTO autor (nome) VALUES
('Graciliano Ramos'),
('Rachel de Queiroz'),
('Monteiro Lobato'),
('Erico Verissimo');

-- Inserts para editoras (NOVOS VALORES)
INSERT INTO editora (nome) VALUES
('Saraiva'),
('Globo Livros'),
('Autêntica');

-- Inserts para livros (NOVOS VALORES)
INSERT INTO livro (titulo, paginas, id_autor, id_editora) VALUES
('Vidas Secas', 175, 1, 1),
('São Bernardo', 210, 1, 1),
('O Quinze', 160, 2, 2),
('O Tempo e o Vento', 720, 4, 2),
('Reinações de Narizinho', 320, 3, 3),
('Caçadas de Pedrinho', 180, 3, 3);


-- ==========================
-- BANCO DE DADOS: limnologia_db
-- ==========================

-- Tabela de reservatórios
CREATE TABLE reservatorio (
  id_reservatorio SERIAL PRIMARY KEY,
  nome VARCHAR(100)
);

-- Tabela de campanhas
CREATE TABLE campanha (
  id_campanha SERIAL PRIMARY KEY,
  id_reservatorio INT REFERENCES reservatorio(id_reservatorio),
  id_instituicao INT REFERENCES instituicao(id_instituicao),
  data DATE
);

-- Tabela de instituições
CREATE TABLE instituicao (
  id_instituicao SERIAL PRIMARY KEY,
  nome VARCHAR(100)
);

-- Tabela de parâmetros
CREATE TABLE parametro (
  id_parametro SERIAL PRIMARY KEY,
  nome VARCHAR(100)
);

-- Tabela de séries temporais
CREATE TABLE serie_temporal (
  id_serie SERIAL PRIMARY KEY,
  id_parametro INT REFERENCES parametro(id_parametro),
  valor NUMERIC(10,2)
);

-- Inserts de reservatórios (NOVOS VALORES)
INSERT INTO reservatorio (nome) VALUES
('Represa do Sol'),
('Lago Cristalino'),
('Barragem Santa Rosa');

-- Inserts de instituições (NOVOS VALORES)
INSERT INTO instituicao (nome) VALUES
('UFPR'),
('UNESP'),
('UFRJ');

-- Inserts de campanhas (NOVOS VALORES)
INSERT INTO campanha (id_reservatorio, id_instituicao, data) VALUES
(1, 1, '2024-01-05'),
(1, 3, '2024-02-18'),
(2, 2, '2024-03-22'),
(2, 1, '2024-04-10'),
(3, 3, '2024-05-17'),
(3, 2, '2024-06-21');

-- Inserts de parâmetros (NOVOS VALORES)
INSERT INTO parametro (nome) VALUES
('Turbidez'),
('Condutividade'),
('Salinidade');

-- Inserts de séries temporais (NOVOS VALORES)
INSERT INTO serie_temporal (id_parametro, valor) VALUES
(1, 15.4),
(1, 12.8),
(2, 310.0),
(2, 295.7),
(3, 0.5),
(3, 0.8);
