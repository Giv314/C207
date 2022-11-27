-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ExProposto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ExProposto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ExProposto` DEFAULT CHARACTER SET utf8 ;
USE `ExProposto` ;

-- -----------------------------------------------------
-- Table `ExProposto`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Departamento` (
  `DNumero` INT NOT NULL,
  `SSN_Empregado` INT NOT NULL,
  `DataInicio` VARCHAR(45) NOT NULL,
  `DNome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNumero`),
  INDEX `fk_Departamento_Empregado1_idx` (`SSN_Empregado` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Empregado1`
    FOREIGN KEY (`SSN_Empregado`)
    REFERENCES `ExProposto`.`Empregado` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExProposto`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Empregado` (
  `SSN` INT NOT NULL,
  `PNome` VARCHAR(45) NOT NULL,
  `MInicial` VARCHAR(45) NOT NULL,
  `UNome` VARCHAR(45) NOT NULL,
  `DataNac` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Sexo` VARCHAR(45) NOT NULL,
  `Salario` VARCHAR(45) NOT NULL,
  `DNumero_Departamento` INT NOT NULL,
  `SSN_Supervisor` INT NOT NULL,
  PRIMARY KEY (`SSN`),
  INDEX `fk_Empregado_Departamento_idx` (`DNumero_Departamento` ASC) VISIBLE,
  INDEX `fk_Empregado_Empregado1_idx` (`SSN_Supervisor` ASC) VISIBLE,
  CONSTRAINT `fk_Empregado_Departamento`
    FOREIGN KEY (`DNumero_Departamento`)
    REFERENCES `ExProposto`.`Departamento` (`DNumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empregado_Empregado1`
    FOREIGN KEY (`SSN_Supervisor`)
    REFERENCES `ExProposto`.`Empregado` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExProposto`.`Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Projeto` (
  `PNumero` INT NOT NULL,
  `DNumero_Departamento` INT NOT NULL,
  `PLocalizacao` VARCHAR(45) NOT NULL,
  `PNome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PNumero`),
  INDEX `fk_Projeto_Departamento1_idx` (`DNumero_Departamento` ASC) VISIBLE,
  CONSTRAINT `fk_Projeto_Departamento1`
    FOREIGN KEY (`DNumero_Departamento`)
    REFERENCES `ExProposto`.`Departamento` (`DNumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExProposto`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Dependente` (
  `nomeDependente` VARCHAR(45) NOT NULL,
  `SSN_Empregado` INT NOT NULL,
  `Sexo` VARCHAR(45) NOT NULL,
  `DataNasc` VARCHAR(45) NOT NULL,
  `Parentesco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nomeDependente`),
  INDEX `fk_Dependente_Empregado1_idx` (`SSN_Empregado` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Empregado1`
    FOREIGN KEY (`SSN_Empregado`)
    REFERENCES `ExProposto`.`Empregado` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExProposto`.`Depto_localizacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Depto_localizacoes` (
  `L_Numero` INT NOT NULL,
  `DNumero_Departamento` INT NOT NULL,
  `DLocalizacaao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`L_Numero`),
  INDEX `fk_Depto_localizacoes_Departamento1_idx` (`DNumero_Departamento` ASC) VISIBLE,
  CONSTRAINT `fk_Depto_localizacoes_Departamento1`
    FOREIGN KEY (`DNumero_Departamento`)
    REFERENCES `ExProposto`.`Departamento` (`DNumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExProposto`.`Trabalha_Em`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Trabalha_Em` (
  `SSN_Empregado` INT NOT NULL,
  `PNumero_Projeto` INT NOT NULL,
  `Horas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SSN_Empregado`, `PNumero_Projeto`),
  INDEX `fk_Empregado_has_Projeto_Projeto1_idx` (`PNumero_Projeto` ASC) VISIBLE,
  INDEX `fk_Empregado_has_Projeto_Empregado1_idx` (`SSN_Empregado` ASC) VISIBLE,
  CONSTRAINT `fk_Empregado_has_Projeto_Empregado1`
    FOREIGN KEY (`SSN_Empregado`)
    REFERENCES `ExProposto`.`Empregado` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empregado_has_Projeto_Projeto1`
    FOREIGN KEY (`PNumero_Projeto`)
    REFERENCES `ExProposto`.`Projeto` (`PNumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
