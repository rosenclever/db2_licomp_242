
-- comando para acessar o servidor mysql
mysql -u root

-- comando para listar os bancos de dados existentes no servidor
show databases;

-- criar o banco bancodb_licomp_242
create database bancodb_licomp_242;

-- acessar o banco bancodb_licomp_242
use bancodb_licomp_242;

-- listar as tabelas existentes em um banco de dados
show tables;

-- criar a tabela bancos conforme slide 15
create table bancos(
numero integer not null,
nome varchar(100) not null,
constraint bancos_pk primary key(numero)
);

-- visualizar a estrutura da tabela bancos
desc bancos;

-- adicionar a coluna telefone, com tamanho 14 na tabela bancos
alter table bancos
add telefone varchar(14);

-- criar a tabela clientes, conforme especificado no slide 18
create table clientes(
    id int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    constraint clientes_pk primary key(id)
);

-- adicione à tabela clientes a coluna UF, do tipo caractere, com tamanho 2 e valor padrão 'RJ'
alter table clientes
add uf char(2) default 'RJ';

-- adicionar à tabela clientes as colunas dia e mês aniverário, do tipo inteiro e não obrigatórios
alter table clientes
add dia_niver int, 
add mes_niver int;

-- adicionando regras para dia e mes niver
alter table clientes
add constraint clientes_dia_ck check(dia_niver >= 1 and dia_niver <= 31),
add constraint clientes_mes_ck check(mes_niver >= 1 and mes_niver <= 31);

-- comando para listar as regras de um banco de dados
select constraint_name, constraint_type, table_name
from information_schema.table_constraints
where table_schema = 'bancodb_licomp_242';

-- comando para listar as checks
select constraint_name, check_clause
from information_schema.check_constraints
where constraint_schema = 'bancodb_licomp_242';