--SUBCONSULTAS-- (consultas dentro de consultas)

select *,
(select pais from Pais ps where pac.idPais=ps.idPais) as Pais 
from paciente pac

