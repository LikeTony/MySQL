DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE IF NOT EXISTS Hospital;

USE Hospital;

CREATE TABLE Pessoa(
id int auto_increment not null,
nome varchar(60) not null,
cidade varchar(60) not null,
cpf char(14) not null unique,
rg char(9) not null unique,
PRIMARY KEY	(id)
);

CREATE TABLE Medico(
pessoa_id int not null,
especialidade varchar(60) not null,
PRIMARY KEY	(pessoa_id),
FOREIGN KEY(pessoa_id) REFERENCES Pessoa(id)
ON UPDATE CASCADE
ON DELETE RESTRICT
);

CREATE TABLE Paciente(
pessoa_id int not null,
doenca varchar(60) not null,
PRIMARY KEY	(pessoa_id),
FOREIGN KEY(pessoa_id) REFERENCES Pessoa(id)
ON UPDATE CASCADE
ON DELETE RESTRICT
);

CREATE TABLE Consulta(
consulta_id int auto_increment not null,
medico_id int not null,
paciente_id int not null,
data_hora DATETIME not null,
PRIMARY KEY	(consulta_id),
FOREIGN KEY(paciente_id) REFERENCES Paciente(pessoa_id)
ON UPDATE CASCADE
ON DELETE RESTRICT,
FOREIGN KEY(medico_id) REFERENCES Medico(pessoa_id)
ON UPDATE CASCADE
ON DELETE RESTRICT
);

CREATE TABLE Conta(
id int auto_increment not null,
numero int not null,
agencia varchar(60) not null,
saldo decimal(6, 2) not null,
pessoa_id int not null,
PRIMARY KEY (id),
FOREIGN KEY(pessoa_id) REFERENCES Pessoa(id)
ON UPDATE CASCADE
ON DELETE RESTRICT
);

CREATE INDEX  idx_nomePessoa 
ON Pessoa(nome);

CREATE UNIQUE INDEX idx_numero_agencia 
ON Conta(id, numero, agencia);

CREATE UNIQUE INDEX idx_medico_data_hora 
ON Consulta(consulta_id, medico_id, data_hora);

ALTER TABLE consulta
DROP COLUMN data_hora,
ADD COLUMN dataC DATE,
ADD COLUMN horaC TIME;
