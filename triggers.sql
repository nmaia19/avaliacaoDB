/*
--------------------------------------------------------------------
IMPLEMENTAÇÕES: TRIGGERS
--------------------------------------------------------------------
*/


  -- Trigger de verificação de estoque, antes de inserção de novo pedido
	
    drop trigger if exists tr_verificaEstoque;
    DELIMITER $$
	CREATE TRIGGER tr_verificaEstoque BEFORE INSERT
	ON pedido_item
	FOR EACH ROW
	BEGIN
		DECLARE temEstoque boolean;
		CALL sp_verificarEstoque(new.id_produto, new.quantidade, temEstoque);
		if temEstoque = 0 then
			SIGNAL sqlstate '45001' set message_text = "Produto esgotado!";
		end if;
	END$$
	DELIMITER ;



