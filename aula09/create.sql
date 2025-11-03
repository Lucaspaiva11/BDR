-- ============================================
-- CRIAÇÃO DAS TABELAS
-- ============================================

CREATE TABLE tipo_evento (
    id_tipo_evento SERIAL PRIMARY KEY,
    nome_tipo VARCHAR(100) NOT NULL
);

CREATE TABLE localizacao (
    id_localizacao SERIAL PRIMARY KEY,
    cidade VARCHAR(100) NOT NULL,
    sigla_estado CHAR(2) NOT NULL
);

CREATE TABLE evento (
    id_evento SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_tipo_evento INT REFERENCES tipo_evento(id_tipo_evento),
    id_localizacao INT REFERENCES localizacao(id_localizacao)
);

-- ============================================
-- INSERINDO DADOS DE EXEMPLO (NOVOS VALORES)
-- ============================================

INSERT INTO tipo_evento (nome_tipo)
VALUES 
('Exposição'),
('Simpósio'),
('Workshop'),
('Hackathon');

INSERT INTO localizacao (cidade, sigla_estado)
VALUES 
('Curitiba', 'PR'),
('Fortaleza', 'CE'),
('Brasília', 'DF'),
('Manaus', 'AM');

INSERT INTO evento (titulo, id_tipo_evento, id_localizacao)
VALUES
('Tech Expo 2025', 1, 3),
('Simpósio de Educação Digital', 2, 1),
('Oficina de Robótica', 3, 2),
('Hack Day Amazônico', 4, NULL); -- evento sem local definido
