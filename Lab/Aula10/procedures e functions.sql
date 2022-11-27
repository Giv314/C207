create database if not exists aula10;
use aula10;

DELIMITER $$
drop procedure if exists soma $$
create procedure soma(in num1 int, in num2 int)
begin
	select (num1+num2) as Soma;
end $$ 
DELIMITER ;

call soma(4,5);

drop procedure soma;

DELIMITER $$
drop function if exists mult $$
create function mult(a FLOAT, b FLOAT) returns float
deterministic
begin
	return a*b;
end $$
DELIMITER ;

select mult(2.5, 4.3);

drop function mult;
