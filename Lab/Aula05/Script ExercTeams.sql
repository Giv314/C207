-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Correio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Correio` (
  `idCorreio` INT NOT NULL,
  `prazoEntrega` INT NOT NULL,
  `valorFrete` DOUBLE NOT NULL,
  PRIMARY KEY (`idCorreio`));


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `codigoRastreamento` INT NOT NULL,
  `valorTotal` DOUBLE NOT NULL,
  `tipoPagamento` VARCHAR(45) NOT NULL,
  `Correio_idCorreio` INT NOT NULL,
  PRIMARY KEY (`codigoRastreamento`),
  CONSTRAINT `fk_Compra_Correio1`
    FOREIGN KEY (`Correio_idCorreio`)
    REFERENCES `mydb`.`Correio` (`idCorreio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Avaliação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliação` (
  `nota` INT NOT NULL,
  `texto` VARCHAR(45) NULL,
  PRIMARY KEY (`nota`));


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `qtDisponivel` INT NOT NULL,
  `Compra_codigoRastreamento` INT NOT NULL,
  `Avaliação_nota` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  CONSTRAINT `fk_Produto_Compra1`
    FOREIGN KEY (`Compra_codigoRastreamento`)
    REFERENCES `mydb`.`Compra` (`codigoRastreamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Avaliação1`
    FOREIGN KEY (`Avaliação_nota`)
    REFERENCES `mydb`.`Avaliação` (`nota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `idLoja` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idLoja`));


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cep` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  `Avaliação_nota` INT NOT NULL,
  PRIMARY KEY (`cpf`),
  CONSTRAINT `fk_Cliente_Avaliação1`
    FOREIGN KEY (`Avaliação_nota`)
    REFERENCES `mydb`.`Avaliação` (`nota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Produto_has_Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_has_Loja` (
  `Produto_idProduto` INT NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Loja_idLoja`),
  CONSTRAINT `fk_Produto_has_Loja_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Loja_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `mydb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_has_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_has_Compra` (
  `Cliente_cpf` INT NOT NULL,
  `Compra_codigoRastreamento` INT NOT NULL,
  PRIMARY KEY (`Cliente_cpf`, `Compra_codigoRastreamento`),
  CONSTRAINT `fk_Cliente_has_Compra_Cliente1`
    FOREIGN KEY (`Cliente_cpf`)
    REFERENCES `mydb`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Compra_Compra1`
    FOREIGN KEY (`Compra_codigoRastreamento`)
    REFERENCES `mydb`.`Compra` (`codigoRastreamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
