-- -------- < aula1exer2 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
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
--   21/10/2024 => Finalizando script de criação da database e tabelas.
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2;
USE aula1exer2;

CREATE TABLE EMPREGADO (
    cpf BIGINT(11) NOT NULL PRIMARY KEY,
    matricula BIGINT(9) CHECK(matricula > 0),
    nome VARCHAR(30) NOT NULL,
    senha VARCHAR(15) NOT NULL,
    logradouro VARCHAR(100),
    cep INT(8) CHECK(cep BETWEEN 10000000 AND 99999999),
    estado CHAR(2) CHECK(CHAR_LENGTH(estado) = 2),
    cidade VARCHAR(20),
    bairro VARCHAR(20),
    numero INT(4) CHECK(numero > 0),
    complemento VARCHAR(30)
);

CREATE TABLE GERENTE (
    cpf BIGINT(11) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    senha VARCHAR(15) NOT NULL,
    formacaoEscolar VARCHAR(20) NOT NULL CHECK(CHAR_LENGTH(formacaoEscolar) > 0),
    CHECK(email LIKE '%_@__%.__%')
);

CREATE TABLE VENDA (
    idVenda BIGINT AUTO_INCREMENT PRIMARY KEY,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    precoTotal DECIMAL(11,2) DEFAULT 0.00 CHECK(precoTotal >= 0),
    fkCpfEmpregado BIGINT(11) NOT NULL
);

CREATE TABLE PRODUTO (
    idProduto BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    precoUnitario DECIMAL(11,2) NOT NULL CHECK(precoUnitario >= 0)
);

CREATE TABLE telefone (
    fkCpfEmpregado BIGINT(11) NOT NULL,
    telefone BIGINT(11) CHECK(telefone BETWEEN 1000000000 AND 99999999999),
    PRIMARY KEY (fkCpfEmpregado, telefone)
);

CREATE TABLE supervisiona (
    fkCpfEmpregado BIGINT(11) NOT NULL,
    fkCpfGerente BIGINT(11) NOT NULL,
    PRIMARY KEY (fkCpfEmpregado, fkCpfGerente)
);

CREATE TABLE contem (
    fkIdVenda BIGINT NOT NULL,
    fkIdProduto BIGINT NOT NULL,
    qtd INT NOT NULL CHECK(qtd > 0),
    PRIMARY KEY (fkIdVenda, fkIdProduto)
);
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_2
    FOREIGN KEY (fkCpfEmpregado)
    REFERENCES EMPREGADO (cpf)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE telefone ADD CONSTRAINT FK_telefone_2
    FOREIGN KEY (fkCpfEmpregado)
    REFERENCES EMPREGADO (cpf)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_1
    FOREIGN KEY (fkCpfEmpregado)
    REFERENCES EMPREGADO (cpf)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_2
    FOREIGN KEY (fkCpfGerente)
    REFERENCES GERENTE (cpf)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_1
    FOREIGN KEY (fkIdVenda)
    REFERENCES VENDA (idVenda)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_2
    FOREIGN KEY (fkIdProduto)
    REFERENCES PRODUTO (idProduto)
    ON DELETE RESTRICT ON UPDATE CASCADE;

DELIMITER //
CREATE TRIGGER supervisiona_check
BEFORE INSERT ON supervisiona
FOR EACH ROW
BEGIN
    IF NEW.fkCpfEmpregado = NEW.fkCpfGerente THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'fkCpfEmpregado não pode ser igual a fkCpfGerente';
    END IF;
END //
