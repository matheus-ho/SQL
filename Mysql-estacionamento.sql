/*
1-) Elabore uma trg para disparar inserindo um novo registro na tabela PROSPECCAO quando um cliente for excluido

2-) Exibir as placas dos veiculos que não estão estacionados em nenhum patio da empresa

3-) Exibir os patios que não tem veiculos estacionados

4-) Elabore uma sp para exibir todos os veiculos e os patios onde estão estacionandos

5-) Elabore uma SP que permita exibir os patios que não tem veiculos estacionados

6-) Criar uma VIEW com todos os Veiculos e anos de fabricação.

7-) Exibir as placas dos veiculos que estão estacionados no mesmo patio que os veiculos do Luiz Fernando (não tem LEANDRO DE M. MISSALLI).

8-) Exibir o total de veiculos cadastrados
*/

CREATE DATABASE estacionamento;
USE estacionamento;

create table patio(
codpat int(3) primary key,
endpat varchar(50),
qtdpat int(4)
);

create table modelo(
codmod int(3) primary key,
desmod varchar(70)
);

create table cliente(
cpfcli int(11) primary key,
nomcli varchar(60),
dtnasc date
);

create table veiculo(
plavei Varchar(8) primary key,
modelo_codmod int(3),
cliente_cpf int(11),
cor VARCHAR(20),
AnoVei int,
FOREIGN KEY (modelo_codmod) REFERENCES modelo(codmod),
FOREIGN KEY (cliente_cpf) REFERENCES cliente(cpfcli)
);

create table estaciona(
cod int(4) primary key,
patio_num int(3),
veiculo_placa Varchar(8),
dtEntrada varchar(10),
dtSaida varchar(10),
hrEntrada varchar(10),
hrSaida varchar(10),
FOREIGN KEY (patio_num) REFERENCES patio(codpat),
FOREIGN KEY (veiculo_placa) REFERENCES veiculo(plavei)
);

INSERT INTO patio (codpat, endpat, qtdpat) VALUES(1,'Alameda Shopping',1000);
INSERT INTO patio (codpat, endpat, qtdpat) VALUES(2,'Taguatinga Shopping',2000);
INSERT INTO patio (codpat, endpat, qtdpat) VALUES(3,'Park Shopping',5000);
INSERT INTO patio (codpat, endpat, qtdpat) VALUES(4,'Pátio Brasil',5000);
INSERT INTO patio (codpat, endpat, qtdpat) VALUES(5,'Pátio UMC',500);
INSERT INTO patio (codpat, endpat, qtdpat) VALUES(6,'Park Leopoldina',2000);

INSERT INTO modelo (codmod, desmod) VALUES (1,'C4 Pallas');
INSERT INTO modelo (codmod, desmod) VALUES (2,'Astra');
INSERT INTO modelo (codmod, desmod) VALUES (3,'Punto');
INSERT INTO modelo (codmod, desmod) VALUES (4,'Stillo');
INSERT INTO modelo (codmod, desmod) VALUES (5,'Focus');
INSERT INTO modelo (codmod, desmod) VALUES (6,'Polo');
INSERT INTO modelo (codmod, desmod) VALUES (7,'Gol');

INSERT INTO cliente (cpfcli,nomcli,dtnasc) VALUES (11, 'José Felipe', '1978-12-12');
INSERT INTO cliente (cpfcli,nomcli,dtnasc) VALUES (22,'Ana Mari','1979-10-10');
INSERT INTO cliente (cpfcli,nomcli,dtnasc) VALUES (33,'Luiz Fernando','1945-05-02');
INSERT INTO cliente (cpfcli,nomcli,dtnasc) VALUES (55,'Luiz Miguel','1964-07-23');
INSERT INTO cliente (cpfcli,nomcli,dtnasc) VALUES (66,'Catia Regina','1985-09-27');
INSERT INTO cliente (cpfcli,nomcli,dtnasc) VALUES (77,'Luiz Augusto','1992-02-16');
INSERT INTO cliente (cpfcli,nomcli,dtnasc) VALUES (88,'Marcos Julio','1965-06-12');

INSERT INTO veiculo (plavei, modelo_codmod, cliente_cpf, cor, AnoVei) VALUES ('GNF-1000',6,33,'Rosa',2006);
INSERT INTO veiculo (plavei, modelo_codmod, cliente_cpf, cor, AnoVei) VALUES ('JEG-1010',2,22,'Verde',2005);
INSERT INTO veiculo (plavei, modelo_codmod, cliente_cpf, cor, AnoVei) VALUES ('JEG-3030',4,11,'Verde',2004);
INSERT INTO veiculo (plavei, modelo_codmod, cliente_cpf, cor, AnoVei) VALUES ('JEL-2020',3,33,'Azul',2007);
INSERT INTO veiculo (plavei, modelo_codmod, cliente_cpf, cor, AnoVei) VALUES ('JJJ-2020',1,11,'Prata',2008);
INSERT INTO veiculo (plavei, modelo_codmod, cliente_cpf, cor, AnoVei) VALUES ('JLL-4040',5,22,'Preto',2005);
INSERT INTO veiculo (plavei, modelo_codmod, cliente_cpf, cor, AnoVei) VALUES ('ANG-0000',7,11,'Verde',2006);

INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES(1,1,'JJJ-2020','2018/03/10','2018/03/12','10:00:00','12:00:00');
INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES(2,2,'JEG-1010','2018/02/15','2018/02/20','12:00:00','15:00:00');
INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES(3,3,'JJJ-2020','2018/02/12','2018/02/12','22:00:00','08:00:00');
INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES(4,4,'JEL-2020','2018/02/07','2018/02/07','19:00:00','22:00:00');
INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES(5,4,'JEL-2020','2018/01/22','2018/01/10','19:00:00','22:00:00');
INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES(6,1,'JLL-4040','2018/01/22','2018/01/23','19:00:00','22:00:00');
INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES(7,1,'JLL-4040','2018/02/25','2018/02/06','19:00:00','22:00:00');
INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES(8,2,'ANG-0000','2018/03/01','2018/03/01','19:00:00','22:00:00');

/*1*/Create Table prospeccao(
cod_prosp int(3) auto_increment primary key,
msg char(20),
dia date
);

DELIMITER $
CREATE TRIGGER trg_cliente_deletado AFTER DELETE ON cliente 
FOR EACH ROW
BEGIN
INSERT INTO prospeccao(msg, dia) VALUES ('Cliente Deletado', CURDATE());
END$

DELIMITER ;

DELETE FROM cliente WHERE cpfcli = 88;

SELECT * FROM prospeccao;

/* ------------------------- */
/*2*/SELECT v.plavei FROM veiculo v LEFT JOIN  estaciona e ON v.plavei = e.veiculo_placa WHERE e.cod is NULL;

/* ------------------------- */
/*3*/SELECT p.endpat FROM patio p LEFT JOIN estaciona e ON p.codpat = e.patio_num WHERE e.veiculo_placa is NULL;

/* ------------------------- */
/*4*/DELIMITER $$
CREATE PROCEDURE PDC_VEICULO_PATIO()
BEGIN
SELECT DISTINCT v.plavei AS 'PLACA', p.endpat AS 'PATIO' FROM veiculo v
INNER JOIN  estaciona e ON v.plavei = e.veiculo_placa 
INNER JOIN patio p ON e.patio_num = p.codpat;
END$$

DELIMITER ;

CALL PDC_VEICULO_PATIO();

/* ------------------------- */
/*5*/DELIMITER $$
CREATE PROCEDURE PDC_PATIO_VAZIO()
BEGIN
SELECT p.endpat FROM patio p LEFT JOIN estaciona e ON p.codpat = e.patio_num WHERE e.veiculo_placa is NULL;
END$$

DELIMITER ;
CALL PDC_PATIO_VAZIO();

/* ------------------------- */
/*6*/CREATE VIEW vw_placa_ano AS SELECT v.plavei, m.desmod, v.AnoVei FROM veiculo v INNER JOIN modelo m ON v.modelo_codmod = m.codmod;

SELECT * FROM vw_placa_ano;

/* ------------------------- */
/*7*/SET @estacionado := (SELECT DISTINCT p.endpat from patio p INNER JOIN estaciona e ON p.codpat = e.patio_num 
INNER JOIN veiculo v ON e.veiculo_placa = v.plavei INNER JOIN cliente c ON v.cliente_cpf = c.cpfcli WHERE c.nomcli = 'Luiz Fernando');

Select  @estacionado;
SELECT DISTINCT e.veiculo_placa FROM estaciona e INNER JOIN patio p ON e.patio_num = p.codpat WHERE p.endpat = @estacionado;

/* ------------------------- */
/*8*/SELECT COUNT(plavei) FROM veiculo;