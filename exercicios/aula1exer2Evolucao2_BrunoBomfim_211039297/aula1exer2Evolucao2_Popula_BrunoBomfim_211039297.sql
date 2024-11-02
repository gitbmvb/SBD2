-- ---------------------   << Empresa >>   ---------------------
--
--                    SCRIPT DE POPULA (DML)
-- 
-- Data Criacao ...........: 20/10/2024
-- Autor(es) ..............: Raquel Ferreira Andrade, Bruno Martins Valério Bomfim
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 03 Papéis (roles)
--         => 08 usuários
--
-- Ultimas Alteracoes
--   26/10/2024 => Adiciona 7 tuplas em cada tabela, adaptado ao novo script de criação;
-- -------------------------------------------------------------------------
USE aula1exer2;

INSERT INTO PESSOA (cpf, nome, senha) VALUES 
(12345678910, 'Ana Carolina Souza', 'Ana@1234'),
(23456789101, 'Bruno Henrique Lima', 'BrunoLima!'),
(34567891012, 'Carla Fernanda Alves', 'C4rl4_F3rn'),
(45678910123, 'Diego Martins Silva', 'DiegoM@rt1ns'),
(56789101234, 'Elaine Oliveira Rocha', 'El@ine2023'),
(67891012345, 'Felipe Augusto Mendes', 'F3l1p3M3nd3s'),
(78910123456, 'Gabriela Costa Neves', 'Gabri3l@C0sta'),
(89101234567, 'Henrique Santos Braga', 'H3nriqu3SB'),
(91012345678, 'Isabela Pereira Almeida', 'IsabelaP@123'),
(11223344556, 'João Victor Ramos', 'J0@0R@m0s'),
(22334455667, 'Larissa Rodrigues Barros', 'L@riss@B23'),
(33445566778, 'Marcelo Lopes Vieira', 'M@rc3l0LV'),
(44556677889, 'Natália Fernandes Pinto', 'N@t@liaF9'),
(55667788990, 'Pedro Lucas Torres', 'P3dr0LT!23');

INSERT INTO GERENTE (cpf, idGerente, escolaridade, email) VALUES
(12345678910, 3141, 'primário', 'ana.souza3141@gmail.com'),
(23456789101, 5926, 'superior', 'bruno.lima5926@hotmail.com'),
(34567891012, 5358, 'primário', 'carla.alves5358@gmail.com'),
(45678910123, 9793, 'mestrado', 'diego.silva9793@hotmail.com'),
(56789101234, 2384, 'mestrado', 'elaine.rocha2384@gmail.com'),
(67891012345, 2795, 'superior', 'felipe.mendes2795@hotmail.com'),
(78910123456, 2718, 'médio', 'gabriela.neves2718@gmail.com'),
(89101234567, 8862, 'superior', 'henribra@yahoo.com');

INSERT INTO EMPREGADO (cpf, matricula, cep, cidade, bairro, rua, numero) VALUES
(89101234567, 1023, 71503102, 'Brasília', 'Asa Norte', 'Rua 1', 100),
(91012345678, 1024, 01002000, 'São Paulo', 'Centro', 'Rua da Paz', 200),
(11223344556, 1025, 30140071, 'Belo Horizonte', 'Savassi', 'Rua das Flores', 305),
(22334455667, 1026, 40026015, 'Salvador', 'Comércio', 'Rua Direita', 18),
(33445566778, 1027, 80030010, 'Curitiba', 'Centro Cívico', 'Rua XV de Novembro', 450),
(44556677889, 1028, 69050030, 'Manaus', 'Adrianópolis', 'Av. Constantino Nery', 55),
(55667788990, 1029, 90420060, 'Porto Alegre', 'Moinhos de Vento', 'Rua Padre Chagas', 120);

INSERT INTO supervisiona (idGerente, matricula) VALUES
(3141, 1023),
(5926, 1024),
(5358, 1025),
(9793, 1026),
(2384, 1027),
(2795, 1028),
(2718, 1029);

INSERT INTO telefone(matricula, telefone) VALUES
(1023, 50929530357),
(1024, 72392205475),
(1025, 64796943893),
(1026, 54414415495),
(1027, 61982797803),
(1028, 61983326501),
(1029, 61981103637);

INSERT INTO AREA (nome, descricao, fkIdGerente) VALUES
('Hortifruti', 'Frutas, legumes e verduras frescas', 3141),
('Padaria', 'Pães, bolos e confeitaria variados', 5926),
('Açougue', 'Carnes frescas e cortes especiais', 5358),
('Frios e Laticínios', 'Queijos, iogurtes e frios variados', 9793),
('Bebidas', 'Bebidas alcoólicas e não alcoólicas', 2384),
('Mercearia', 'Produtos de uso diário, como arroz e feijão', 2795),
('Limpeza', 'Produtos de limpeza para o lar e lavanderia', 2718);

INSERT INTO PRODUTO (nomeProduto, precoUni, fkIdArea) VALUES
('Banana Prata', 3.50, 1),
('Maçã Gala', 4.99, 1),
('Cenoura', 2.89, 1),
('Pão Francês', 0.50, 2),
('Bolo de Chocolate', 15.00, 2),
('Croissant', 3.50, 2),
('Picanha', 49.90, 3),
('Alcatra', 32.50, 3),
('Coxa de Frango', 8.90, 3),
('Queijo Muçarela', 25.00, 4),
('Iogurte Natural', 3.20, 4),
('Presunto', 22.00, 4),
('Suco de Laranja', 6.50, 5),
('Refrigerante Cola', 5.00, 5),
('Água Mineral 1L', 2.00, 5),
('Arroz Branco', 4.75, 6),
('Feijão Carioca', 7.50, 6),
('Macarrão Espaguete', 3.20, 6),
('Detergente Líquido', 2.50, 7),
('Sabão em Pó', 8.99, 7),
('Desinfetante', 3.75, 7);

INSERT INTO VENDA (matEmp, dataVenda) VALUES
(1023, '2024-01-15 10:23:45'),
(1024, '2024-02-22 14:30:00'),
(1025, '2024-03-12 09:15:30'),
(1026, '2024-04-18 16:45:20'),
(1027, '2024-05-25 08:05:10'),
(1028, '2024-06-30 13:50:55'),
(1029, '2024-07-04 18:20:40');

INSERT INTO contem (idVenda, codigoProduto, quantidade) VALUES
(1, 1, 3),
(1, 2, 1),
(2, 3, 4),
(2, 4, 1),
(3, 5, 5),
(3, 6, 9),
(4, 7, 2),
(4, 8, 6),
(5, 9, 5),
(5, 10, 3),
(6, 11, 5),
(6, 12, 8),
(7, 13, 9),
(7, 14, 7);