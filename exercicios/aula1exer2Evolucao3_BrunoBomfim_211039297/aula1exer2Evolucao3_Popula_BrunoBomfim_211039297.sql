-- ---------------------   << aula1exer2evolucao3 >>   ---------------------
--
--                    SCRIPT DE POPULAR
-- 
-- Data Criacao ...........: 01/11/2024
-- Autor(es) ..............: Bruno Martins Valério Bomfim
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2evolucao3
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 03 Papéis
--         => 08 usuários
--
-- Ultimas Alteracoes
--   01/11/2024 => Adiciona mais 3 linhas em cada tabela da base de dados;
-- -------------------------------------------------------------------------

use aula1exer2evolucao3;

INSERT INTO PESSOA (cpf, nome, senha) VALUES
(12345678901, 'Ana Silva', 'Ana$2023@senha'),
(23456789012, 'Bruno Costa', 'Bruno!4567senha'),
(34567890123, 'Carlos Lima', 'Carlos#pass123'),
(45678901234, 'Daniela Santos', 'Dani@998senha'),
(56789012345, 'Eduardo Ferreira', 'Edu12345*senha'),
(67890123456, 'Fernanda Azevedo', 'Fer%senha987'),
(78901234567, 'Gabriel Souza', 'Gabriel_senha77'),
(89012345678, 'Helena Rocha', 'Helena!789senha'),
(90123456789, 'Igor Mendes', 'Igor@2024senha'),
(11223344556, 'Juliana Martins', 'Juli#password'),
(22334455667, 'Lucas Oliveira', 'Lucas!senha000'),
(33445566778, 'Mariana Pereira', 'Mari%pass123'),
(44556677889, 'Nicolas Monteiro', 'Nic_pass4567'),
(55667788990, 'Olivia Almeida', 'Olivia%newsenha'),
(66778899001, 'Paulo Ribeiro', 'Paulo@secret*2'),
(77889900112, 'Renata Correia', 'Renata#pass20'),
(88990011223, 'Sofia Machado', 'Sofi@789senha'),
(99001122334, 'Thiago Barreto', 'Thiago_pass2022'),
(10111213141, 'Vinicius Gonçalves', 'Vin!senha#2023'),
(11121314151, 'Yasmin Duarte', 'Yasmin!secure1');

INSERT INTO EMPREGADO (cpf, matricula, cep, estado, cidade, bairro, rua, numero) VALUES
(12345678901, 1001, 70040902, 'Distrito Federal', 'Brasília', 'Asa Norte', 'SQN 102 Bloco B', 201),
(23456789012, 1002, 30140900, 'Minas Gerais', 'Belo Horizonte', 'Savassi', 'Rua Pernambuco', 110),
(34567890123, 1003, 11025100, 'São Paulo', 'São Paulo', 'Jardins', 'Avenida Paulista', 1578),
(45678901234, 1004, 40060160, 'Bahia', 'Salvador', 'Pituba', 'Rua Ceará', 215),
(56789012345, 1005, 88015120, 'Santa Catarina', 'Florianópolis', 'Centro', 'Rua Felipe Schmidt', 404),
(67890123456, 1006, 60025100, 'Ceará', 'Fortaleza', 'Aldeota', 'Avenida Santos Dumont', 133),
(78901234567, 1007, 69010110, 'Amazonas', 'Manaus', 'Centro', 'Rua Henrique Martins', 590),
(89012345678, 1008, 13025100, 'São Paulo', 'Campinas', 'Taquaral', 'Rua Dr. Heitor Penteado', 1520),
(90123456789, 1009, 20040110, 'Rio de Janeiro', 'Rio de Janeiro', 'Centro', 'Rua do Ouvidor', 120),
(11223344556, 1010, 60060340, 'Ceará', 'Fortaleza', 'Meireles', 'Rua Oswaldo Cruz', 405),
(11121314151, 1011, 70350530, 'Distrito Federal', 'Brasília', 'Asa Sul', 'CRS 505 Bloco C', 19);

INSERT INTO telefone (matricula, telefone) VALUES
(1001, 61985671234),
(1002, 61993456789),
(1003, 61897654321),
(1004, 61998765432),
(1005, 61789123456),
(1006, 61981234567),
(1007, 61899876543),
(1008, 61990123456),
(1009, 61671234567),
(1010, 61987654321);

INSERT INTO GERENTE (cpf, email, formacaoEscolar) VALUES
(22334455667, 'maria.silva@empresa.com', 'Primário'),
(33445566778, 'joao.souza@empresa.com', 'Superior'),
(44556677889, 'ana.costa@empresa.com', 'Mestrado'),
(55667788990, 'pedro.almeida@empresa.com', 'Superior'),
(66778899001, 'juliana.rocha@empresa.com', 'Doutorado'),
(77889900112, 'carlos.mendes@empresa.com', 'Médio'),
(88990011223, 'fernanda.oliveira@empresa.com', 'Mestrado'),
(99001122334, 'ricardo.lima@empresa.com', 'Primário'),
(10111213141, 'patricia.santos@empresa.com', 'Superior'),
(11121314151, 'roberto.silva@empresa.com', 'Médio');

INSERT INTO AREA (nomeArea, fkCpfGerente) VALUES
('Hortifruti', 22334455667),
('Padaria', 33445566778),
('Açougue', 22334455667),
('Frios e Laticínios', 55667788990),
('Bebidas', 66778899001),
('Mercearia', 77889900112),
('Limpeza', 88990011223),
('Perfumaria', 99001122334),
('Eletrodomésticos', 10111213141),
('Papelaria', 11121314151);

INSERT INTO PRODUTO (nomeProd, precoUnitario, fkIdArea) VALUES
('Maçã Gala', 4.99, 1),
('Banana Prata', 3.49, 1),
('Pão Francês', 0.60, 2),
('Bolo de Chocolate', 15.99, 2),
('Carne Bovina - Alcatra', 39.90, 3),
('Carne Suína - Lombo', 29.90, 3),
('Queijo Mussarela', 34.90, 4),
('Iogurte Natural', 4.50, 4),
('Suco de Laranja', 8.99, 5),
('Refrigerante Cola', 5.99, 5),
('Arroz Tipo 1', 19.90, 6),
('Feijão Carioca', 7.99, 6),
('Detergente Líquido', 3.99, 7),
('Sabão em Pó', 12.99, 7),
('Shampoo Neutro', 14.90, 8),
('Desodorante Roll-on', 9.90, 8),
('Liquidificador 500W', 129.90, 9),
('Ferro de Passar', 79.90, 9),
('Caderno 200 Folhas', 12.50, 10),
('Caneta Esferográfica', 1.99, 10);

INSERT INTO VENDA (dataVenda, fkMatEmp) VALUES
('2024-01-15', 1001),
('2024-02-10', 1002),
('2024-03-05', 1003),
('2024-04-20', 1004),
('2024-05-12', 1005),
('2024-06-08', 1006),
('2024-07-19', 1007),
('2024-08-23', 1008),
('2024-09-30', 1009),
('2024-10-25', 1001);

INSERT INTO possui (fkCodProd, fkIdVenda, quantidadeProduto) VALUES
(1, 1, 3),
(2, 1, 1),
(3, 2, 4),
(4, 2, 1),
(5, 3, 5),
(6, 3, 9),
(5, 4, 2),
(6, 4, 6),
(9, 5, 5),
(10, 5, 3),
(11, 6, 5),
(12, 6, 8),
(13, 7, 9),
(14, 7, 7),
(15, 8, 9),
(16, 8, 3),
(17, 9, 2),
(18, 9, 3),
(19, 9, 8),
(20, 10, 4),
(1, 10, 6),
(2, 10, 2);
