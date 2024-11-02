-- ---------------------   << Empresa >>   ---------------------
--
--                    SCRIPT DE CONTROLE
-- 
-- Data Criacao ...........: 26/10/2024
-- Autor(es) ..............: Bruno Martins Valério Bomfim
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 03 Papéis (roles)
--         => 08 usuários
-- 
-- Ultimas Alteracoes
--   26/10/2024 => Criando roles e usuários;
-- -------------------------------------------------------------------------


drop role if exists empregado;
drop role if exists gerente;
drop role if exists superior;
create role 'empregado'@'%';
create role 'gerente'@'%';
create role 'superior'@'%';

-- privilégios de empregado
grant select on aula1exer2.* to empregado;
grant insert on aula1exer2.VENDA to empregado;
grant insert on aula1exer2.contem to empregado;

-- privilégios de gerente
grant select, insert, delete, update on aula1exer2.PRODUTO to gerente;
grant select, insert, delete, update on aula1exer2.VENDA to gerente;
grant select, insert, delete, update on aula1exer2.contem to gerente;
grant select, insert, delete, update on aula1exer2.supervisiona to gerente;
grant select, insert, delete, update on aula1exer2.telefone to gerente;
grant select, insert, delete, update on aula1exer2.AREA to gerente;
grant select on aula1exer2.PESSOA to gerente;
grant select on aula1exer2.EMPREGADO to gerente;
grant select on aula1exer2.GERENTE to gerente;

-- privilégios de superior
grant all privileges on aula1exer2.* to superior;

-- criando usuários
create user 'admins'@'%' identified by '1admin';
create user 'anamaria'@'%' identified by '2anam';
create user 'ruicarlos'@'%' identified by '3ruic';
create user 'maria'@'%' identified by '4maria';
create user 'paulo'@'%' identified by '5paulo';
create user 'jose'@'%' identified by '6jose';
create user 'giovana'@'%' identified by '7giovana';
create user 'pedro'@'%' identified by '8pedro';

-- designando papéis
grant superior to admins;
grant gerente to anamaria, ruicarlos;
grant empregado to maria, paulo, jose, giovana, pedro;