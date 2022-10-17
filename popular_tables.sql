/*
--------------------------------------------------------------------
Name   : Game Store
Version: 1.0
--------------------------------------------------------------------
*/

use avaliacaodb;

INSERT INTO marca VALUES
	(DEFAULT,'Apple'),
    (DEFAULT,'Microsoft'),
	(DEFAULT,'Alphabet'),
	(DEFAULT,'Amazon'),
	(DEFAULT,'Meta'),
	(DEFAULT,'Tencent'),
	(DEFAULT,'Disney'),
	(DEFAULT,'AT&T'),
	(DEFAULT,'Sony'),
    (DEFAULT,'Garena');
    
    select* from marca;

INSERT INTO categoria VALUES
	(DEFAULT,'Ação'),
	(DEFAULT,'Esportes'),
	(DEFAULT,'Aventura'),
	(DEFAULT,'Battle Royale'),
	(DEFAULT,'RPG'),
	(DEFAULT,'Corrida'),
	(DEFAULT,'Luta'),
	(DEFAULT,'Estratégia'),
	(DEFAULT,'Simulação'),
	(DEFAULT,'FPS');


INSERT INTO produto VALUES
	(DEFAULT,'Elden Ring',9,5,2022,224.91),
	(DEFAULT,'Outlanders',1,8,2019,10.00),
	(DEFAULT,'Horizon Forbidden West',9,1,2022,199.99),
	(DEFAULT,'Gran Turismo 7',9,6,2022,299.99),
	(DEFAULT,'jogo5',2,3,2022,224.00),
	(DEFAULT,'jogo6',3,4,2021,200.91),
	(DEFAULT,'jogo7',4,5,2022,124.91),
	(DEFAULT,'jogo8',5,6,2020,24.91),
	(DEFAULT,'jogo9',6,7,2019,30.00),
	(DEFAULT,'jogo10',7,8,2022,22.91);


INSERT INTO cliente(nome, email, cidade, uf) VALUES
	('Debra Burks', 'debra.burks@yahoo.com', 'Orchard Park','NY'),
	('Kasha Todd', 'kasha.todd@yahoo.com','Campbell','CA'),
	('Tameka Fisher', 'tameka.fisher@aol.com', 'Redondo Beach','CA'),
	('Daryl Spence', 'daryl.spence@aol.com', 'Uniondale','NY'),
    ('Charolette Rice','charolette.rice@msn.com', 'Sacramento','CA'),
	('Lyndsey Bean','lyndsey.bean@hotmail.com', 'Fairport','NY'),
	('Latasha Hays','latasha.hays@hotmail.com', 'Buffalo','NY'),
	('Jacquline Duncan','jacquline.duncan@yahoo.com', 'Jackson Heights','NY'),
	('Genoveva Baldwin','genoveva.baldwin@msn.com', 'Port Washington','NY'),
	('Lashawn Ortiz','lashawn.ortiz@msn.com','Longview','TX');


-- Lojas

INSERT INTO lojas VALUES
	(DEFAULT, 'Loja01','(83) 4476-4321','loja01@email.com', 'Santa Cruz','CA'),
	(DEFAULT, 'Loja02','(51) 379-8888','loja02@email.com', 'Baldwin','NY'),
	(DEFAULT, 'Loja03','(97) 530-5555','loja03@email.com', 'Rowlett','TX'),
	(DEFAULT, 'Loja04','(97) 530-5555','loja04@email.com', 'Rowlett','TX'),
	(DEFAULT, 'Loja05','(97) 530-5555','loja05@email.com', 'Rowlett','TX'),
    (DEFAULT, 'Loja06','(83) 4476-4321','loja06@email.com', 'Santa Cruz','CA'),
	(DEFAULT, 'Loja07','(51) 379-8888','loja07@email.com', 'Baldwin','NY'),
	(DEFAULT, 'Loja08','(97) 530-5555','loja08@email.com', 'Rowlett','TX'),
	(DEFAULT, 'Loja09','(97) 530-5555','loja09@email.com', 'Rowlett','TX'),
	(DEFAULT, 'Loja10','(97) 530-5555','loja10@email.com', 'Rowlett','TX');


-- Estoques
 
INSERT INTO estoque VALUES
	(1,1,27),
	(2,2,5),
	(3,3,6),
	(4,4,23),
	(5,5,22),
	(6,6,0),
	(7,7,8),
	(8,8,0),
	(9,9,11),
	(10,10,15),
	(1,8,8);



INSERT INTO funcionario VALUES 
	(DEFAULT,'Fabiola Jackson','fabiola.jackson@email.com','(831) 555-5554',1,1),
	(DEFAULT,'Mireya Copeland','mireya.copeland@email.com','(831) 555-5555',2,1),
	(DEFAULT,'Genna Serrano','genna.serrano@email.com','(831) 555-5556',3,2),
	(DEFAULT,'Virgie Wiggins','virgie.wiggins@email.com','(831) 555-5557',4,1),
	(DEFAULT,'Jannette David','jannette.david@email.com','(516) 379-4444',5,2),
	(DEFAULT,'Marcelene Boyer','marcelene.boyer@email.com','(516) 379-4445',6,2),
	(DEFAULT,'Venita Daniel','venita.daniel@email.com','(516) 379-4446',7,2),
	(DEFAULT,'Kali Vargas','kali.vargas@email.com','(972) 530-5555',8,1),
	(DEFAULT,'Layla Terrell','layla.terrell@email.com','(972) 530-5556',9,2),
	(DEFAULT,'Bernardine Houston','bernardine.houston@email.com','(972) 530-5557',10,2);

 
INSERT INTO pedido VALUES
	(DEFAULT,1,'2016-01-01',1,1),
	(DEFAULT,2,'2022-01-01',2,2),
	(DEFAULT,3,'2022-02-01',3,3),
	(DEFAULT,4,'2022-03-01',4,4),
	(DEFAULT,5,'2016-01-01',5,5),
	(DEFAULT,6,'2016-01-01',6,6),
	(DEFAULT,7,'2016-01-01',7,7),
	(DEFAULT,8,'2016-01-01',8,8),
	(DEFAULT,9,'2016-01-01',9,9),
	(DEFAULT,10,'2016-01-01',10,10);


INSERT INTO pedido_item VALUES
	(1,1,1,1,59.99,0.2),
    (2,2,2,2,179.99,0.07),
	(3,3,3,1,154.00,0.05),
	(4,4,4,2,599.99,0.05),
	(6,6,6,1,289.99,0.2),
	(7,7,7,1,59.99,0.07),
	(8,8,8,2,59.99,0.05),
	(9,9,9,1,99.99,0.05),
	(10,10,10,1,59.99,0.05);