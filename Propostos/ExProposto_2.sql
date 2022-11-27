#1
insert into Departamento(DNumero, DataInicio, DNome) values (1, 10-10-22, 'Depto1');
insert into Departamento(DNumero, DataInicio, DNome) values (2, 20-10-22, 'Depto2');
#2
insert into Departamento(Dnumero, DNome) values (3, 'Depto3');
#3
insert into Empregado(SSN, PNome, Sexo, Endereco, DataNasc) values (1, 'Joao', 'M', 'Rua 01', 20-03-94);
insert into Empregado(SSN, PNome, Sexo, Endereco, DataNasc) values (2, 'Gabriel', 'M', 'Rua 02', 14-02-93);
insert into Empregado values (3, 'Enzo', 'M', 'D', 24-04-96, 'Rua 03', 'M', '1000', 1, 2);
insert into Empregado values (4, 'Fernanda', 'M', 'D', 24-04-91, 'Rua 04', 'F', '1500', 2, 3);
#4
insert into Projeto(PNumero, PNome) values (1, 'ProjetoBD');
insert into Projeto(PNumero, PNome) values (2, 'ProjetoPO');
insert into Projeto(PNumero, PNome) values (3, 'ProjetoLP');

#5
update Empregado
set SSN_Supervisor = 2 where SSN = 1;

update empregado
set SSN_Supervisor = 6 where SSN = 2;

update empregado
set SSN_Supervisor = 4 where SSN = 3;

#6
update empregado
set SSN_

#7 
update Projeto 
set PLocalizacao = 'Rua 01', DNumero_Departamento = 1  where PNumero = 1;

update Projeto
set Plocalizacao = 'Rua 02', DNumero_Departamento = 2 where PNumero = 2;

update Projeto
set Plocalizacao = 'Rua 03', DNumero_Departamento = 3 where PNumero = 3; 

#8
delete from Projeto
where DNumero_Departamento = 1;

