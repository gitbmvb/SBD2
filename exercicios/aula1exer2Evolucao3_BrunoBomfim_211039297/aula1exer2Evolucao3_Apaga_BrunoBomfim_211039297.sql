-- ---------------------   << aula1exer2evolucao3 >>   ---------------------
--
--                    SCRIPT DE APAGAR
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
--   31/10/2024 => Atualiza nome da base de dados;
-- -------------------------------------------------------------------------

USE aula1exer2evolucao3;

DROP TABLE possui;
DROP TABLE telefone;
DROP TABLE VENDA;
DROP TABLE PRODUTO;
DROP TABLE AREA;
DROP TABLE GERENTE;
DROP TABLE EMPREGADO;
DROP TABLE PESSOA;

DROP ROLE 'empregado';
DROP ROLE 'gerente';
DROP ROLE 'superior';

DROP USER 'admins';
DROP USER 'anamaria';
DROP USER 'ruicarlos';
DROP USER 'maria';
DROP USER 'paulo';
DROP USER 'jose';
DROP USER 'giovana';
DROP USER 'pedro';

DROP VIEW qtd_cada_produto;
