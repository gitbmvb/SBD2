-- -------- < aula1exer2 > --------
--
--                    SCRIPT DE REMOCAO (DDL)
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
-- ---------------------------------------------------------
USE aula1exer2;

DELETE FROM telefone;
DELETE FROM supervisiona;
DELETE FROM contem;
DELETE FROM VENDA;
DELETE FROM EMPREGADO;
DELETE FROM GERENTE;
DELETE FROM PRODUTO;
DROP TABLE telefone;
DROP TABLE supervisiona;
DROP TABLE contem;
DROP TABLE VENDA;
DROP TABLE EMPREGADO;
DROP TABLE GERENTE;
DROP TABLE PRODUTO;
COMMIT;
