-- Crear una función que devuelva el salario de un empleado,  calculando (SueldoXHora  por Horas Trabajadas)
-- Despliegue los datos del empleado junto al sueldoBruto
CREATE FUNCTION dbo.CalcSueldo(@SueldoHora float, @Horas int)
RETURNS FLOAT
AS
BEGIN 
	RETURN @SueldoHora * @Horas;
END
GO

SELECT dbo.CalcSueldo(200, 20);