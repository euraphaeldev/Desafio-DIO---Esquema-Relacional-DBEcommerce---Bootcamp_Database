-- criação do DB para o cenário de ecommerce

CREATE DATABASE ecommerce;
USE ecommerce;

-- criando tabela cliente
-- cpf ou cnpj (dado obtido via aplicação)
-- definindo constraint de unicidade para num_doc
create table cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Pnome VARCHAR(20) NOT NULL,
    Mnome CHAR(3) NOT NULL,
    Snome VARCHAR(20) NOT NULL,
    data_nascimento DATE NOT NULL,
    tipo BOOL, 
    num_doc VARCHAR(14) NOT NULL,
	cliente_rua VARCHAR(50) NOT NULL,
    cliente_num VARCHAR(10) NOT NULL,
    cliente_comp VARCHAR(20),
    cliente_cep CHAR(8) NOT NULL,
    cliente_cidade VARCHAR(20) NOT NULL,
    cliente_estado VARCHAR(20) NOT NULL,
    cliente_pais VARCHAR(20) NOT NULL,
	cliente_telefone VARCHAR(20),
    CONSTRAINT unique_cpf_cliente UNIQUE (num_doc)
);

ALTER TABLE cliente AUTO_INCREMENT = 1;

-- criando tabela cartao
CREATE TABLE cartao(
	idCartao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cartao_id_cliente INT,
	cartao_num VARCHAR(16) DEFAULT 0,
    cartao_nome VARCHAR(30),
    cartao_validade CHAR(5),
    cartao_bandeira VARCHAR(20),
    CONSTRAINT fk_cartao_id_cliente FOREIGN KEY (cartao_id_cliente) REFERENCES cliente(idCliente)
);

-- criando tabela forma_pgto
CREATE TABLE forma_pgto(
	idForma_pgto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    forma_de_pagamento ENUM('A VISTA','PIX','CARTÃO DE CRÉDITO', 'CARTÃO DE DÉBITO'),
    forma_pgto_idCliente INT,
    forma_pgto_idCartao INT,
    CONSTRAINT fk_forma_pgto_cliente FOREIGN KEY (forma_pgto_idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT fk_forma_pgto_cartao FOREIGN KEY (forma_pgto_idCartao) REFERENCES cartao(idCartao)
);

-- criando tabela produto
CREATE TABLE produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome_produto VARCHAR(50),
    classificacao_crianca BOOL DEFAULT FALSE,
    categoria ENUM('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Serviços') NOT NULL,
    avaliacao FLOAT DEFAULT 0,
    valor FLOAT DEFAULT 0
);

CREATE TABLE entrega(
	idEntrega INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    codigo_de_rastreio VARCHAR(10),
    data_da_entrega DATE,
    status_da_entrega VARCHAR(50),
    CONSTRAINT unique_codigo_de_rastreio UNIQUE (codigo_de_rastreio)
);

-- criando tabela pedido
CREATE TABLE pedido(
	idPedido INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_pedido_cliente INT,
    id_forma_pgto INT,
    id_entrega INT,
    pedido_status ENUM('Cancelado', 'Confirmado', 'Em Processamento') DEFAULT ('Em Processamento'),
    pedido_descricao VARCHAR(255),
    frete FLOAT DEFAULT 10 NOT NULL,
    valor_total VARCHAR(50) NOT NULL DEFAULT 0,
    CONSTRAINT fk_forma_pgto FOREIGN KEY (id_forma_pgto) REFERENCES forma_pgto(idForma_pgto),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_pedido_cliente) REFERENCES cliente(idCliente),
    CONSTRAINT fk_entrega FOREIGN KEY (id_entrega) REFERENCES entrega(idEntrega)
);

desc pedido;

-- criando tabela estoque
CREATE TABLE estoque (
	idEstoque INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    estoque_nome VARCHAR(50),
    estoque_rua VARCHAR(50) NOT NULL,
    estoque_num VARCHAR(10) NOT NULL,
    estoque_comp VARCHAR(20),
    estoque_cep CHAR(8) NOT NULL,
    estoque_cidade VARCHAR(20) NOT NULL,
    estoque_estado VARCHAR(20) NOT NULL,
    estoque_pais VARCHAR(20) NOT NULL,
    estoque_email VARCHAR(20),
	estoque_telefone VARCHAR(20),
    estoque_quantidade INT DEFAULT 0
);

-- criando tabela fornecedor
-- definindo constraint de unicidade para CNPJ_num
CREATE TABLE fornecedor(
	idFornecedor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CNPJ_num CHAR(14) NOT NULL,
    razao_social VARCHAR (50) NOT NULL,
	fornecedor_rua VARCHAR(50) NOT NULL,
    fornecedor_num VARCHAR(10) NOT NULL,
    fornecedor_comp VARCHAR(20),
    fornecedor_cep CHAR(8) NOT NULL,
    fornecedor_cidade VARCHAR(20) NOT NULL,
    fornecedor_estado VARCHAR(20) NOT NULL,
    fornecedor_pais VARCHAR(20) NOT NULL,
	fornecedor_telefone VARCHAR(20),
    fornecedor_email VARCHAR(30) NOT NULL,
    CONSTRAINT unique_fornecedor UNIQUE (CNPJ_num)
);



-- criando a tabela vendedor
CREATE TABLE vendedor(
	idVendedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    vendedor_razao_social VARCHAR(50) NOT NULL,
    vendedor_cnpj CHAR(14) NOT NULL,
    vendedor_nome_fantasia VARCHAR(50),
	vendedor_rua VARCHAR(50) NOT NULL,
    vendedor_num VARCHAR(10) NOT NULL,
    vendedor_comp VARCHAR(20),
    vendedor_cep CHAR(8) NOT NULL,
    vendedor_cidade VARCHAR(20) NOT NULL,
    vendedor_estado VARCHAR(20) NOT NULL,
    vendedor_pais VARCHAR(20) NOT NULL,
	vendedor_telefone VARCHAR(20),
    vendedor_email VARCHAR(30) NOT NULL,
    CONSTRAINT unique_vendedor_cnpj UNIQUE (vendedor_cnpj)
);

CREATE TABLE vendedor_produto(
	idVP_vendedor INT,
    idVP_produto INT,
    VP_quantidade INT DEFAULT 1,
    PRIMARY KEY (idVP_vendedor, idVP_produto),
    CONSTRAINT fk_idVP_vendedor FOREIGN KEY (idVP_vendedor) REFERENCES vendedor(idVendedor),
    CONSTRAINT fk_idVP_produto FOREIGN KEY (idVP_produto) REFERENCES produto(idProduto)
);

desc vendedor_produto;

CREATE TABLE pedido_produto(
	idPP_produto INT,
    idPP_pedido INT,
    PP_quantidade INT DEFAULT 1,
    PRIMARY KEY (idPP_produto, idPP_pedido),
    constraint fk_idPP_produto FOREIGN KEY (idPP_produto) REFERENCES produto(idProduto),
    constraint fk_idPP_pedido FOREIGN KEY (idPP_pedido) REFERENCES pedido(idPedido)
);

CREATE TABLE estoque_local(
	idEL_produto INT,
    idEL_estoque INT,
    PRIMARY KEY (idEL_produto, idEL_estoque),
    CONSTRAINT fk_idEL_produto FOREIGN KEY (idEL_produto) REFERENCES produto(idProduto),
    CONSTRAINT fk_idEL_estoque FOREIGN KEY (idEL_estoque) REFERENCES estoque(idEstoque)
    
);

CREATE TABLE fornecedor_produto(
	idFP_fornecedor INT,
    idFP_produto INT,
	FP_quantidade INT NOT NULL,
    PRIMARY KEY (idFP_fornecedor, idFP_produto),
    CONSTRAINT fk_idFP_fornecedor FOREIGN KEY (idFP_fornecedor) REFERENCES fornecedor(idFornecedor),
    CONSTRAINT fk_idFP_produto FOREIGN KEY (idFP_produto) REFERENCES produto(idProduto)    
);
