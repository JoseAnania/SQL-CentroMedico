
--SELECT--

select * from Paciente 
select * from Turno

--INSERT--

insert into paciente (nombre, apellido, fNacimiento, domicilio, idPais, telefono,email, observacion) 
values ('Luis', 'Robles', '2017-01-04', 'Piedra Buena 21', 'ESP','', '','')

--DELETE--

delete from Paciente where idPaciente=5

--UPDATE--

update Paciente set observacion='Pacientes creados desde UI' --Sin una cláusula modificará todos los registros--

--CLAUSULA WHERE--

select * from Paciente where apellido='Perez'
delete from Paciente where nombre = 'Claudio' and apellido = 'Lopez'
update Paciente set observacion = 'observacion modificada' where idPaciente=3

--CLAUSULA TOP--

select top 2 * from Paciente
select top 2 * from Paciente where apellido='Perez'
select top 1 * from Turno
select top 1 * from Turno order by fechaTurno desc --último turno--

--CLAUSULA ORDER BY--

select * from Paciente order by fNacimiento --por defecto es asc--
select * from Paciente order by fNacimiento desc
select top 1 * from Paciente order by fNacimiento --el más viejo--
select top 1 * from Paciente order by fNacimiento desc --el más joven--

--CLAUSULA DISTINCT-- (agrupa los registros por un campo en particular)

select distinct apellido from Paciente --si hay personas con el mismo apellido los mostrará en una sola linea agrupadas por el apellido--

--CLAUSULA GROUP BY-- (similar a la DISTINCT pero con funciones más avanzadas)

select apellido from Paciente group by apellido

--FUNCION DE AGREGADO MAX/MIN--

select max(idpaciente) from Paciente
select min(idpaciente) from Paciente
select apellido, min(idPaciente) from Paciente group by apellido

--FUNCION SUM--

select apellido, sum(idPaciente) from Paciente group by apellido

--FUNCION AVG-- (average, promedio)

select avg (idPaciente) from Paciente --como el idPaciente es un int, el resultado será un int--

--FUNCION COUNT--

select count (idPaciente) from Paciente
select count (idPaciente) from Paciente where apellido='Perez'

--FUNCION HAVING-- (filtra los registros sobre un conjunto de registros, es decir acompaña a la cláusula GROUP BY)

select idEstado from Turno group by idEstado having idEstado = 0 --agrupa los registros donde el idEstado es 0 (2 registros)--
select idEstado from Turno group by idEstado having count (idEstado) = 2 --agrupa los registros por idEstado donde existan 2 estados iguales--

--OPERADOR AND--

select * from Paciente where apellido = 'Perez' and nombre ='Roberto'

--OPERADOR OR--

select * from Paciente where apellido = 'Perez' or nombre ='Jorge'

--OPERADOR IN-- (filtra por grupo de valores)

select * from Turno where idEstado in (1,2)
select * from Paciente where apellido in ('Perez3', 'Perez')

--OPERADOR LIKE--

select * from Paciente where nombre like 'Roberto' --funciona como un = (pero con funciones más avanzadas)--
select * from Paciente where nombre like 'R%' --Nombres que empiezan con R--

--OPERADOR NOT--

select * from Paciente where nombre not like 'R%' --Todos los nombres que no empiezan con R--
select * from Turno where idEstado not in (1,2)

--OPERADOR BETWEEN--

select * from Turno where fechaTurno between '20200301' and '20200304'
select * from Turno where idTurno between 2 and 3

