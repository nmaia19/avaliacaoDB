create database avaliacaoDB
default character set utf8mb4
default collate utf8mb4_general_ci;

use avaliacaoDB;

###### TABLES DE PRODUÇÃO ######

CREATE TABLE categoria (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
	nome_cat VARCHAR(100)
);

CREATE TABLE marca (
	id_marca INT PRIMARY KEY AUTO_INCREMENT,
	nome_marca VARCHAR(100)
);

CREATE TABLE produto (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
	nome_produto VARCHAR (100),
	id_marca INT,
	id_categoria INT,
	ano_modelo INT,
	preco DECIMAL (10, 2),
	FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_marca) REFERENCES marca(id_marca) ON DELETE CASCADE ON UPDATE CASCADE
);

###### TABLES DE VENDA ###### 

CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY,
	nome VARCHAR (255),
	email VARCHAR (255) NOT NULL UNIQUE,
	cidade VARCHAR (50),
	uf VARCHAR (2)
);

CREATE TABLE lojas (
	id_loja INT PRIMARY KEY AUTO_INCREMENT,
	nome_loja VARCHAR (255),
	telefone VARCHAR (11),
	email VARCHAR (255),
	cidade VARCHAR (255),
	uf VARCHAR (2)
);

CREATE TABLE funcionario (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	telefone VARCHAR (25),
	id_loja INT NOT NULL,
	id_gerente INT,
	FOREIGN KEY (id_loja) REFERENCES lojas(id_loja) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_gerente) REFERENCES funcionario (id_funcionario) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE pedido (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT,
	data_pedido DATE,
	id_loja INT,
	id_funcionario INT,
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_loja) REFERENCES lojas(id_loja) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE pedido_item (
	id_pedido INT,
	id_item INT,
	id_produto INT,
	quantidade INT,
	preco DECIMAL (10, 2),
	desconto DECIMAL (4, 2) NOT NULL DEFAULT 0,
	PRIMARY KEY (id_pedido, id_item),
	FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_produto) REFERENCES produto(id_produto) ON DELETE CASCADE ON UPDATE CASCADE
);

###### CONTROLE DE ESTOQUE ###### 

CREATE TABLE estoque (
	id_loja INT,
	id_produto INT,
	quantidade INT,
	PRIMARY KEY (id_loja, id_produto),
	FOREIGN KEY (id_loja) REFERENCES lojas(id_loja) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_produto) REFERENCES produto(id_produto) ON DELETE CASCADE ON UPDATE CASCADE
);

