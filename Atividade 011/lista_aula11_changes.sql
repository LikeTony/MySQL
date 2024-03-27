SET SQL_SAFE_UPDATES=0;
SET FOREIGN_KEY_CHECKS = 0;

update pessoa set nome = "Pedro Bial"
where cpf = "444.444.444-44";

update pessoa set nome = "Silvio Santos", cidade = "Apodi"
where rg = "1001";

update conta set saldo = 0
where numero = "9999" and agencia = "22200";

update consulta set medico_id = 8
where paciente_id = 15;

update conta set saldo = saldo + 200
where saldo < 0;

update conta set saldo = saldo DIV 2
where saldo >= 1000;

insert into consulta (medico_id, paciente_id, dataC, horaC) 
values ('2', '14', '2013-02-28','07:00:00');

delete from pessoa where rg = '1001';

delete from consulta where dataC > "2013-02-16" and dataC < "2013-02-21";

delete from consulta where paciente_id = '14';

select * from consulta;

SET SQL_SAFE_UPDATES=1;
SET FOREIGN_KEY_CHECKS = 1;
