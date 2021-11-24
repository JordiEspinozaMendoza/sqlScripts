CREATE DATABASE ISR
GO

USE ISR
GO

CREATE TABLE Tabla(
    numero INTEGER,
    Limite_inferior DECIMAL(10,2),
    Limite_superior DECIMAL(10,2),
    Cuota_Fija DECIMAL(10,2),
    Porcentaje DECIMAL(10,2)
)
GO
INSERT INTO Tabla VALUES
    (1,0.01,578.52,0.00,1.92), 
    (2,578.53,4910.18,11.11,6.40),
    (3,4910.19, 8629.20,288.33,10.88),
    (4,8629.21,10031.07,692.96,16.00),
    (5,10031.08,12009.94,917.26,17.92),
    (6,12009.95,24222.31,1271.87, 21.36),
    (7, 24222.32, 38177.69,3880.44,23.52),
    (8,38177.70,72887.50,7162.74,30.00),
    (9,72887.51,97183.33,17575.69,32.00),
    (10,97183.34,291550.00,25350.35,34.00),
    (11,291550.01,1000000.00,91435.02,35)
GO

CREATE TABLE Empleado(
    id INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    salario DECIMAL(10,2)
)
GO

INSERT INTO Empleado VALUES
    (1,'Juan',25000.00),
    (2,'Pedro',15000.00),
    (3,'Maria',2000.00)
GO

USE ISR
GO
CREATE FUNCTION dbo.CalculaISR(@salario DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
    BEGIN 
        DECLARE @intFlag INT
        DECLARE @tableLimit INT

        SET @intFlag = 1
        SET @tableLimit =(SELECT COUNT(numero) FROM Tabla)

        DECLARE @limiteInferior DECIMAL(10,2)
        DECLARE @limiteSuperior DECIMAL(10,2)
        DECLARE @porcentaje DECIMAL(10,2)
        DECLARE @cuotaFija DECIMAL(10,2)

        DECLARE @limiteInferiorAux DECIMAL(10,2)
        DECLARE @limiteSuperiorAux DECIMAL(10,2)
        DECLARE @porcentajeAux DECIMAL(10,2)
        DECLARE @cuotaFijaAux DECIMAL(10,2)

        WHILE (@intFlag <= @tableLimit)
            BEGIN
                SET @limiteInferiorAux = (SELECT Limite_inferior FROM Tabla WHERE numero = @intFlag)
                SET @limiteSuperiorAux = (SELECT Limite_superior FROM Tabla WHERE numero = @intFlag)
                SET @porcentajeAux = (SELECT Porcentaje FROM Tabla WHERE numero = @intFlag)
                SET @cuotaFijaAux = (SELECT Cuota_Fija FROM Tabla WHERE numero = @intFlag)

                IF (@salario >= @limiteInferiorAux AND @salario <= @limiteSuperiorAux)
                    BEGIN 
                        SET @limiteInferior = @limiteInferiorAux
                        SET @limiteSuperior = @limiteSuperiorAux
                        SET @porcentaje = @porcentajeAux
                        SET @cuotaFija = @cuotaFijaAux
                        SET @intFlag = 12
                    END
                ELSE
                    BEGIN
                        SET @intFlag = @intFlag + 1
                    END
            END

        DECLARE @montoInferior DECIMAL(10,2)
        DECLARE @montoPorcentaje DECIMAL(10,2)
        DECLARE @ISR DECIMAL(10,2)

        SET @montoInferior = @salario - @limiteInferior
        SET @montoPorcentaje = ((@montoInferior * @porcentaje) / 100)
        SET @ISR = @cuotaFija + @montoPorcentaje

        RETURN @ISR
    END
GO

USE ISR
GO

SELECT *, dbo.CalculaISR(salario) AS 'ISR', (salario - dbo.CalculaISR(salario)) AS 'SALARIO NETO' FROM Empleado
GO
