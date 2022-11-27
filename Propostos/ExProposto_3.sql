# Ex1
select distinct parentesco from Dependente;
# Ex2
select Unome, DataNasc from Empregado where Sexo = '1' order by DataNasc;
#Ex3
select Nome_Dependente, PNome from Dependente, Empregado where SSN_Empregado = SSN;
#Ex4 - deu ruim
select avg(emp.Salario) from Empregado as emp, Departamento as dep where emp.Endereco like "%São Paulo"
and dep.DNome = 'Engenharia';
#Ex5 
select sup.PNome as 'Superior', emp.Pnome as 'Empregado', sup.Salario - emp.Salario as 'Diferença'
from Empregado as emp, Empregado as sup where emp.SSN_Supervisor = sup.SSN;
#Ex6
select emp.PNome as 'Empregado', pro.PNome as 'Projeto', tra.Horas from Empregado as emp, Projeto as pro, Trabalha_em as tra
where tra.SSN_Empregado = emp.SSN and tra.PNumero_Projeto = pro.PNumero;