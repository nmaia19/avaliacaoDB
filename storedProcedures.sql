/*
--------------------------------------------------------------------
IMPLEMENTAÇÕES: STORED PROCEDURES
--------------------------------------------------------------------
*/


    DELIMITER $$
	create procedure sp_verificarEstoque(in id_novoProduto int, in qtd int, out temEstoque boolean)
	begin
		declare temp float;
		select quantidade into temp from estoque where id_produto = id_novoProduto;
		if temp >= qtd and temp > 0 then
			set temEstoque = 1;
		else
			set temEstoque = 0;
		end if;    
	end$$
	delimiter ;
    
    DELIMITER $$
    
    
create procedure sp_insertCliente(IN nome varchar(30), IN email varchar(50), IN cidade varchar(50), in uf varchar(2))
	begin
		declare msg varchar(100);
        set msg = '';
		
        call pValidaNome(nome, msg);
        if msg is null then
			call pValidaEmail(email, msg);
        end if;
        
        if msg is null then
			insert into clientes values (DEFAULT, nome, email, cidade, uf);
			set msg = 'Cliente inserido com sucesso';
        end if;
        
		select msg;
	end$$
DELIMITER ;


DELIMITER $$
create procedure pValidaNome(IN nome varchar(50), OUT msg varchar(100))
	begin
        if length(nome) < 3 or length(nome) > 50 then
			set msg = 'O nome do cliente deve ter entre 3 e 50 caracteres';
        end if;
	end$$
DELIMITER ;

DELIMITER $$
create procedure pValidaEmail(IN cli_email varchar(100), OUT msg varchar(100))
begin
  declare qtde int;
  
  if length(cli_email) > 10 then
     if ( not (length(cli_email) - length(replace(cli_email, '@', '')) = 1 )) then
        set msg = 'O e-mail informado deve ter apenas um @.';
     else
       select count(*) into qtde from cliente where email = cli_email; 
       if qtde > 0 then
          set msg = 'Já existe um cliente cadastrado com esse email';
       end if;
     end if;     
  else
     set msg = 'O email deve ter pelo menos 10 caracteres';
  end if;
end$$
DELIMITER ;


DELIMITER $$
create procedure pAlteraCliente(IN cli_email_atual varchar(50), IN cli_email_novo varchar(50), IN cli_nome varchar(35))
begin
   declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from cliente where email = cli_email_atual;
   if qtde > 0 then    
       update cliente set
       email = cli_email_novo,
       nome = cli_nome
       where email = cli_email_atual;
       set msg = 'Cliente alterado com sucesso';
    else
      set msg = 'O cliente informado não existe';
    end if;
    select msg;
end$$
DELIMITER ;


DELIMITER $$
create procedure pExcluirCliente(IN cli_email varchar(50))
begin
   declare qtde int;
   declare msg varchar(100);
   select count(*) into qtde from cliente where email = cli_email;
   if qtde > 0 then    
       delete from cliente
       where email = cli_email;
       set msg = 'Cliente excluido com sucesso';
    else
      set msg = 'O cliente informado não existe';
    end if;
    select msg;
end$$
DELIMITER ;
