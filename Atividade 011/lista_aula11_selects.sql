USE Hospital;

select * from medico INNER JOIN pessoa ON id = pessoa_id ORDER BY especialidade, nome ASC;

select * from paciente INNER JOIN pessoa ON id = pessoa_id ORDER BY nome ASC;

select * from consulta INNER JOIN pessoa ON id = paciente_id ORDER BY horaC ASC;

select * from conta ORDER BY saldo DESC;

select * from consulta;