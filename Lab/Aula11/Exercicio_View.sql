drop database if exists loja;
create database loja;
use loja;
set global log_bin_trust_function_creators = 1;

create table compra(
	id int not null auto_increment primary key,
    preco float,
    pagamento float 
);

INSERT INTO compra VALUES (id, 9.5, 10.25);
INSERT INTO compra VALUES (id, 18.99, 25);
INSERT INTO compra VALUES (id, 3.99, 5);
INSERT INTO compra VALUES (id, 8.85, 8.89);
INSERT INTO compra VALUES (id, 19.49, 20);

#Ex1

create view BuscarCompras as (
select count(id)
from compra
where preco <= 10
);

select * from BuscarCompras;