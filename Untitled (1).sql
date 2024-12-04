CREATE TABLE `cliente_pj_pf` (
  `idcliente` INT PRIMARY KEY,
  `nome` VARCHAR(45),
  `identificacao` VARCHAR(45),
  `endereco` VARCHAR(45),
  `tipo_cliente` ENUM(PJ,PF),
  `cpf` VARCHAR(11),
  `cnpj` VARCHAR(14),
  `nome_fantasia` VARCHAR(45)
);

CREATE TABLE `pagamento` (
  `idpagamento` INT PRIMARY KEY,
  `idpedido` INT,
  `tipo_pagamento` VARCHAR(45),
  `valor` FLOAT,
  `data_pagamento` DATE
);

CREATE TABLE `entrega` (
  `identrega` INT PRIMARY KEY,
  `idpedido` INT,
  `status_entrega` VARCHAR(45),
  `codigo_rastreio` VARCHAR(45)
);

CREATE TABLE `fornecedor` (
  `idfornecedor` INT PRIMARY KEY,
  `razao_social` VARCHAR(45),
  `cnpj` VARCHAR(45)
);

CREATE TABLE `terceiro_vendedor` (
  `idterceiro_vendedor` INT PRIMARY KEY,
  `razao_social` VARCHAR(45),
  `local` VARCHAR(45)
);

CREATE TABLE `produto` (
  `idproduto` INT PRIMARY KEY,
  `categoria` VARCHAR(45),
  `descricao` VARCHAR(45),
  `valor` VARCHAR(45)
);

CREATE TABLE `estoque` (
  `idestoque` INT PRIMARY KEY,
  `local` VARCHAR(45)
);

CREATE TABLE `produto_has_estoque` (
  `produto_idproduto` INT,
  `estoque_idestoque` INT,
  `quantidade` INT
);

CREATE TABLE `produtos_por_vendedor` (
  `produto_idproduto` INT,
  `terceiro_vendedor_idterceiro` INT,
  `quantidade` INT
);

CREATE TABLE `disponibilizando_um_produto` (
  `fornecedor_idfornecedor` INT,
  `produto_idproduto` INT
);

CREATE TABLE `pedido` (
  `idpedido` INT PRIMARY KEY,
  `status_do_pedido` VARCHAR(45),
  `descricao` VARCHAR(45),
  `cliente_idcliente` INT,
  `frete` FLOAT
);

CREATE TABLE `relacao_produto_pedido` (
  `produto_idproduto` INT,
  `pedido_idpedido` INT
);

ALTER TABLE `pagamento` ADD FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`);

ALTER TABLE `entrega` ADD FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`);

ALTER TABLE `produto_has_estoque` ADD FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`idproduto`);

ALTER TABLE `produto_has_estoque` ADD FOREIGN KEY (`estoque_idestoque`) REFERENCES `estoque` (`idestoque`);

ALTER TABLE `produtos_por_vendedor` ADD FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`idproduto`);

ALTER TABLE `produtos_por_vendedor` ADD FOREIGN KEY (`terceiro_vendedor_idterceiro`) REFERENCES `terceiro_vendedor` (`idterceiro_vendedor`);

ALTER TABLE `disponibilizando_um_produto` ADD FOREIGN KEY (`fornecedor_idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`);

ALTER TABLE `disponibilizando_um_produto` ADD FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`idproduto`);

ALTER TABLE `pedido` ADD FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente_pj_pf` (`idcliente`);

ALTER TABLE `relacao_produto_pedido` ADD FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`idproduto`);

ALTER TABLE `relacao_produto_pedido` ADD FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`idpedido`);
