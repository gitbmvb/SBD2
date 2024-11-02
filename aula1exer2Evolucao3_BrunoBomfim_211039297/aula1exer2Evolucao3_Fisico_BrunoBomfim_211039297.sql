-- ---------------------   << aula1exer2evolucao3 >>   ---------------------
--
--                    SCRIPT DE CRIAÇÃO
-- 
-- Data Criacao ...........: 31/10/2024
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
--   31/10/2024 => Transforma GERENTE.cpf e EMPREGADO.cpf em PKs;
--              => Converte telefone.matricula e telefone.telefone em PK de telefone;
--              => Reescreve AREA.cpf como AREA.fkCpfGerente;
--              => Reescreve PRODUTO.idArea como PRODUTO.fkIdArea;
--              => Reescreve VENDA.matricula como VENDA.fkMatEmp;
--              => Reescreve possui.codigo como possui.fkCodProd;
--              => Reescreve possi.idVenda como possui.fkIdVenda;
--              => Transforma possui.fkCodProd e possui.fkIdVenda em PK composta de possui;
--              => Adiciona restrição "on update cascade on delete restrict" em todas as fks, com exceção de GERENTE e EMPREGADO;
--              => Adiciona auto_increment à AREA.idArea, PRODUTO.codigo e VENDA.idVenda;
--              => Adiciona zerofill nos campos de cpf de todas a tabelas
-- -------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2evolucao3;
USE aula1exer2evolucao3;

CREATE TABLE PESSOA (
    cpf BIGINT(11) ZEROFILL NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE EMPREGADO (
    cpf BIGINT(11) ZEROFILL NOT NULL PRIMARY KEY,
    matricula INT NOT NULL UNIQUE,
    cep INT NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE GERENTE (
    cpf BIGINT(11) ZEROFILL NOT NULL PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    formacaoEscolar VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE PRODUTO (
    codigo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nomeProd VARCHAR(50) NOT NULL,
    precoUnitario DECIMAL(10,2) NOT NULL,
    fkIdArea INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE VENDA (
    idVenda INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    dataVenda DATE NOT NULL,
    fkMatEmp INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE telefone (
    matricula INT NOT NULL,
    telefone BIGINT(11) NOT NULL,
    PRIMARY KEY (matricula, telefone)
) ENGINE = InnoDB;

CREATE TABLE possui (
    fkCodProd INT NOT NULL,
    fkIdVenda INT NOT NULL,
    quantidadeProduto INT NOT NULL,
    PRIMARY KEY (fkCodProd, fkIdVenda)
) ENGINE = InnoDB;

CREATE TABLE AREA (
    idArea INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nomeArea VARCHAR(50) NOT NULL,
    fkCpfGerente BIGINT(11) ZEROFILL NOT NULL
) ENGINE = InnoDB;
 
ALTER TABLE EMPREGADO ADD CONSTRAINT FK_EMPREGADO_1
    FOREIGN KEY (cpf)
    REFERENCES PESSOA (cpf)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE GERENTE ADD CONSTRAINT FK_GERENTE_1
    FOREIGN KEY (cpf)
    REFERENCES PESSOA (cpf)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_2
    FOREIGN KEY (fkIdArea)
    REFERENCES AREA (idArea)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_2
    FOREIGN KEY (fkMatEmp)
    REFERENCES EMPREGADO (matricula)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE telefone ADD CONSTRAINT FK_telefone_1
    FOREIGN KEY (matricula)
    REFERENCES EMPREGADO (matricula)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fkCodProd)
    REFERENCES PRODUTO (codigo)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fkIdVenda)
    REFERENCES VENDA (idVenda)
    ON DELETE RESTRICT ON UPDATE CASCADE;
 
ALTER TABLE AREA ADD CONSTRAINT FK_AREA_2
    FOREIGN KEY (fkCpfGerente)
    REFERENCES GERENTE (cpf)
    ON DELETE RESTRICT ON UPDATE CASCADE;
