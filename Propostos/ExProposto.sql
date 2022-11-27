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
  CONSTRAINT `fk_Departamento_Empregado1`
    FOREIGN KEY (`SSN_Empregado`)
    REFERENCES `ExProposto`.`Empregado` (`SSN`)
    ON DELETE SET NULL
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `ExProposto`.`Supervisor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Supervisor` (
  `SSN` INT NOT NULL,
  PRIMARY KEY (`SSN`));

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
  CONSTRAINT `fk_Empregado_Departamento`
    FOREIGN KEY (`DNumero_Departamento`)
    REFERENCES `ExProposto`.`Departamento` (`DNumero`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Empregado_Supervisor1`
    FOREIGN KEY (`SSN_Supervisor`)
    REFERENCES `ExProposto`.`Supervisor` (`SSN`)
    ON DELETE SET NULL
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `ExProposto`.`Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Projeto` (
  `PNumero` INT NOT NULL,
  `DNumero_Departamento` INT NOT NULL,
  `PLocalizacao` VARCHAR(45) NOT NULL,
  `PNome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PNumero`),
  CONSTRAINT `fk_Projeto_Departamento1`
    FOREIGN KEY (`DNumero_Departamento`)
    REFERENCES `ExProposto`.`Departamento` (`DNumero`)
    ON DELETE SET NULL
    ON UPDATE CASCADE);


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
  CONSTRAINT `fk_Dependente_Empregado1`
    FOREIGN KEY (`SSN_Empregado`)
    REFERENCES `ExProposto`.`Empregado` (`SSN`)
    ON DELETE SET NULL
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `ExProposto`.`Depto_localizacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Depto_localizacoes` (
  `L_Numero` INT NOT NULL,
  `DNumero_Departamento` INT NOT NULL,
  `DLocalizacaao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`L_Numero`),
  CONSTRAINT `fk_Depto_localizacoes_Departamento1`
    FOREIGN KEY (`DNumero_Departamento`)
    REFERENCES `ExProposto`.`Departamento` (`DNumero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `ExProposto`.`Trabalha_Em`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExProposto`.`Trabalha_Em` (
  `SSN_Empregado` INT NOT NULL,
  `PNumero_Projeto` INT NOT NULL,
  `Horas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SSN_Empregado`, `PNumero_Projeto`),
  CONSTRAINT `fk_Empregado_has_Projeto_Empregado1`
    FOREIGN KEY (`SSN_Empregado`)
    REFERENCES `ExProposto`.`Empregado` (`SSN`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Empregado_has_Projeto_Projeto1`
    FOREIGN KEY (`PNumero_Projeto`)
    REFERENCES `ExProposto`.`Projeto` (`PNumero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    

