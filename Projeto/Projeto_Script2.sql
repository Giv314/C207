-- Schema lojadb
-- -----------------------------------------------------
drop schema lojadb;
CREATE SCHEMA IF NOT EXISTS `lojadb` DEFAULT CHARACTER SET utf8 ;
USE `lojadb` ;

-- -----------------------------------------------------
-- Table `lojadb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Loja` (
  `idLoja` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLoja`));


-- -----------------------------------------------------
-- Table `lojadb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `Rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`));


-- -----------------------------------------------------
-- Table `lojadb`.`Caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Caixa` (
  `idCaixa` INT NOT NULL auto_increment,
  `Funcionario` VARCHAR(45) NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  PRIMARY KEY (`idCaixa`),
  INDEX `fk_Caixa_Loja1_idx` (`Loja_idLoja` ASC) VISIBLE,
  CONSTRAINT `fk_Caixa_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `lojadb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `lojadb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Cliente` (
  `idCliente` INT NOT NULL auto_increment,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  `qtdProdutos` INT NULL,
  `Caixa_idCaixa` INT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Endereco_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  INDEX `fk_Cliente_Caixa1_idx` (`Caixa_idCaixa` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `lojadb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Caixa1`
    FOREIGN KEY (`Caixa_idCaixa`)
    REFERENCES `lojadb`.`Caixa` (`idCaixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojadb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Produto` (
  `idProduto` INT NOT NULL auto_increment,
  `Tipo` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  `qtdDisponivel` INT NOT NULL,
  `Cliente_idCliente` INT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_Produto_Loja1_idx` (`Loja_idLoja` ASC) VISIBLE,
  INDEX `fk_Produto_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `lojadb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `lojadb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojadb`.`Loja_has_Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Loja_has_Endereco` (
  `Loja_idLoja` INT NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`Loja_idLoja`, `Endereco_idEndereco`),
  INDEX `fk_Loja_has_Endereco_Endereco1_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  INDEX `fk_Loja_has_Endereco_Loja1_idx` (`Loja_idLoja` ASC) VISIBLE,
  CONSTRAINT `fk_Loja_has_Endereco_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `lojadb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loja_has_Endereco_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `lojadb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
DELIMITER $$
drop procedure if exists comprar $$
create procedure comprar(in idCliente INT, in nomeProduto varchar(45), in qtdProduto INT)
begin
	update Cliente(idCliente, qtdProdutos)
end $$
DELIMITER ;
    
    
