-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE pagamento (
status VARCHAR(10),
metodo VARCHAR(10),
valor DECIMAL(10,2),
id_pagamento INTEGER PRIMARY KEY,
id_reserva INTEGER
)

CREATE TABLE clientes (
telefone VARCHAR(15),
senha_cli VARCHAR(255),
email_cli VARCHAR(150),
nome_cli VARCHAR(100),
id_cliente INTEGER PRIMARY KEY
)

CREATE TABLE user_admin (
id_admin VARCHAR(10) PRIMARY KEY,
nome_admin VARCHAR(100),
email_adm VARCHAR(150),
senha_adm VARCHAR(255),
nivel_acesso VARCHAR(15)
)

CREATE TABLE reservas (
status VARCHAR(10),
data_reserva DATETIME,
id_reserva INTEGER PRIMARY KEY,
id_cliente INTEGER,
id_pacote INTEGER,
FOREIGN KEY(id_cliente) REFERENCES clientes (id_cliente)
)

CREATE TABLE hoteis (
nome_hotel VARCHAR(100),
estrelas VARCHAR(5),
endereco VARCHAR(255),
id_hotel INTEGER PRIMARY KEY,
id_destino INTEGER
)

CREATE TABLE destinos (
nome_destino VARCHAR(100),
descricao_destino VARCHAR(255),
id_destino INTEGER PRIMARY KEY
)

CREATE TABLE pacotes (
descricao_pacote VARCHAR(255),
noite INTEGER,
preco DECIMAL(10,2),
nome_pacote VARCHAR(100),
id_pacote INTEGER PRIMARY KEY,
id_hotel INTEGER,
id_destino INTEGER,
FOREIGN KEY(id_hotel) REFERENCES hoteis (id_hotel),
FOREIGN KEY(id_destino) REFERENCES destinos (id_destino)
)

CREATE TABLE gerencia (
id_admin VARCHAR(10),
id_pacote INTEGER,
FOREIGN KEY(id_admin) REFERENCES user_admin (id_admin),
FOREIGN KEY(id_pacote) REFERENCES pacotes (id_pacote)
)

ALTER TABLE pagamento ADD FOREIGN KEY(id_reserva) REFERENCES reservas (id_reserva)
ALTER TABLE reservas ADD FOREIGN KEY(id_pacote) REFERENCES pacotes (id_pacote)
ALTER TABLE hoteis ADD FOREIGN KEY(id_destino) REFERENCES destinos (id_destino)
