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


