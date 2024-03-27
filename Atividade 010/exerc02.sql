USE Hospital;

SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;

UPDATE Pessoa SET nome = 'Pedro Bial'
	WHERE cpf = '444.444.444-44';
    
UPDATE Pessoa SET nome = 'Silvio Santos', cidade = 'Apodi'
	WHERE rg = '1001';

UPDATE Conta SET saldo = 0 
	WHERE numero = 9999 AND agencia = '22200';

UPDATE Consulta SET medico_id = 8
	WHERE paciente_id = 15;

UPDATE Conta SET saldo=saldo+200.00
	WHERE saldo < 0;

UPDATE Consulta SET data_hora = '2013-02-28 07:00:00'
	WHERE paciente_id = 14 AND medico_id = 2;

UPDATE Conta SET saldo=saldo/2 
	WHERE saldo >= 1000;

DELETE FROM Pessoa
	WHERE rg = '1008';

DELETE FROM Consulta 
	WHERE data_hora BETWEEN '2013-02-06 00:00:00' AND '2013-02-21 00:00:00';

DELETE FROM Consulta 
	WHERE paciente_id = 14;
