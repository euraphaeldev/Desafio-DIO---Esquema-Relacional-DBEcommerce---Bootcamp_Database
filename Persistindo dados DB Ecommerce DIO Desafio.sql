USE ecommerce;

show tables;
desc cliente;

INSERT INTO cliente(
	Pnome, 
    Mnome, 
    Snome, 
    data_nascimento, 
    tipo,
    num_doc, 
    cliente_rua, 
    cliente_num, 
    cliente_comp, 
    cliente_cep, 
    cliente_cidade, 
    cliente_estado, 
    cliente_pais,
    cliente_telefone)
	VALUES('Maria', 'A', 'Silva', '1969-11-08', 1, '98765432122', 'Rua A', '1', null, '58000000', 'cidade A', 'Estado A', 'País A', null),
		  ('Raphael', 'B', 'Cavalcante', '1977-12-20', 0, '31141225000121', 'Rua B', '2', null, '58000000', 'cidade B', 'Estado B', 'País B', null),
		  ('Joseli', 'A', 'Santos', '1944-07-04', 1, '12345678901', 'Rua C', '3', null, '58000000', 'cidade C', 'Estado C', 'País C', null),
		  ('Lucas', 'G A', 'Sousa', '1934-05-30', 0, '31141225000122', 'Rua D', '4', null, '58000000', 'cidade D', 'Estado D', 'País D', null);
          
select * from cliente;


INSERT INTO cartao(
	cartao_id_cliente,
	cartao_num,
	cartao_nome,
	cartao_validade,
	cartao_bandeira) 
	VALUES ('1','1122334455667788', 'MARIA A SILVA', '03/30', 'VISA'),
		   ('2','2233445566778899', 'RAPHAEL B CAVALCANTE', '03/60', 'MASTERCARD'),
		   ('3','3344556677889900', 'JOSELI A SANTOS', '04/24', 'ELO'),
		   ('4','4455667788990011', 'LUCAS G A SANTOS', '12/27', 'AMERICAN');
       
SELECT * FROM cartao;

desc forma_pgto;

INSERT INTO forma_pgto(
	forma_de_pagamento,
    forma_pgto_idCliente,
    forma_pgto_idCartao)
	VALUES ('A VISTA', '1', null),
		   ('PIX', '2', null),
		   ('CARTÃO DE CRÉDITO', 3, 3),
		   ('CARTÃO DE DÉBITO', 4, 4);
       
SELECT * FROM forma_pgto;

DESC produto;

INSERT INTO produto(
	nome_produto,
    classificacao_crianca,
    categoria,
    avaliacao,
    valor)
    VALUES ('iphone 14 pro', '0', 'Eletrônico', 10.2, 3900.90),
		   ('casaco', '1', 'Vestuário', 2.9, 199.90),
		   ('max steel', '1', 'Brinquedos', 5.7, 299.90),
           ('prigles', '0', 'Alimentos', 9.1, 19.90);

SELECT * FROM produto;

DESC entrega;

INSERT INTO entrega(
	codigo_de_rastreio,
    data_da_entrega,
    status_da_entrega)
    VALUES ('1234567890', '2022-07-09', 'Em trânsito'),
		   ('2345678901', '2021-12-22', 'Destinatário Ausente'),
           ('3456789012', '2022-06-30', 'Entregue'),
           ('4567890123', '2022-09-09', 'Esperando liberação alfândegária');
           
SELECT * FROM entrega;

DESC pedido;

INSERT INTO pedido(
	id_pedido_cliente,
    id_forma_pgto,
    id_entrega,
    pedido_status,
    pedido_descricao,
    frete,
    valor_total)
    VALUES (1, 1, 1,'Em Processamento', 'pedido realizado via app', 19.79, 3920.69),
		   (2, 2, 2,'Cancelado', 'pedido realizado via app', '10', ' '),
           (3, 3, 3,'Confirmado', 'pedido realizado via website', 23.50, 323.4),
           (4, 4, 4,'Em Processamento', 'pedido realizado via telefone', '10', 29.90);
           
SELECT * FROM pedido;

DESC estoque;

INSERT INTO estoque (
	estoque_nome,
    estoque_rua,
    estoque_num,
    estoque_comp,
    estoque_cep,
    estoque_cidade,
    estoque_estado,
    estoque_pais,
    estoque_email,
    estoque_telefone,
    estoque_quantidade)
    VALUES ('ESTOQUE1', 'RUA 1', '10', 'GALPAO 20', '58000000', 'CIDADE 1', 'ESTADO 1', 'PAÍS 1', 'est1@est.com.br', '11111111111', 9890),
		   ('ESTOQUE2', 'RUA 2', '20', 'GALPAO 30', '58000000', 'CIDADE 2', 'ESTADO 2', 'PAÍS 2', 'est2@est.com.br', '22222222222', 150000);

SELECT * FROM estoque;

DESC fornecedor;

INSERT INTO fornecedor (
	CNPJ_num,
    razao_social,
	fornecedor_rua,
    fornecedor_num,
    fornecedor_comp,
    fornecedor_cep,
    fornecedor_cidade,
    fornecedor_estado,
    fornecedor_pais,
    fornecedor_telefone,
    fornecedor_email)
    VALUES ('12345678901234', 'MEU PRIMEIRO FORNECEDOR', 'RUA 1', '10', 'GALPAO 99', '58000000', 'CIDADE 1', 'ESTADO 1', 'PAÍS 1', '11111111111','est1@est.com.br'),
		   ('23456789012345', 'MEU SEGUNDO FORNECEDOR', 'RUA 2', '20', 'GALPAO 117', '58000000', 'CIDADE 2', 'ESTADO 2', 'PAÍS 2', '22222222222','est2@est.com.br');

SELECT * FROM fornecedor;

DESC vendedor;

INSERT INTO vendedor (
	vendedor_razao_social,
    vendedor_cnpj,
    vendedor_nome_fantasia,
	vendedor_rua,
    vendedor_num,
    vendedor_comp,
    vendedor_cep,
    vendedor_cidade,
    vendedor_estado,
    vendedor_pais,
    vendedor_telefone,
    vendedor_email)
    VALUES ('MEU PRIMEIRO VENDEDOR','12345678901234', 'MEU VENDEDOR FAVORITO', 'RUA 1', '10', 'GALPAO 33', '58000000', 'CIDADE 1', 'ESTADO 1', 'PAÍS 1', '11111111111','VEN1@vend.com.br'),
		   ('MEU SEGUNDO VENDEDOR','23456789012345', 'MEU VENDEDOR FAVORITO', 'RUA 2', '20', 'GALPAO 22', '58000000', 'CIDADE 2', 'ESTADO 2', 'PAÍS 2', '22222222222','VEND2@vend.com.br');

SELECT * FROM vendedor;

desc vendedor_produto;

INSERT INTO vendedor_produto(
	idVP_vendedor,
    idVP_produto,
    VP_quantidade)
	VALUES (1, 1, 445),
		   (2, 2, 2032),
           (2, 3, 3000),
           (1, 4, 3968);
           
SELECT * FROM vendedor_produto;

DESC pedido_produto;

INSERT INTO pedido_produto(
	idPP_produto,
    idPP_pedido,
    PP_quantidade)
	VALUES (2, 3, 100),
		   (4, 4, 200),
           (1, 1, 10),
           (3, 2, 25);

SELECT * FROM pedido_produto;

DESC estoque_local;

INSERT INTO estoque_local(
	idEL_produto,
    idEL_estoque)
	VALUES (1, 2),
		   (2, 1),
           (3, 1),
           (4, 2);
           
SELECT * FROM estoque_local;

DESC fornecedor_produto;

INSERT INTO fornecedor_produto(
	idFP_fornecedor,
    idFP_produto,
    FP_quantidade)
	VALUES (2, 3, 10000),
		   (1, 4, 3214),
           (1, 1, 20000),
           (2, 2, 110000);
