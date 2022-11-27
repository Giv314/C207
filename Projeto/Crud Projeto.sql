 #1. Criando 1 loja com produtos, caixas, endereços e clientes.
    insert into Loja(idLoja, nome) values
    (idLoja, 'Loja do 1.99');
    
    select * from Loja;
    
# Preenchendo dados
    insert into Produto(idProduto, Tipo, preco, Loja_idLoja, qtdDisponivel) values
    (idProduto, 'estojo', 10.00, 1, 10),
    (idProduto, 'lápis', 2.50, 1, 50),
    (idProduto, 'borracha', 2.50, 1, 50),
    (idProduto, 'Lufital', 20.00, 1, 25),
	(idProduto, 'Trident', 3.50, 1, 60),
	(idProduto, 'Protetor solar', 10.50, 1, 10);
    
    insert into Caixa(idCaixa, nome_operador, Loja_idLoja, valorMaquina, qtdClientes) values
    (idCaixa, 'Andrea S.', 1, 100, 0),
    (idCaixa, 'Henrique', 1, 150, 0),
    (idCaixa, 'Geraldo', 1, 200, 0);
    
    insert into Endereco() values
    (default, 'Rua das Palmeiras', 'São Joaquim', 'Andradas', '12'),
    (default, 'Rua dos Orixas', 'Jardim Silveira', 'Poços de Caldas', '54'),
    (default, 'Rua das Palmeiras', 'Lorena', 'São Paulo', '23'),
    (default, 'Rua Moinho de Vento', 'São João', 'São Paulo', '14');
    
    insert into Loja_has_endereco() values(1, 1);
    
    insert into Cliente(idCliente, nome, Endereco_idEndereco, valorTotal) values
    (idCliente, 'Paulo', 2, 0),
    (idCliente, 'Andrea R.', 3, 0),
    (idCliente, 'Rafael', 4, 0);
    
select * from Produto;
select * from Cliente;
    
# comprar: in numCliente INT, in numProduto INT, in quant INT
call comprar(1, 4, 2);
select * from Produto;
select * from Cliente;
-- call comprar(2, 3, 3);
-- select * from Produto;
# Finalizar compra: 
call finalizar_compra(1,1,60);
-- select * from Produto;
select * from Cliente;
select * from Caixa;
-- select valorTotal from Cliente;
    
    