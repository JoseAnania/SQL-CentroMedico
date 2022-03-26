--STORED PROCEDURE-- (conjunto de procedimientos almacenados que ejecutan acciones concretas)

create proc SP_paciente 
(
@idPaciente int
)
as
select * from Paciente where idPaciente = @idPaciente

go

--ejecución--
exec SP_paciente 3

--INSERT EN TABLA PACIENTES--

create proc SP_AltaPaciente
(
	@dni varchar(20),
	@nombre varchar(50),
	@apellido varchar(50),
	@fNacimiento varchar(8),---usamos varchar
	@domicilio varchar(50),
	@idPais char(3),
	@telefono varchar(20) = '',
	@email varchar(30),
	@observacion varchar(1000) = ''
)
as

if not exists (select * from Paciente where dni=@dni) --Validar si el paciente ya existe--
begin
	insert into Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
	values (@dni, @nombre, @apellido, @fNacimiento, @domicilio, @idPais, @telefono, @email, @observacion)
	print 'El paciente de agregó correctamente'
	return
end
else
begin
	print 'El paciente ya existe'
	return
end

exec SP_AltaPaciente '28655784', 'José', 'Anania', '19810410', 'Colón 720', 'ARG', '3515555284', 'jose@gmail.com', ''

--INSERT EN TABLA TURNOS y TURNOPACIENTE-- 

/*
idESTADO = 0 (pendiente)
idESTADO = 1 (atendido)
idESTADO = 2 (cancelado)
*/

create proc SP_AltaTurno
(
	--Tabla Turno--
	@fechaTurno char(20),
	@observacion varchar(1000) = '',
	--Tabla TurnoPaciente--
	@idPaciente int,
	@idMedico int

)
as

if not exists (select * from Turno where fechaTurno=@fechaTurno) --Validar si el turno ya existe--
begin
	insert into Turno (fechaTurno, idEstado, observacion)
	values (@fechaTurno, 0, @observacion)

	--usamos el idTurno del insert anterior en el insert posterior
	declare @auxIdTurno int
	set @auxIdTurno = @@IDENTITY

	insert into TurnoPaciente (idTurno, idPaciente, idMedico)
	values (@auxIdTurno, @idPaciente, @idMedico)

	print 'El turno de agregó correctamente'
	return
end
else
begin
	print 'El turno ya existe'
	return
end

exec SP_AltaTurno '2021/10/11 18:30', 'El paciente tiene que estar en ayunas', 4, 2 --Ojo con el orden--

--INSERT EN TABLA MEDICO y MEDICOESPECIALIDAD-- 

alter proc SP_Medico -- me equivoque con el nombre, falta ALTA
(
	--Tabla Medico--
	@nombre varchar(50),
	@apellido varchar(50),
	--Tabla MedicoEspecialidad--
	@idEspecialidad int,
	@descripcion varchar(50)
)
as

if not exists (select * from Medico where nombre=@nombre and apellido=@apellido) --Validar si el médico ya existe--

begin
	insert into Medico(nombre, apellido)
	values (@nombre, @apellido)

	--usamos el idMedico del insert anterior en el insert posterior
	declare @auxIdMedico int
	set @auxIdMedico = @@IDENTITY

	insert into MedicoEspecialidad(idMedico, idEspecialidad, descripcion)
	values (@auxIdMedico, @idEspecialidad, @descripcion)

	print 'El Médico de agregó correctamente'
	return
end
else
begin
	print 'El Médico ya existe'
	return
end

exec SP_Medico 'Germán', 'Juárez', 2, 'Médico atiende en Carlos Paz' --Ojo con el orden--

--INSERT EN TABLA ESPECIALIDAD--

create proc SP_AltaEspecialidad
(
	@descripcion varchar(30)
)
as

if not exists (select * from Especialidad where descripcion=@descripcion) --Validar si el paciente ya existe--
begin
	insert into Especialidad(descripcion)
	values (@descripcion)
	print 'La especialidad de agregó correctamente'
	return
end
else
begin
	print 'La especialidad ya existe'
	return
end

exec SP_AltaEspecialidad 'Cardiología'
select * from Especialidad


