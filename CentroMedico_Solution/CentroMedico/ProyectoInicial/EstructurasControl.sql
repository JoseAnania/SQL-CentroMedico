--Condicional IF e ELSE (con BEGIN y END)--

declare @idPaciente int
declare @idTurno int

set @idPaciente = 3

if @idPaciente = 3

begin
	set @idTurno = 2
	select * from Paciente where idPaciente=@idPaciente
	print @idTurno
end

else --Si la condición IF no se cumole (set @idPaciente != if @idPaciente)--

begin
	print 'no se cumplió la condición'
end

--EXISTS--

declare @idPaciente int
declare @idTurno int

set @idPaciente = 3

if @idPaciente = 3

begin
	set @idTurno = 2
	select * from Paciente where idPaciente=@idPaciente
	print @idTurno

	if exists (select * from Paciente where idPaciente=3) 
		print 'existe'
end

--WHILE--

declare @contador int=0 

while @contador <= 10
begin
	print @contador
	set @contador = @contador + 1
end

--CASE--

declare @valor int 
declare @resultado char(10)
set @valor=20
set @resultado=''

set @resultado = (case when @valor=10 then 'Rojo'
					   when @valor=20 then 'Verde'
					   when @valor=30 then 'Azul'
				  END)
print @resultado

--

select *,(case when idEstado=1 then 'Verde'
			   when idEstado=2 then 'Rojo'
			   when idEstado=3 then 'Azul' 
		  else 'Gris'	   
			   end) as ColorTurno from Turno

--RETURN y BREAK--

declare @contador int=0 

while @contador <= 10
begin
	print @contador
	set @contador = @contador + 1
	if @contador =3
		return
end
print 'sigue ejecutando' --NO

--

declare @contador int=0 

while @contador <= 10
begin
	print @contador
	set @contador = @contador + 1
	if @contador =3
		break
end
print 'sigue ejecutando' --SI

--TRY CATCH--

declare @contador int=0 

while @contador <= 10
begin
	print @contador
	set @contador = @contador + 1
	if @contador =3
		break
end
print 'sigue ejecutando' --SI

begin try
	set @contador='texto'
end try
begin catch
	print 'No es posible asignar un texto a la variable @contador que es int'
end catch


