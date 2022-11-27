CREATE SCHEMA IF NOT EXISTS `4Lista` DEFAULT CHARACTER SET utf8;
USE `4Lista` ;


CREATE TABLE IF NOT EXISTS `4Lista`.`Agente` (
  `idAgente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `nascimento` DATE NULL,
  `habilidade` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idAgente`));


-- -----------------------------------------------------
-- Table `4Lista`.`vilao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Lista`.`vilao` (
  `idvilao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `num_crimes` INT NOT NULL,
  PRIMARY KEY (`idvilao`));


-- -----------------------------------------------------
-- Table `4Lista`.`missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Lista`.`missao` (
  `idmissao` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NULL,
  `duracao` INT NULL,
  `vilao_idvilao` INT NOT NULL,
  PRIMARY KEY (`idmissao`),
  CONSTRAINT `fk_missao_vilao1`
    FOREIGN KEY (`vilao_idvilao`)
    REFERENCES `4Lista`.`vilao` (`idvilao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `4Lista`.`Agente_has_missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `4Lista`.`Agente_has_missao` (
  `Agente_idAgente` INT NOT NULL,
  `missao_idmissao` INT NOT NULL,
  PRIMARY KEY (`Agente_idAgente`, `missao_idmissao`),
  CONSTRAINT `fk_Agente_has_missao_Agente`
    FOREIGN KEY (`Agente_idAgente`)
    REFERENCES `4Lista`.`Agente` (`idAgente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agente_has_missao_missao1`
    FOREIGN KEY (`missao_idmissao`)
    REFERENCES `4Lista`.`missao` (`idmissao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
# Inserindo 5 registros nas tabelas
insert into Agente() values(DEFAULT, 'Joao', 'Rua 1', 12-03-1994, 'Forca', 'Masculino', 'joao@outlook.com');
insert into Agente() values(DEFAULT, 'Pedro', 'Rua 9', 14/05/1992, 'Tiro', 'Masculino', 'pedro@gmail.com');
insert into Agente() values(DEFAULT, 'Felipe', 'Rua 3', 06/02/1983, 'Forca', 'Masculino', 'felipe@gmail.com');
insert into Agente() values(DEFAULT, 'Isadora', 'Rua 5', 30/03/1993, 'Conhecimento', 'Feminino', 'isadora@gmail.com');
insert into Agente() values(DEFAULT, 'Joao', 'Rua 7', 20/04/1992, 'Tiro', 'Masculino', 'joao@outlook.com');

insert into vilao() values(DEFAULT, 'Henrique', 2);
insert into vilao() values(DEFAULT, 'Joao', 3);
insert into vilao() values(DEFAULT, 'Fernando', 1);
insert into vilao() values(DEFAULT, 'Pedro', 1);
insert into vilao() values(DEFAULT, 'Gabriel', 3);

insert into missao() values(DEFAULT, 20/10/2020, 'Missao 1', 'Inatel', 15, 2);
insert into missao() values(DEFAULT, 10/02/2021, 'Missao 2', 'USP', 10, 1);
insert into missao() values(DEFAULT, 12/02/2021, 'Missao 3', 'Supermercado', 13, 2);
insert into missao() values(DEFAULT, 20/03/2020, 'Missao 4', 'Hospital', 10, 3);
insert into missao() values(DEFAULT, 20/04/2022, 'Missao 5', 'Metro', 15, 4);

insert into Agente_has_missao() values
(1,2),
(2,1),
(3,1),
(4,1),
(2,2);

#Buscando
#1
select Agente.nome, Agente.email, Missao.nome, Missao.`data` FROM Agente AS A JOIN Agente_has_missao AS AM on A.idAgente = AM.Agente_idAgente JOIN
Missao as M on M.idMissao = AM.missao_idmissao;

#2
select Missao.nome, Missao.`data`, Missao.duracao, vilao.nome FROM missao JOIN vilao;

#3
select Agente.nome, missao.nome, vilao.nome FROM Agente as A JOIN Agente_has_Missao as AM on A.idAgente = AM.Agente_idAgente JOIN
Missao as M on M.idMissao = AM.missao_idmissao JOIN vilao;


