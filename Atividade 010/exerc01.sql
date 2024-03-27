CREATE DATABASE Hospital;

USE Hospital;

CREATE TABLE Pessoa(
id int auto_increment not null,
nome varchar(60) not null,
cidade varchar(60) not null,
cpf char(14) not null,
rg char(9) not null,
PRIMARY KEY	(id),
UNIQUE KEY (cpf),
UNIQUE KEY (rg)
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

CREATE INDEX  nome_pessoa 
ON Pessoa(nome);

CREATE UNIQUE INDEX rg 
ON Pessoa(rg);

CREATE UNIQUE INDEX cpf 
ON Pessoa(cpf);

CREATE UNIQUE INDEX idx_numero_agencia 
ON Conta(id, numero, agencia);

CREATE UNIQUE INDEX idx_medico_data_hora 
ON Consulta(consulta_id, medico_id, data_hora);

CREATE UNIQUE INDEX idx_paciente_data_hora 
ON Consultcontaconsultaa(consulta_id, paciente_id, data_hora);

INSERT INTO Pessoa (nome, cidade, cpf, rg) 
VALUES 
('Arthur Barbosa', 'Poço Branco', '111.111.111-11', '2222'),
('Anna Souza', 'Natal', '999.999.999-99', '1234'),
('Davi Leite', 'Tibau do Sul', '222.222.222-22', '3333'),
('Victor Hugo', 'Natal', '777.777.777-77', '8888'), 
('Gabriela Souza', 'Nova Cruz', '333.333.333-33', '4444'),
('Miguel Leite', 'Apodi', '000.000.000-00', '1111'),
('Anna Souza', 'Nova Cruz', '444.444.444-44', '5555'),
('Miguel Castro', 'Natal', '888.888.888-88', '9999'),
('Nicolas Alvez', 'Currais Novos', '555.555.555-55', '6666'),
('Eduardo Henrique', 'Pamamirim', '666.666.666-66', '7777');

INSERT INTO Pessoa (nome, cidade, cpf, rg) 
VALUES
('Anna Gabriela', 'Touros', '444.404.444-44', '1005'),
('Davi Leite', 'Canguaretama', '202.202.202-22', '1003'),
('Eduardo Luiz', 'Pamamirim', '666.606.666-66', '1007'),
('João Paulo', 'Nova Cruz', '303.333.333-33', '1004'),
('Leonardo Alvez', 'Nísia Floresta', '010.010.010-11', '1001'),
('Miguel Castro', 'Parelhas', '888.888.808-88', '1009'),
('Nicolas Alvez', 'Currais Novos', '555.505.555-55', '1006'),
('Otávio Breno', 'Natal', '999.909.999-99', '1010'),
('Thiago Lucas', 'Poço Branco', '101.101.101-00', '1002'),
('Victor Hugo', 'Natal', '777.777.707-77', '1008');

INSERT INTO Conta (numero, agencia, saldo, pessoa_id) 
VALUES
(1119, '12300', 200.99, 12),
(2229, '99900', 1872.99, 13),
(3339, '88800', -150.99, 9),
(4449, '77700', 50.43, 14),
(5559, '66600', 2040, 16),
(6669, '55500', -10.89, 15),
(7779, '44400', 300.39, 19),
(8889, '33300', 200.39, 20),
(9999, '22200', 2900.29, 11),
(1239, '11100', 3987.99, 5);

INSERT INTO Paciente (pessoa_id, doenca) 
VALUES 
(11, 'Pericardite'),
(12, 'Arritimia'),
(13, 'Conjutivite'),
(14, 'Doença de Chagas'),
(15, 'Epilepsia'),
(16, 'Catarata'),
(17, 'Espasmo das Pálpebras'),
(18, 'Acne'),
(19, 'Doença de Huntington'),
(20, 'Glaucoma');

INSERT INTO Medico (pessoa_id, especialidade) 
VALUES 
(1, 'Anestegiologia'),
(2, 'Cardiologia'),
(3, 'Cardiologia'),
(4, 'Cardiologia'),
(5, 'Dermatologia'),
(6, 'Infectologia'),
(7, 'Mastologia'),
(8, 'Neurologia'),
(9, 'Neurologia'),
(10, 'Oftalmologia');

INSERT INTO Consulta (medico_id, paciente_id, data_hora) 
VALUES
(4, 17, '2013-02-12 14:00:00'),
(4, 11, '2013-02-12 14:30:00'),
(4, 20, '2013-02-13 13:00:00'),
(9, 19, '2013-02-16 19:00:00'),
(9, 15, '2013-02-16 20:00:00'),
(4, 13, '2013-02-20 16:30:00'),
(4, 16, '2013-02-21 08:00:00'),
(5, 18, '2013-02-22 09:00:00'),
(3, 12, '2013-02-24 20:00:00'),
(3, 14, '2013-02-25 20:00:00');