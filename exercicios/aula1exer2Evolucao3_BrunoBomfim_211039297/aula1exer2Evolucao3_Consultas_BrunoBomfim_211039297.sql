-- ---------------------   << aula1exer2evolucao3 >>   ---------------------
--
--                    SCRIPT DE CONSULTAS
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
-- -------------------------------------------------------------------------

USE aula1exer2evolucao3;

-- A) Consultar todas as vendas feitas por um empregado específico que será
-- definido pelo usuário através da chave primária do empregado nessa pesquisa
-- (usuário definirá um empregado específico na consulta);

SELECT idVenda, dataVenda from VENDA where fkMatEmp = 1001;

-- B) Relacionar todos os dados de uma venda específica com todas as informações dos
-- produtos comercializados por esta venda e mostrar o preço total por item da venda
-- (usuário definirá uma venda específica na consulta);

select idVenda, nomeProd, precoUnitario, quantidadeProduto, quantidadeProduto * precoUnitario as subtotal
from possui as p
join VENDA as V on p.fkIdVenda = V.idVenda
join PRODUTO as P on p.fkCodProd = P.codigo
where idVenda = 9
group by fkCodProd, fkIdVenda;


-- C) Mostrar todos os empregados da empresa que NÃO sejam gerentes em ordem alfabética
-- crescente do nome do empregado;

select P.nome
from EMPREGADO as E
left join GERENTE as G on E.cpf = G.cpf
join PESSOA as P on E.cpf = P.cpf
where G.cpf is null
order by P.nome asc;


-- D) Consultar e mostrar a quantidade de CADA produto que foi vendido por esta empresa
-- (lembrar que só o código do produto NÃO identifica qual produto é para vários
-- funcionários ou usuários finais da empresa, então reflita de quais atributos deverão
-- ser apresentados e em qual sequência (ordenação) para atender o interesse do usuário
-- final em suas atividades diárias com melhor qualidade e eficiência). Esta consulta
-- deverá ser implementada como uma VIEW (visão em SQL);

create view qtd_cada_produto as
select p.codigo, p.nomeProd, a.nomeArea, sum(quantidadeProduto) as qtd_total_vendido
from possui as po
join PRODUTO as p on po.fkCodProd = p.codigo
join AREA as a on p.fkIdArea = a.idArea
group by p.codigo
order by p.nomeProd;

select * from qtd_cada_produto;

-- E) Solicitar ao usuário qualquer parte do nome de um produto e apresentar seu código,
-- nome e quantidade de vendas em ordem alfabética do nome do produto de forma decrescente.

select p.codigo, p.nomeProd, count(*) as qtd_vendas from
possui as po join PRODUTO as p on po.fkCodProd = p.codigo
where p.nomeProd like '%Carne%'
group by p.codigo
order by p.nomeProd desc;
