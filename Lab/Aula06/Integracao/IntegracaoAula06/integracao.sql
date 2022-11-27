drop database if exists integracao;
create database integracao;

use integracao;

create table user(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    cpf varchar(45) not null 
);

select * from user;


