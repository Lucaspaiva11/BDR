CREATE TYPE nivel_gravidade AS ENUM ('baixa', 'media', 'alta');

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    telefone VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE alerta (
    id_alerta SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    gravidade nivel_gravidade NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT,
    CONSTRAINT fk_alerta_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE dados_ambientais (
    id_dado SERIAL PRIMARY KEY,
    unidade VARCHAR(10),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT,
    CONSTRAINT fk_dado_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario) ON DELETE SET NULL
);

CREATE TABLE confirmacao_alerta (
    id_usuario INT NOT NULL,
    id_alerta INT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario, id_alerta),
    CONSTRAINT fk_conf_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_conf_alerta FOREIGN KEY (id_alerta)
        REFERENCES alerta (id_alerta) ON DELETE CASCADE
);
