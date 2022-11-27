drop database if exists aula_procedure;
create database aula_procedure;
use aula_procedure;

create table Aluno(
	id int not null auto_increment primary key,
    nome varchar(50),
    idade int,
    curso varchar(3),
    email varchar(100)
);

DELIMITER $$
drop procedure if exists inserir $$
create procedure inserir(in nome varchar(45), in idade int, in curso varchar(3))
begin
	insert into Aluno values(default, nome, idade, curso, email(nome, curso));
end $$
DELIMITER ;

DELIMITER $$
drop function if exists email $$
create function email(nome varchar(45), curso varchar(3)) returns varchar(45)
deterministic
begin
	return concat(nome, '@', curso, '.inatel.br');
end $$
DELIMITER ;

call inserir('Pedro', 21, 'gec');
call inserir('Joao', 23, 'ges');
select * from Aluno;