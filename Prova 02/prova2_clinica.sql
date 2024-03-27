drop database if exists prova2_clinica;
create schema prova2_clinica;
use prova2_clinica;

# EXERCÍCIO 1
create table paciente(
id int auto_increment primary key,
nome varchar(50) not null,
telefone varchar(15)
);

create table aplicador(
id int auto_increment primary key,
nome varchar(50) not null,
capacidade int not null
);

create table vacina(
id int auto_increment primary key,
descricao varchar(20)
);

create table rel_agendamento(
id int auto_increment primary key,
dataApl date not null,
paciente_id int not null,
aplicador_id int not null,
vacina_id int not null,
foreign key (vacina_id) references vacina(id)
on update cascade
on delete restrict,
foreign key(paciente_id) references paciente(id)
on update cascade
on delete restrict,
foreign key(aplicador_id) references aplicador(id)
on update cascade
on delete restrict
);

create table rel_quantitativo(
id int auto_increment primary key,
agendamento_id int not null,
paciente_id int not null,
foreign key(agendamento_id) references rel_agendamento(id)
on update cascade
on delete restrict,
foreign key(paciente_id) references paciente(id)
on update cascade
on delete restrict
);

create index idx_data on rel_agendamento(dataApl);

# EXERCÍCIO 2
#Primeira Inserção
insert into aplicador values (default, 'João Paulo', '15');
insert into paciente values (default, 'Altair Maia', '(11) 11111-1111');
insert into vacina values (default, 'Gripe');
insert into rel_agendamento values (default, '2022-10-14', last_insert_id(), last_insert_id(), last_insert_id());

insert into aplicador values (default, 'João Paulo', '15');
insert into paciente values (default, 'Juliana Pedroso', '(22) 22222-2222');
insert into vacina values (default, 'Covid');
insert into rel_agendamento values (default, '2022-10-14', last_insert_id(), last_insert_id(), last_insert_id());

insert into aplicador values (default, 'João Paulo', '15');
insert into paciente values (default, 'Justino Cardozo', '(33) 33333-3333');
insert into vacina values (default, 'Febre Amarela');
insert into rel_agendamento values (default, '2022-10-14', last_insert_id(), last_insert_id(), last_insert_id());

insert into aplicador values (default, 'João Paulo', '15');
insert into paciente values (default, 'Maria de Freitas', '(44) 44444-4444');
insert into vacina values (default, 'Hepatite');
insert into rel_agendamento values (default, '2022-10-14', last_insert_id(), last_insert_id(), last_insert_id());

#Segunda Inserção
insert into aplicador values (default, 'Mariá Fernandes Dominguez', '10');
insert into paciente values (default, 'Altair Maia', '(11) 11111-1111');
insert into vacina values (default, 'Gripe');
insert into rel_agendamento values (default, '2022-10-28', last_insert_id(), last_insert_id(), last_insert_id());

insert into aplicador values (default, 'Mariá Fernandes Dominguez', '10');
insert into paciente values (default, 'Juliana Pedroso', '(22) 22222-2222');
insert into vacina values (default, 'HPV');
insert into rel_agendamento values (default, '2022-10-28', last_insert_id(), last_insert_id(), last_insert_id());

insert into aplicador values (default, 'Mariá Fernandes Dominguez', '10');
insert into paciente values (default, 'Maria de Freitas', '(44) 44444-4444');
insert into vacina values (default, 'Covid');
insert into rel_agendamento values (default, '2022-10-28', last_insert_id(), last_insert_id(), last_insert_id());

# EXERCÍCIO 3
select ra.dataApl 'Data agendada para aplicações', a.nome 'Nome do Aplicador', a.capacidade 'Capacidade',
			p.nome 'Nome do Paciente', p.telefone 'Telefone', v.descricao 'Vacina' from
            rel_agendamento ra 
            join (select id, nome, capacidade from aplicador group by id) a
            on ra.aplicador_id = a.id
            join (select id, nome, telefone from paciente) p
            on ra.paciente_id = p.id
            join (select id, descricao from vacina) v
            on ra.vacina_id = v.id;

#EXERCÍCIO 4
select count(ra.paciente_id) 'Quantidade de aplicações agendadas' from rel_agendamento ra join paciente p on ra.paciente_id = p.id
	where p.telefone = '(44) 44444-4444';

#EXERCÍCIO 5
select ra.dataApl 'Data de aplicação', count(ra.paciente_id) 'Pacientes agendados' from rel_agendamento ra join paciente p on ra.paciente_id = p.id
	group by dataApl;
    
#EXERCÍCIO 6
select max(a.capacidade) 'Maior Capacidade', min(a.capacidade) 'Menor capacidade' from aplicador a;

#EXERCÍCIO 7
select p.nome from rel_agendamento ra join paciente p on ra.paciente_id = p.id
		join (select id, descricao from vacina) v
        on ra.vacina_id = v.id
        where v.descricao = 'Covid' or v.descricao = 'Hepatite'
        group by p.nome;

#EXERCÍCIO 8
delete from rel_agendamento
where aplicador_id in (select id from aplicador where nome like '%maria%');