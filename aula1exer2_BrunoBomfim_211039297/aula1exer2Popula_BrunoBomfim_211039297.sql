-- -------- < aula1exer2 > --------
--
--                    SCRIPT DE INSERCAO (DML)
--
-- Data Criacao ...........: 21/10/2024
-- Autor(es) ..............: Bruno Martins Valério Bomfim
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
-- 
-- Ultimas Alteracoes
--   21/10/2024 => Finalizando o script de inserção de tabelas
-- ---------------------------------------------------------

USE aula1exer2;

INSERT INTO EMPREGADO (cpf, matricula, nome, senha, logradouro, cep, estado, cidade, bairro, numero, complemento)
VALUES
(95505579108, 314159265, 'João Silva', 'abc123', 'W3 Sul', 70350530, 'DF', 'Brasília', 'Asa Sul', 101, 'Apto 202'),
(87941875179, 271828182, 'Maria Souza', 'sbd220242', 'Avenida Central', 23456789, 'RJ', 'Rio de Janeiro', 'Botafogo', 202, NULL),
(75069963163, 211039297, 'Carlos Lima', 'carlosobrabo', 'Rua Principal', 34567890, 'MG', 'Belo Horizonte', 'Savassi', 303, 'Bloco B');

INSERT INTO GERENTE (cpf, nome, email, senha, formacaoEscolar)
VALUES
(53077851199, 'João Silva', 'joao.silva@email.com', '123456', 'Primário'),
(38588042150, 'Maria Souza', 'maria.souza@email.com', 'souzaMaria5', 'Médio'),
(50024981168, 'Carlos Lima', 'carlos.lima@email.com', 'limaTheCarlos', 'Superior');

INSERT INTO VENDA (precoTotal, fkCpfEmpregado)
VALUES
(175.25, 95505579108),
(75.25, 87941875179),
(300.00, 75069963163);

INSERT INTO PRODUTO (nome, precoUnitario)
VALUES
('Produto A', 50.00),
('Produto B', 75.25),
('Produto C', 100.00);

INSERT INTO telefone (fkCpfEmpregado, telefone)
VALUES
(95505579108, 61982797803),
(87941875179, 11930879728),
(75069963163, 61983326501);

INSERT INTO supervisiona (fkCpfEmpregado, fkCpfGerente)
VALUES
(95505579108, 53077851199),
(87941875179, 38588042150),
(75069963163, 50024981168);

INSERT INTO contem (fkIdVenda, fkIdProduto, qtd)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 2, 1),
(3, 3, 3);
