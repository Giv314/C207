create database if not exists exemplo;
use exemplo;

create table if not exists Aluno(
	id int not null auto_increment primary key,
    nome varchar(45),
    curso varchar(45),
    senha varchar(45)
);

DELIMITER $$
drop procedure if exists inserir $$
create procedure inserir(in nome varchar(45), in curso varchar(45))
begin
	insert into Aluno values(default, nome, curso, senha(nome, curso));
end $$
DELIMITER ;

DELIMITER $$
drop function if exists senha $$
create function senha(nome varchar(45), curso varchar(45)) returns float deterministic
begin
	return concat(nome, '#123', curso);
end $$
DELIMITER ;

call inserir('Pedro', 'GEC');
call inserir('Joao', 'GES');
select * from Aluno;