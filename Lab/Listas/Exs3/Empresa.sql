DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
USE empresa;

CREATE TABLE empregado(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    projeto INT
);

INSERT INTO empregado (nome, cpf, projeto) VALUES ('Joaquim', '000.000.000-00',  '1');
INSERT INTO empregado (nome, cpf, projeto) VALUES ('Alexandre', '111.111.111-11',  '2');
INSERT INTO empregado (nome, cpf, projeto) VALUES ('Leticia', '222.222.222-22',  '2');
INSERT INTO empregado (nome, cpf) VALUES ('Andre', '333.333.333-33');
INSERT INTO empregado (nome, cpf, projeto) VALUES ('Aline', '444.444.444-44',  '2');
INSERT INTO empregado (nome, cpf, projeto) VALUES ('Eduardo', '555.555.555-55',  '3');
INSERT INTO empregado (nome, cpf, projeto) VALUES ('Jessica', '666.666.666-66',  '3');
INSERT INTO empregado (nome, cpf) VALUES ('Bruce', '777.777.777-77');
INSERT INTO empregado (nome, cpf, projeto) VALUES ('Alexandre', '888.888.888-88',  '2');

SELECT * FROM empregado;
