CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE cliente_fisico(
codigo int(4) AUTO_INCREMENT,
nome varchar(30) NOT NULL,
email varchar(50),
telefone
cpf
PRIMARY KEY (codigo)
);

CREATE TABLE cliente_juridico(
codigo int(4) AUTO_INCREMENT,
nome_fantasia varchar(50),
email
telefone
cnpj
razao_social
);

CREATE TABLE pedido(
id__pedido int(4) AUTO_INCREMENT,
cod_pedido
cod_produto
cupom_desconto
quantidade_produto
cod_cliente
id_estoque
data_hora_pedido
valor_produto
cod_pagamento
valor_total
);

CREATE TABLE entrega(
id_ent int(4) AUTO_INCREMENT,
cod_pedido
data_pedido
quantidade
endereco
data_entregue
data_saida
prazo_entrega
cod_produto
frete
);

CREATE TABLE produto(
cod_produto int(4) AUTO_INCREMENT,
desconto
marca
publico_alvo
sexo
material
preco
tamanho
tipo
descricao
modelo
categoria
);

CREATE TABLE estoque(
id_estoque int(4) AUTO_INCREMENT,
qtd_movimento
saldo_movimento
cod_produto
tipo_movimento
);

CREATE TABLE compra(
cod_compra int(4) AUTO_INCREMENT,
cnpj_for
cod_produto
data_hora_compra
);

CREATE TABLE fornecedor(
cnpj_for int(4),
contato
nome_fantasia_for
razao_social_for
);

CREATE TABLE troca_defeito(
cod_troca_defeito int(4) AUTO_INCREMENT,
cod_produto
cod_pedido
defeito_descricao
tamanho
data_devolucao
cnpj_for
);

CREATE TABLE troca_tamanho(
cod_troca_tamanho int(4) AUTO_INCREMENT,
cod_produto
cod_pedido
tamanho
data_devolucao
id_estoque
);

CREATE TABLE pagamento_cartao_credito(
id_cartão int(4) AUTO_INCREMENT,
bandeira
data_validade
cod_seguranca
numero_cartao
nome_cartao
num_parcela
);

CREATE TABLE pagamento_cartao_virtual(
id_cartão int(4) AUTO_INCREMENT,
bandeira
data_validade
cod_seguranca
numero_cartao
nome_cartao
num_parcela_virtual
);

CREATE TABLE pagamento_cartao_loja(
id_cartão int(4) AUTO_INCREMENT,
bandeira
data_validade
cod_seguranca
numero_cartao
nome_cartao
data_nasc
nome_mae
cpf
administradora
parcela_loja
nome_completo
);

CREATE TABLE pagamento_cartao_debito(
id_cartão int(4) AUTO_INCREMENT,
bandeira
data_validade
cod_seguranca
numero_cartao
nome_cartao
banco
contato
agencia
);

CREATE TABLE pagamento_boleto(
cod_boleto int(4) AUTO_INCREMENT,
data_impressao
vencimento
valor
multa_basica
multa_dia_corrido
);

CREATE TABLE pagamento_transferencia(
cod_transferencia int(4) NOT NULL,
agencia
conta
digito
valor
);

CREATE TABLE vale_presente_fisico(
cod_presente int(4) NOT NULL,
validade
valor
numero
);

CREATE TABLE vale_presente_virtual(
cod_presente int(4) NOT NULL,
validade
valor
email_presenteado
nome_presenteado
);

