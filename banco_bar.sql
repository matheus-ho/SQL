CREATE DATABASE relationalBar;
USE relationalBar;

CREATE TABLE mesa(
cod_mesa int(2) primary key,
lugares_total int(2),
lugares_disponivel int(2),
disponivel TINYINT(1),
area_externa TINYINT(1),
fumante TINYINT(1)
);

CREATE TABLE comanda( 
cod_comanda int(2) primary key,
cod_bebida int(2),
cod_comida int(2),
data_hora_inicio DATETIME,
data_hora_fim DATETIME,
FOREIGN KEY (cod_bebida) REFERENCES bebidas(cod_bebida),
FOREIGN KEY (cod_comida) REFERENCES comidas(cod_comida)
);

CREATE TABLE consumo(
cod_consumo int(3),
cod_mesa int(2),
valor float(3,2),
cod_garcon int(2),
cod_cliente int(2),
dezporcento float(3,2),
cod_comanda int(2),
FOREIGN KEY (cod_comanda) REFERENCES comanda(cod_comanda),
FOREIGN KEY (cod_mesa) REFERENCES mesa(cod_mesa),
FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente),
FOREIGN KEY (cod_garcon) REFERENCES garcon(cod_garcon)
);


CREATE TABLE bebidas(
cod_bebida int(2) primary key,
des_bebida varchar(100),
val_bebida varchar(10)
);

CREATE TABLE comidas(
cod_comida int(2) primary key,
des_comida varchar(100),
val_comida varchar(10)
);

CREATE TABLE cliente(
cod_cliente int(2) primary key,
nome_cliente varchar(50),
saldo float(3,2)
);

CREATE TABLE garcon(
cod_garcon int(2) primary key,
nome_garcon varchar(50),
);

INSERT INTO comidas (cod_comida, des_comida, val_comida) VALUES (1, 'Batata Frita', 4.50);
INSERT INTO comidas (cod_comida, des_comida, val_comida) VALUES (2, 'Coxinha', 3.20);
INSERT INTO comidas (cod_comida, des_comida, val_comida) VALUES (3, 'Kibe', 2.30);

INSERT INTO bebidas (cod_bebida, des_bebida, val_bebida) VALUES (1, 'Pepsi 350ml', 3.80);
INSERT INTO bebidas (cod_bebida, des_bebida, val_bebida) VALUES (2, 'Coca Cola 350ml', 4.00);
INSERT INTO bebidas (cod_bebida, des_bebida, val_bebida) VALUES (3, 'Itubaina 350ml', 3.50);

INSERT INTO cliente (cod_cliente, nome_cliente, saldo) VALUES (1, 'Renato', 0.00);
INSERT INTO cliente (cod_cliente, nome_cliente, saldo) VALUES (2, 'Fernando', 0.00);
INSERT INTO cliente (cod_cliente, nome_cliente, saldo) VALUES (3, 'Marcos', 0.00);
INSERT INTO cliente (cod_cliente, nome_cliente, saldo) VALUES (4, 'Fernanda', 0.00);

INSERT INTO mesa (cod_mesa, lugares_total, lugares_disponivel, disponivel, area_externa, fumante) VALUES (1, 4, 4, 0, 0);
INSERT INTO mesa (cod_mesa, lugares_total, lugares_disponivel, disponivel, area_externa, fumante) VALUES (2, 4, 4, 1, 0);
INSERT INTO mesa (cod_mesa, lugares_total, lugares_disponivel, disponivel, area_externa, fumante) VALUES (3, 2, 2, 0, 0);
INSERT INTO mesa (cod_mesa, lugares_total, lugares_disponivel, disponivel, area_externa, fumante) VALUES (4, 8, 8, 1, 1);

INSERT INTO garcon (cod_garcon, nome_garcon) VALUES (1, 'Jerson');
INSERT INTO garcon (cod_garcon, nome_garcon) VALUES (2, 'Carlos');
INSERT INTO garcon (cod_garcon, nome_garcon) VALUES (3, 'Jessica');
INSERT INTO garcon (cod_garcon, nome_garcon) VALUES (4, 'Vinicius')

INSERT INTO comanda (cod_comanda, cod_bebida, cod_comida, data_hora_inicio, data_hora_fim ) VALUES (1, 2, 3, '2018-10-01 10:50:42', '2018-10-01 10:57:00');

INSERT INTO consumo (cod_consumo, cod_mesa, valor, cod_garcon, cod_cliente, dezporcento, cod_comanda) VALUES (1, 1, 6.30, 1, 1, 0.63, 1);


