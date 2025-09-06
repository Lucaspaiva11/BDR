INSERT INTO usuario (nome, mail, telefone)
VALUES 
('Lucas Silva', 'lucas@email.com', '11999999999'),
('Mariana Costa', 'mariana@email.com', '21988888888'),
('João Pereira', 'joao@email.com', '31977777777');

INSERT INTO alerta (tipo, gravidade, id_usuario)
VALUES 
('Chuva Forte', 'alta', 1),
('Calor Extremo', 'media', 2),
('Vento Forte', 'baixa', 3);

INSERT INTO dados_ambientais (unidade, id_usuario)
VALUES 
('30°C', 1),
('85%', 2),
('1013hPa', 3);

INSERT INTO confirmacao_alerta (id_usuario, id_alerta)
VALUES 
(1, 1),
(2, 2),
(3, 3);


SELECT * FROM usuario;

SELECT * FROM alerta;

SELECT * FROM alerta
WHERE gravidade = 'alta';

SELECT * FROM dados_ambientais
WHERE id_usuario = 1;

-- aula 06

    -- Evento 1: Queimada em Jacareí (SP)
INSERT INTO evento (titulo, descricao, data_hora, status, id_tipo_evento, id_localizacao)
VALUES (
    'Queimada em área de preservação',
    'Foco de incêndio próximo à represa municipal.',
    '2025-08-15 14:35:00',
    'Ativo',
    (SELECT id_tipo_evento FROM tipo_evento WHERE nome = 'Queimada'),
    (SELECT id_localizacao FROM localizacao WHERE cidade = 'Jacareí' AND sigla_estado = 'SP')
);

-- Evento 2: Enchente em São José dos Campos (SP)
INSERT INTO evento (titulo, descricao, data_hora, status, id_tipo_evento, id_localizacao)
VALUES (
    'Enchente em bairro central',
    'Alagamento causado por fortes chuvas.',
    '2025-08-16 09:20:00',
    'Em andamento',
    (SELECT id_tipo_evento FROM tipo_evento WHERE nome = 'Enchente'),
    (SELECT id_localizacao FROM localizacao WHERE cidade = 'São José dos Campos' AND sigla_estado = 'SP')
);

-- Evento 3: Deslizamento em Belo Horizonte (MG)
INSERT INTO evento (titulo, descricao, data_hora, status, id_tipo_evento, id_localizacao)
VALUES (
    'Deslizamento em encosta',
    'Queda de barreira após chuva intensa.',
    '2025-08-17 07:50:00',
    'Resolvido',
    (SELECT id_tipo_evento FROM tipo_evento WHERE nome = 'Deslizamento'),
    (SELECT id_localizacao FROM localizacao WHERE cidade = 'Belo Horizonte' AND sigla_estado = 'MG')
);

INSERT INTO tipo_evento (nome) VALUES
('Queimada'),
('Enchente'),
('Deslizamento');


INSERT INTO localizacao (cidade, sigla_estado) VALUES
('Jacareí', 'SP'),
('São José dos Campos', 'SP'),
('Belo Horizonte', 'MG');

SELECT id_usuario, nome, mail
FROM usuario;

SELECT id_tipo_evento, nome, descricao
FROM tipo_evento;

SELECT id_localizacao, cidade, sigla_estado, latitude, longitude
FROM localizacao;

SELECT id_evento, titulo, status, id_tipo_evento, id_localizacao, data_hora
FROM evento;

SELECT id_evento, titulo, status, data_hora
FROM evento
WHERE status = 'Ativo';

SELECT id_localizacao, cidade, sigla_estado
FROM localizacao
WHERE sigla_estado = 'SP';

SELECT id_usuario, nome, mail
FROM usuario
WHERE mail LIKE '%@gmail.com';

SELECT COUNT(*) AS total_estados
FROM estado;


SELECT COUNT(*) AS total_tipos_evento
FROM tipo_evento;

SELECT COUNT(*) AS total_usuarios
FROM usuario;

SELECT COUNT(*) AS total_localizacoes
FROM localizacao;

SELECT COUNT(*) AS total_eventos
FROM evento;

