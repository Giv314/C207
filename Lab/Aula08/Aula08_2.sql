# Verificando a existência de banco e deletando
drop database if exists banco;

# Criando o banco de dados banco
create database banco;

# Determinando utilização
use banco;

# Criando a tabela cliente
create table cliente(
	numero int not null primary key,
    nome varchar(45),
    cpf varchar(45),
    endereco varchar(45)
    );
    
#Inserindo dois novos clientes
insert into cliente(numero, nome, cpf, endereco) values (10, 'Joao', '12345678', 'Rua01');
insert into cliente(numero, nome, cpf, endereco) values (15, 'Pedro', '24681012', 'Rua14');

#Incluindo nova coluna com o ano de nascimento
alter table cliente add ano_nascimento int;

#Atualizando clientes criados com o ano de nascimento
update cliente set ano_nascimento = 2000 where numero = 10;
update cliente set ano_nascimento = 1993 where numero = 15;

#Excluindo o primeiro usuario
delete from cliente where numero = 10;

# Mostrando clientes
select * from cliente;
