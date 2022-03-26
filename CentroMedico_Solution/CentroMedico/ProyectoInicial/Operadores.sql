--OPERADORES ARITMETICOS--

--SUMA--

declare @num1 decimal(9,2)=20
declare @num2 decimal(9,2)=30
declare @result decimal(9,2)

set @result = @num1 + @num2 

print @result

--Resta--

declare @num1 decimal(9,2)=20
declare @num2 decimal(9,2)=30
declare @result decimal(9,2)

set @result = @num1 - @num2 

print @result

--DIVISION--

declare @num1 decimal(9,2)=20
declare @num2 decimal(9,2)=30
declare @result decimal(9,2)

set @result = @num1 / @num2 

print @result

--MULTIPLICACION--

declare @num1 decimal(9,2)=20
declare @num2 decimal(9,2)=30
declare @result decimal(9,2)

set @result = @num1 * @num2 

print @result

--MODULO-- (resto de la división)

declare @num1 decimal(9,2)=20
declare @num2 decimal(9,2)=30
declare @result decimal(9,2)

set @result = @num1 % @num2 

print @result

--CONCATENACION--

declare @num1 varchar(10)='Hola'
declare @num2 varchar(10)='Mundo!'
declare @result varchar(20)

set @result = @num1 + ' '+ @num2 

print @result

--OPERADORES LOGICOS-- (> < = <>)

declare @num1 decimal(9,2)=20
declare @num2 decimal(9,2)=30

if (@num2 > @num1)

print 'si'

--

declare @num1 decimal(9,2)=30
declare @num2 decimal(9,2)=30

if (@num2 <= @num1)

print 'si'

--

declare @num1 decimal(9,2)=20
declare @num2 decimal(9,2)=30

if (@num2 <> @num1)

print 'si'

--

declare @text1 varchar(10)='Hola'
declare @text2 varchar(10)='Mundo!'

if (@text2 > @text1) --toma la cantidad de caracteres--

print 'si es mayor'

