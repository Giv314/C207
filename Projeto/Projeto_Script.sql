----------------------------------------------
-- Schema lojadb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lojadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lojadb` DEFAULT CHARACTER SET utf8 ;
USE `lojadb` ;

-- -----------------------------------------------------
-- Table `lojadb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Loja` (
  `idLoja` INT NOT NULL auto_increment,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLoja`));


-- -----------------------------------------------------
-- Table `lojadb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Produto` (
  `idProduto` INT NOT NULL auto_increment,
  `Tipo` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_Produto_Loja1_idx` (`Loja_idLoja` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `lojadb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


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
-- Table `lojadb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Endereco` (
  `idEndereco` INT NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`));


-- -----------------------------------------------------
-- Table `lojadb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lojadb`.`Cliente` (
  `idCliente` INT NOT NULL auto_increment,
  `Nome` VARCHAR(45) NOT NULL,
  `qtdProdutos` INT NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Endereco_idx` (`Endereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `lojadb`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


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
    
    # Fazendo crud completo
    
    #1. Criando 2 lojas com produtos, caixas, endereços e clientes.
    insert into Loja values(default, 'Papelaria SR');
    insert into Produto values(default, 'estojo', 10.00, 0);
    insert into Produto values(default, 'lápis', 2.50, 0);
    insert into Produto values(default, 'borracha', 2.50, 0);
    insert into Caixa values(default, 'Andrea', 0);
    insert into Endereco values(default, 'Rua das Palmeiras', 'São Joaquim', 'Andradas', '12');
    insert into Endereco values(default, 'Rua dos Orixas', 'Jardim Silveira', 'Poços de Caldas', '54');
    insert into Loja_has_endereco values(0, 0);
    insert into Cliente values(default, 'Paulo', 2, 1);

    insert into Loja values(default, 'Drogaria SP');
    insert into Produto values(default, 'Lufital', 20.00, 1);
    insert into Produto values(default, 'Trident', 3.50, 1);
    insert into Produto values(default, 'Protetor solar', 10.50, 1);
    insert into Caixa values(default, 'Geraldo', 1);
    insert into Endereco values(default, 'Rua das Palmeiras', 'Lorena', 'São Paulo', '23');
	insert into Loja_has_endereco values(1, 2);
    insert into Cliente values(default, 'Rafael', 2, 1);
    
    #2. Lendo ids e nomes das lojas
    select idLoja, nome from Loja;
    #3 Lendo quais produtos há na loja
    select P.Loja_idLoja, P.idProduto, P.tipo, P.preco from Produto as P, Loja as L where P.Loja_idLoja = P.idLoja;
    #3. 
    
