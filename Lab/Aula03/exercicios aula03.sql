drop database if exists aula3;
create database aula3;
use aula3;

#QUESTAO 1
#A função de uma chave primária é identificar cada registro do banco de dados, facilitando a manipulação
# e a vinculação das informações contidas nele


#QUESTAO 2
create table if not exists pessoa(
	id int not null auto_increment primary key,
    nome varchar(45),
    endereco varchar(45),
    cargo varchar(45)
);

# Letra A
insert into pessoa(nome, endereco, cargo) values('Joao', 'Rua das Palmeiras, 200', 'Medico');
insert into pessoa(nome, endereco, cargo) values ('Junior', 'Avenida XV de Julho, 43', 'Engenheiro');
insert into pessoa(nome, endereco, cargo) values ('Maria', 'Rua Luiz de Souza, 12' , 'Veterinária');

select * from pessoa;

#LETRA B
update pessoa
set nome = 'Julia'
where id = 1;

select * from pessoa;

#LETRA C
select nome, endereco from pessoa;

#LETRA D 
delete from pessoa
where id = 3;
select * from pessoa;

SET SQL_SAFE_UPDATES = 0;



#QUESTAO 3
create table empresa(
	matricula int not null auto_increment primary key,
    nome varchar(45),
    cpf varchar(45),
    cargo varchar(45),
    nProjetos int
);

#LETRA A
insert into empresa(nome, cpf, cargo, nProjetos) values ('Junior', '000.000.000-00', 'GP', 2);
insert into empresa(nome, cpf, cargo, nProjetos) values ('Maria', '111.111.111-11', 'Desenvolvedor', 3);
insert into empresa(nome, cpf, cargo, nProjetos) values ('Carlos', '222.222.222-22', 'Tester', 4);
insert into empresa(nome, cpf, cargo, nProjetos) values ('Julia', '333.333.333-33', 'Desenvolvedor', 5);

select * from empresa;

#LETRA B
select count(nProjetos)
from empresa
where nProjetos >= 4;

#LETRA C
select max(nProjetos), nome, cpf, cargo from empresa;
select min(nProjetos), nome, cpf, cargo from empresa;

#LETRA D
select avg (nProjetos)
from empresa
where cargo != 'GP';

#LETRA E
select distinct cargo from empresa;

#LETRA F
select nome, cpf, nProjetos from empresa
where cargo = 'Desenvolvedor';

#QUESTAO 4
create table aluno(
	matricula int not null primary key,
    nome varchar(45),
    endereco varchar(45),
    ano_nasc int,
    curso varchar(45)
);

#4.Insercoes erradas:
# Letra B, pois a matrícula não deve ser gerada automaticamente
# C pois a matrícula é chave primária, portanto deve ser inserida
# D, pois a chave primaria é a mesma da letra A.

#LETRA F
insert into aluno(nome, matricula, endereco, ano_nasc, curso) values ('Janaina', '123', 'Rua 1', '1998', 'GEB');
insert into aluno(nome, matricula, endereco, ano_nasc, curso) values ('Jander', '132', 'Rua 3', '1999', 'GEC');
insert into aluno(nome, matricula, endereco, ano_nasc, curso) values ('Lucca', '321', 'Rua 4', '1998', 'GEB');
insert into aluno(nome, matricula, endereco, ano_nasc) values ('Laura', '456', 'Rua 5', '1998');

select nome, matricula, curso from aluno
where nome like 'Jan____%';


#LETRA G
select nome, curso from aluno
where nome like 'L%A';

#LETRA H
select distinct ano_nasc, curso from aluno;

#LETRA I
select ano_nasc, curso from aluno
where ano_nasc <= 1998;

#LETRA J
select * from aluno limit 3;

#LETRA K
update alunos01
set endereco = 'Rua X'
where curso = 'GEB';
select * from aluno;

#LETRA L
delete from aluno
where curso = 'GEB';
select * from aluno;


