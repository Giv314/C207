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