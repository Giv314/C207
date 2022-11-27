
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `preco` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`idProduto`));


CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `idLoja` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idLoja`));


CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `CPF` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `CEP` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `senha_UNIQUE` (`senha` ASC) VISIBLE);


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


CREATE TABLE IF NOT EXISTS `mydb`.`Correio` (
  `idCorreio` INT NOT NULL,
  `prazo` DATE NOT NULL,
  `frete` INT NOT NULL,
  PRIMARY KEY (`idCorreio`));


CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `Cliente_CPF` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `valorTotal` FLOAT NOT NULL,
  `pagamento` VARCHAR(45) NOT NULL,
  `codigoRastreamento` VARCHAR(45) NOT NULL,
  `Correio_idCorreio` INT NOT NULL,
  PRIMARY KEY (`Cliente_CPF`, `Produto_idProduto`, `codigoRastreamento`),
  CONSTRAINT `fk_Cliente_has_Produto_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_Correio1`
    FOREIGN KEY (`Correio_idCorreio`)
    REFERENCES `mydb`.`Correio` (`idCorreio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `mydb`.`Avaliacao` (
  `Produto_idProduto` INT NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  `nota` INT NOT NULL,
  `esclarecimento` VARCHAR(45) NULL,
  PRIMARY KEY (`Produto_idProduto`, `Cliente_CPF`),
  CONSTRAINT `fk_Produto_has_Cliente_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

