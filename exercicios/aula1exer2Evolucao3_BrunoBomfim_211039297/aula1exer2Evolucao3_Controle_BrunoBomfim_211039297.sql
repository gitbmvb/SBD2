-- ---------------------   << aula1exer2evolucao3 >>   ---------------------
--
--                    SCRIPT DE CONTROLE
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
--              => Simplifica código sql;
-- -------------------------------------------------------------------------

USE aula1exer2evolucao3;

-- Criação da role empregado
DROP ROLE IF EXISTS 'empregado';
CREATE ROLE 'empregado';

-- Concessão de privilégios para o empregado
GRANT SELECT ON aula1exer2evolucao3.* TO 'empregado';
GRANT INSERT ON aula1exer2evolucao3.VENDA TO 'empregado';
GRANT INSERT ON aula1exer2evolucao3.possui TO 'empregado';

-- Criação da role gerente
DROP ROLE IF EXISTS 'gerente';
CREATE ROLE 'gerente';

-- Concessão de privilégios para o gerente
GRANT SELECT ON aula1exer2evolucao3.* to 'gerente';
GRANT UPDATE, INSERT, DELETE ON aula1exer2evolucao3.possui TO 'gerente';
GRANT UPDATE, INSERT, DELETE ON aula1exer2evolucao3.PRODUTO TO 'gerente';
GRANT UPDATE, INSERT, DELETE ON aula1exer2evolucao3.VENDA TO 'gerente';
GRANT UPDATE, INSERT, DELETE ON aula1exer2evolucao3.telefone TO 'gerente';
GRANT UPDATE, INSERT, DELETE ON aula1exer2evolucao3.AREA TO 'gerente';

-- Criação da role superior
DROP ROLE IF EXISTS 'superior';
CREATE ROLE 'superior';

-- Concessão de privilégios para o superior
GRANT ALL ON aula1exer2evolucao3.* TO 'superior';

-- Criação de usuários
CREATE USER 'admins' IDENTIFIED BY '1admin';
CREATE USER 'anamaria' IDENTIFIED BY '2anam';
CREATE USER 'ruicarlos' IDENTIFIED BY '3ruic';
CREATE USER 'maria' IDENTIFIED BY '4maria';
CREATE USER 'paulo' IDENTIFIED BY '5paulo';
CREATE USER 'jose' IDENTIFIED BY '6jose';
CREATE USER 'giovana' IDENTIFIED BY '7giovana';
CREATE USER 'pedro' IDENTIFIED BY '8pedro';

-- Concessão de perfis para os usuários
GRANT superior TO 'admins';
GRANT gerente TO 'anamaria', 'ruicarlos';
GRANT empregado TO 'maria', 'paulo', 'jose', 'giovana', 'pedro';
