
INSERT INTO loja (nome, cidade) VALUES
('Loja Gamer SJC', 'São José dos Campos'),
('Game Center Limeira', 'Limeira'),
('Paraibuna Games', 'Paraibuna');

INSERT INTO cliente (nome, email, cidade) VALUES
('Lucas', 'lucas@email.com', 'São José dos Campos'),
('Franciele', 'franciele@email.com', 'Limeira'),
('Neymar', 'neymar@email.com', 'Paraibuna');

INSERT INTO jogo (titulo, ano_lancamento, genero) VALUES
('The Legend of Adventure', 2020, 'Ação/Aventura'),
('Racing Thunder', 2019, 'Corrida'),
('Puzzle Mania', 2021, 'Quebra-cabeça');

INSERT INTO compra (data_compra, id_cliente, id_loja) VALUES
('2025-09-05', 1, 1),
('2025-09-05', 2, 2),
('2025-09-05', 3, 3);

INSERT INTO compra_jogo (id_compra, id_jogo, quantidade) VALUES
(1, 1, 1),  
(1, 2, 2),  
(2, 2, 1),  
(2, 3, 3),  
(3, 1, 2),  
(3, 3, 1);
