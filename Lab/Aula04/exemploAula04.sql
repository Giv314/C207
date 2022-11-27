
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escola` (
  `idEscola` INT NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idEscola`));


-- -----------------------------------------------------
-- Table `mydb`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diretor` (
  `idDiretor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Escola_idEscola` INT NOT NULL,
  PRIMARY KEY (`idDiretor`),
  CONSTRAINT `fk_Diretor_Escola`
    FOREIGN KEY (`Escola_idEscola`)
    REFERENCES `mydb`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Escritor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escritor` (
  `idEscritor` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEscritor`));


-- -----------------------------------------------------
-- Table `mydb`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livro` (
  `idLivro` INT NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `numPaginas` INT NOT NULL,
  `Escritor_idEscritor` INT NOT NULL,
  PRIMARY KEY (`idLivro`),
  CONSTRAINT `fk_Livro_Escritor1`
    FOREIGN KEY (`Escritor_idEscritor`)
    REFERENCES `mydb`.`Escritor` (`idEscritor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filme` (
  `idFilme` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `diretor` VARCHAR(45) NULL,
  PRIMARY KEY (`idFilme`));


-- -----------------------------------------------------
-- Table `mydb`.`Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ator` (
  `idAtor` INT NOT NULL,
  `nomeAtor` VARCHAR(45) NOT NULL,
  `idade` VARCHAR(45) NULL,
  PRIMARY KEY (`idAtor`));


-- -----------------------------------------------------
-- Table `mydb`.`Filme_has_Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filme_has_Ator` (
  `Filme_idFilme` INT NOT NULL,
  `Ator_idAtor` INT NOT NULL,
  PRIMARY KEY (`Filme_idFilme`, `Ator_idAtor`),
  CONSTRAINT `fk_Filme_has_Ator_Filme1`
    FOREIGN KEY (`Filme_idFilme`)
    REFERENCES `mydb`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Ator_Ator1`
    FOREIGN KEY (`Ator_idAtor`)
    REFERENCES `mydb`.`Ator` (`idAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);