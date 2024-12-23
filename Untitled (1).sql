Table cliente_pj_pf {
  idcliente INT [pk]
  nome VARCHAR(45)
  identificacao VARCHAR(45)
  endereco VARCHAR(45)
  tipo_cliente VARCHAR(2) // 'PJ' ou 'PF'
  cpf VARCHAR(11)
  cnpj VARCHAR(14)
  nome_fantasia VARCHAR(45)
}

Table pagamento {
  idpagamento INT [pk]
  idpedido INT
  tipo_pagamento VARCHAR(45)
  valor FLOAT
  data_pagamento DATE
}

Table entrega {
  identrega INT [pk]
  idpedido INT
  status_entrega VARCHAR(45)
  codigo_rastreio VARCHAR(45)
}

Table fornecedor {
  idfornecedor INT [pk]
  razao_social VARCHAR(45)
  cnpj VARCHAR(14)
}

Table terceiro_vendedor {
  idterceiro_vendedor INT [pk]
  razao_social VARCHAR(45)
  local VARCHAR(45)
}

Table produto {
  idproduto INT [pk]
  categoria VARCHAR(45)
  descricao VARCHAR(45)
  valor FLOAT
}

Table estoque {
  idestoque INT [pk]
  local VARCHAR(45)
}

Table produto_has_estoque {
  produto_idproduto INT
  estoque_idestoque INT
  quantidade INT
}

Table produtos_por_vendedor {
  produto_idproduto INT
  terceiro_vendedor_idterceiro INT
  quantidade INT
}

Table disponibilizando_um_produto {
  fornecedor_idfornecedor INT
  produto_idproduto INT
}

Table pedido {
  idpedido INT [pk]
  status_do_pedido VARCHAR(45)
  descricao VARCHAR(45)
  cliente_idcliente INT
  frete FLOAT
}

Table relacao_produto_pedido {
  produto_idproduto INT
  pedido_idpedido INT
}

// Referências entre tabelas
Ref: produto_has_estoque.produto_idproduto > produto.idproduto
Ref: produto_has_estoque.estoque_idestoque > estoque.idestoque
Ref: produtos_por_vendedor.produto_idproduto > produto.idproduto
Ref: produtos_por_vendedor.terceiro_vendedor_idterceiro > terceiro_vendedor.idterceiro_vendedor
Ref: disponibilizando_um_produto.fornecedor_idfornecedor > fornecedor.idfornecedor
Ref: disponibilizando_um_produto.produto_idproduto > produto.idproduto
Ref: pedido.cliente_idcliente > cliente_pj_pf.idcliente
Ref: relacao_produto_pedido.produto_idproduto > produto.idproduto
Ref: relacao_produto_pedido.pedido_idpedido > pedido.idpedido
Ref: pagamento.idpedido > pedido.idpedido
Ref: entrega.idpedido > pedido.idpedido
