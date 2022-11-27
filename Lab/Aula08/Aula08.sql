drop database if exists Aula08;
create database if not exists Aula08;

use Aula08;

create table if not exists alunos(
	matricula int not null auto_increment primary key,
    curso varchar(45),
    nome varchar(45),
    periodo int
    );
    
create user "Monitor" identified by '1234';
alter table alunos modify nome varchar(100) not null; # Modifica o campo nome 
alter table alunos add endereco varchar(45); # Adiciona o campo endereco
alter table alunos drop periodo; # Apaga o campo periodo

drop user 'Monitor';

show databases;
show tables;

