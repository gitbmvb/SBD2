-- ---------------------   << Empresa >>   ---------------------
--
--                    SCRIPT DE CRIAÇÃO (DDL)
-- 
-- Data Criacao ...........: 20/10/2024
-- Autor(es) ..............: Raquel Ferreira Andrade, Bruno Martins Valério Bomfim
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 03 Papéis (roles)
--         => 08 usuários
-- 
-- Ultimas Alteracoes
--   25/10/2024 => Transforma GERENTE.idGerente e EMPREGADO.matricula de chaves primárias para valores unique;
--              => Coloca todos os atributos como "not null";
--              => Remove precoTotal de venda para evitar problemas de inconsistência;
--              => Adiciona entidade/tabela AREA;
--              => Adiciona cpf em GERENTE e EMPREGADO como PK e FK (relação parcial sobreposição);
--              => Incluido auto_increment na tabelas PRODUTO, VENDA, e AREA;
--              => Altera VENDA.dataVenda para timestamp.
-- -------------------------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS aula1exer2;
USE aula1exer2;

-- TABELAS
CREATE TABLE PESSOA (
    cpf bigint (11) zerofill PRIMARY KEY,
    nome varchar (100) not null,
    senha varchar (20) not null
) ENGINE = InnoDB;

CREATE TABLE GERENTE (
    cpf bigint (11) zerofill PRIMARY KEY,
    idGerente int(4) not null UNIQUE,
    escolaridade varchar (20) not null,
    email varchar (30) not null
) ENGINE = InnoDB;

CREATE TABLE EMPREGADO (
    cpf bigint (11) zerofill PRIMARY KEY,
    matricula int (4) not null UNIQUE,
    cep int (7) zerofill not null,
    cidade varchar (30) not null,
    bairro varchar (20) not null,
    rua varchar (20) not null,
    numero int (4) not null
) ENGINE = InnoDB;

CREATE TABLE VENDA (
    idVenda bigint auto_increment PRIMARY KEY,
    matEmp int (4),
    dataVenda timestamp not null default CURRENT_TIMESTAMP
) ENGINE = InnoDB;

CREATE TABLE PRODUTO (
    codigoProduto bigint auto_increment PRIMARY KEY,
    nomeProduto varchar (30),
    precoUni float (7,2),
    fkIdArea bigint
) ENGINE = InnoDB;

CREATE TABLE telefone (
    matricula int (4),
    telefone bigint (11) zerofill,
    PRIMARY KEY (matricula, telefone)
) ENGINE = InnoDB;

CREATE TABLE supervisiona (
    idGerente int(4),
    matricula int (4),
    PRIMARY KEY (idGerente, matricula)
) ENGINE = InnoDB;

CREATE TABLE contem (
    idVenda bigint,
    codigoProduto bigint,
    quantidade int (4),
    PRIMARY KEY (idVenda, codigoProduto)
) ENGINE = InnoDB;

CREATE TABLE AREA (
    idArea bigint auto_increment PRIMARY KEY,
    nome varchar (20),
    descricao varchar (100),
    fkIdGerente int(4)
) ENGINE = InnoDB;
 
ALTER TABLE GERENTE ADD CONSTRAINT FK_GERENTE_1
    FOREIGN KEY (cpf)
    REFERENCES PESSOA (cpf)
    ON DELETE cascade ON UPDATE cascade;
 
ALTER TABLE EMPREGADO ADD CONSTRAINT FK_EMPREGADO_3
    FOREIGN KEY (cpf)
    REFERENCES PESSOA (cpf)
    ON DELETE cascade ON UPDATE cascade;
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_2
    FOREIGN KEY (matEmp)
    REFERENCES EMPREGADO (matricula)
    ON DELETE restrict ON UPDATE cascade;
 
ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_2
    FOREIGN KEY (fkIdArea)
    REFERENCES AREA (idArea)
    ON DELETE restrict ON UPDATE cascade;
 
ALTER TABLE telefone ADD CONSTRAINT FK_telefone_1
    FOREIGN KEY (matricula)
    REFERENCES EMPREGADO (matricula)
    ON DELETE restrict ON UPDATE cascade;
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_1
    FOREIGN KEY (idGerente)
    REFERENCES GERENTE (idGerente)
    ON DELETE restrict ON UPDATE cascade;
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_2
    FOREIGN KEY (matricula)
    REFERENCES EMPREGADO (matricula)
    ON DELETE restrict ON UPDATE cascade;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_1
    FOREIGN KEY (idVenda)
    REFERENCES VENDA (idVenda)
    ON DELETE restrict ON UPDATE cascade;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_2
    FOREIGN KEY (codigoProduto)
    REFERENCES PRODUTO (codigoProduto)
    ON DELETE restrict ON UPDATE cascade;
 
ALTER TABLE AREA ADD CONSTRAINT FK_AREA_2
    FOREIGN KEY (fkIdGerente)
    REFERENCES GERENTE (idGerente)
    ON DELETE restrict ON UPDATE cascade;