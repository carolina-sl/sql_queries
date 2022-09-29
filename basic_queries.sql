-- selecionando o banco de dados
use users;

-- criando uma tabela

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    username VARCHAR(11),
    password VARCHAR(255),
    role VARCHAR(20),
    created DATETIME,
    modified DATETIME
);

-- selecionando todos os dados de uma tabela

select * from users;
select * from livros;
select * from leituras;

-- delete from users;
-- drop table leituras;

-- inserindo dados em uma tabela
insert into users (id, nome, username, password, role, created, modified) values
(null, 'Carolina Serafim Lauffer',  '11122233355', '125125', 0, '2021-12-21', '2022-01-07', 'avenida brasil 123');

-- adicionando uma coluna a uma tabela ja existente
alter table users add nome varchar (255);


-- deletando uma linha de uma tabela
delete from users
where id = 3;

-- atualizando um dado de uma tabela
UPDATE users
SET leitura_id = 1
WHERE id = 1;

-- excluindo uma coluna de uma tabela já existente
alter table enderecos drop column user_id;

-- mostrando as tabelas de um banco de dados
show tables;

-- adicionando uma coluna em uma tabela já existente
ALTER TABLE users add COLUMN leitura_id int;


-- renomenando uma tabela
RENAME TABLE situacao_livros TO situacao_leituras;

-- adicionando uma coluna a uma tabela ja existente
alter table livros add qtd_pagina int;

-- consulta com 3 tabela usando inner join, dados em comum entre as três tabelas
select  nome,
		user_id,
		titulo
	from leituras
inner join livros
	on (livros.id = leituras.livro_id)
inner join users
	on (leituras.user_id = users.id);

-- descrevendo a tabela livros
desc livros;

-- contando um total de linhas na tabela users
select count(id) as 'total de estados'
from users;

-- adicionando uma nova coluna (dt_nascimento) na tabela depois da coluna password
ALTER TABLE `users` ADD `dt_nascimento` DATETIME(6) AFTER `password`;


-- somando o total de pessoas que não tem endereço
SELECT
	sum(case
		when endereco_id is null then 1
    end) as 'lista de endereços'
FROM
    users;
   
  select * from users;


-- somando o total de usuários maiores de 18 anos

 SELECT
    nome,
    dt_nascimento,
	SUM(CASE 
		WHEN TIMESTAMPDIFF(year, dt_nascimento, now()) >= 18 THEN 1
        ELSE 0
    END) AS 'usuários maiores de 18 anos'
FROM
    users;

-- -------------------
    
select datediff(now(), '1989-04-12');

-- descobrindo a idade de alguém
SELECT TIMESTAMPDIFF(YEAR, '1989-04-12', NOW()) as minha_idade;






