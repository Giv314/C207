-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lojadb
-- -----------------------------------------------------

-- -----------------------------------------------------
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
  PRIMARY KEY (`idLoja`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojadb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  `qtdDisponivel` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_Produto_Loja1_idx` (`Loja_idLoja` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `lojadb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojadb`.`Caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Caixa` (
  `idCaixa` INT NOT NULL AUTO_INCREMENT,
  `nome_operador` VARCHAR(45) NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  `qtdClientes` INT NULL,
  `valorMaquina` FLOAT NULL,
  PRIMARY KEY (`idCaixa`),
  INDEX `fk_Caixa_Loja1_idx` (`Loja_idLoja` ASC) VISIBLE,
  CONSTRAINT `fk_Caixa_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `lojadb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojadb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `Rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojadb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  `qtdProduto` INT NULL,
  `Caixa_idCaixa` INT NULL,
  `Produto_idProduto` INT NULL,
  `ValorTotal` FLOAT NULL,
  `troco` FLOAT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Endereco_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  INDEX `fk_Cliente_Caixa1_idx` (`Caixa_idCaixa` ASC) VISIBLE,
  INDEX `fk_Cliente_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `lojadb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Caixa1`
    FOREIGN KEY (`Caixa_idCaixa`)
    REFERENCES `lojadb`.`Caixa` (`idCaixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `lojadb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lojadb`.`Loja_has_Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Loja_has_Endereco` (
  `Loja_idLoja` INT NOT NULL AUTO_INCREMENT,
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
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

# Procedures
DELIMITER $$
drop procedure if exists comprar $$
create procedure comprar(in numCliente INT, in numProduto INT, in quant INT)
begin
	update Cliente
    set Produto_idProduto = numProduto
    where idCliente = numCliente;
    
    update Cliente as C join Produto as P on C.Produto_idProduto = P.idProduto
    set C.valorTotal = C.valorTotal + (P.preco * quant)
    where C.idCliente = numCliente and P.idProduto = numProduto;
    
    update Produto
    set qtdDisponivel = qtdDisponivel - quant
    where idProduto = numProduto;
    
end $$
DELIMITER ;

DELIMITER $$
drop procedure if exists finalizar_compra $$
create procedure finalizar_compra(in numCliente INT, numCaixa INT, valorPago FLOAT)
begin
	update Caixa
    set qtdClientes = qtdClientes + 1
    where idCaixa = numCaixa;
    
    update Cliente
    set Caixa_idCaixa = numCaixa
    where idCliente = numCliente;
    
	update Caixa as Ca join Cliente as Cl on Cl.Caixa_idCaixa = Ca.idCaixa
	set Ca.valorMaquina = Ca.valorMaquina + Cl.valorTotal
    where Ca.idCaixa = numCaixa and Cl.idCliente = numCliente;
    
    update Cliente
    set troco = valorPago - valorTotal
    where idCliente = numCliente;
    
end $$
DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
