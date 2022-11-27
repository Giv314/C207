# Exemplo de junção (JOIN)
# Buscar o nome de cada empregado, juntamente com o nome do seu departamento
# Para fazer o join, precisamos de um relacionamento

select E.pNome, D.DNome FROM empregado AS E, departamento AS D
WHERE E.DNumero_Departamento = D.Dnumero;


#Outra forma de fazer
select e.pNome, D.Dnome from empregado AS E INNER JOIN departamento AS D ON E.DNumero_Departamento = D.Dnumero;
