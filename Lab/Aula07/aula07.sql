drop database if exists C207;
create database C207;

use C207;

create table alunos(
	matricula INT,
    curso VARCHAR(45),
    nome VARCHAR(45),
    periodo INT,
	primary key(matricula, curso)
);

# criando usuario
drop user 'Monitor';
drop user 'Professor';

create user 'Monitor' identified by '111#GEC';
create user 'Renzo' identified by '999#GEC';

# apagando usuario
drop user 'Monitor';

# setando todas as permissoes
grant all privileges on C207.* to 'Monitor';

# setando algumas permissões
grant select, insert, update, delete on C207.* to 'Professor';

# removendo permissões
revoke insert on C207.* from 'Monitor';
revoke select, insert on C207.* from 'Professor';

# ver privilégios
show grants for 'Monitor';