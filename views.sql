/*
--------------------------------------------------------------------
IMPLEMENTAÇÕES: VIEWS
--------------------------------------------------------------------
*/


-- Lista de produtos e respectivas categorias por ordem alfabética

CREATE VIEW vw_listaProdutos
AS
SELECT 
   p.nome_produto, c.nome_cat
FROM categoria c INNER JOIN produto p
ON c.id_categoria = p.id_categoria
ORDER BY p.nome_produto;

-- Relação de funcionários e lojas por ordem alfabética de funcionários

CREATE VIEW vw_listaFuncionarios
AS
SELECT 
  f.nome, f.email, l.nome_loja, l.cidade, l.uf
FROM funcionario f INNER JOIN lojas l
ON f.id_loja = l.id_loja
ORDER BY f.nome;


-- Listar todos os produtos por categoria
CREATE VIEW vw_produtosPorCategoria
AS
SELECT 
   c.nome_cat, 
   p.nome_produto, 
   e.quantidade, 
   p.preco, 
   p.ano_modelo
FROM categoria c
   INNER JOIN produto p ON c.id_categoria = p.id_categoria
   INNER JOIN estoque e on e.id_produto = p.id_produto
GROUP BY c.nome_cat;

-- Relação de pedidos com desconto
CREATE VIEW vw_exibirPedidos
AS
SELECT 
   p.nome_produto, 
   cat.nome_cat, 
   e.quantidade, 
   c.nome, 
   ped.id_pedido,
   ped.data_pedido,
   pi.desconto
FROM produto p
   INNER JOIN categoria cat ON cat.id_categoria = p.id_categoria
   INNER JOIN estoque e on e.id_produto = p.id_produto
   INNER JOIN pedido_item pi on pi.id_produto = p.id_produto
   INNER JOIN pedido ped on pi.id_pedido = ped.id_pedido
   INNER JOIN cliente c on c.id_cliente = ped.id_cliente
GROUP BY c.nome;

-- View com right join - Relação Produtos e Marcas para exemplificar que algumas marcas não tem produtos cadastrados
CREATE VIEW vw_marcasProdutos
AS
SELECT 
   p.nome_produto, 
   m.nome_marca
FROM produto p
   RIGHT JOIN marca m ON p.id_marca = m.id_marca;


-- View com left join - Relação Produtos e Marcas para exemplificar que as marcas que não têm produtos cadastrados, não são exibidas
CREATE VIEW vw_produtosMarcas
AS
SELECT 
   p.nome_produto, 
   m.nome_marca
FROM produto p
   LEFT JOIN marca m ON p.id_marca = m.id_marca;

