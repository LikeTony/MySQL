create database hospital;

use hospital;

create table pessoa(
id int primary key auto_increment,
nome varchar(50) not null,
cidade varchar(30) not null,
cpf char(11) not null unique,
rg varchar(20) not null unique
);

create table medico(
medico_id int not null,
especialidade varchar(30),
primary key (medico_id),
foreign key (medico_id) references pessoa(id)
ON update CASCADE
ON delete RESTRICT
);

create table paciente(
paciente_id int not null,
doenca varchar(30),
primary key(paciente_id),
foreign key (paciente_id) references pessoa(id)
ON update CASCADE
ON delete RESTRICT
);

create table consulta(
medico_id int not null,
paciente_id int not null,
data_hora datetime,
primary key (medico_id, paciente_id),
foreign key (medico_id) references medico(medico_id)
ON update CASCADE
ON delete RESTRICT,
foreign key (paciente_id) references paciente(paciente_id)
ON update CASCADE
ON delete RESTRICT
);

create table conta(
id int primary key auto_increment,
numero int not null,
agencia int not null,
saldo int not null,
pessoa_id int not null,
foreign key (pessoa_id) references pessoa(id)
ON update CASCADE
ON delete RESTRICT
);

create unique index id_numero_agencia
ON conta(numero, agencia);

create index id_nomePessoa
ON pessoa(nome);

alter table consulta
drop column data_hora,
add datac date,
add horac time;
