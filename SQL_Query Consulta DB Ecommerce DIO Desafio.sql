use ecommerce;

select count(*) from cliente where Pnome = 'Raphael';

select count(*) from cliente;

select concat(Pnome, ' ', Mnome, ' ', Snome) as Nome_Completo,
	idEntrega as Codigo_Entrega, 
	forma_de_pagamento as Forma_de_Pagamento, 
	pedido_descricao as Descrição_do_pedido,  
	status_da_entrega as Status_entrega, 
	data_da_entrega as Data_da_Entrega
	from cliente, entrega,
		 pedido,
		 forma_pgto
	where id_pedido_cliente=idcliente 
		and id_entrega = idEntrega 
		and id_forma_pgto = idForma_pgto
		group by data_da_entrega
        having count(*)>= 1;
        
select * from cliente
	inner join entrega on idEntrega = idCliente
    inner join pedido on id_pedido_cliente = idCliente
    order by valor_total;
    
