-- Escribe una función que permita desplegar el promedio general de calificaciones de 
-- un alumno de quien se tiene registro de exámenes, trabajos y participaciones. 
-- El promedio de exámenes corresponde al 60% de la calificación final, el promedio de trabajos 
-- al 30% y el promedio de participaciones al 10%. Una vez capturado los datos del 
-- estudiante(número de control, nombre, carrera, promedio exámenes,  promedio trabajos, promedio participaciones).


-- Se debe calcular el promedio general y desplegar un
-- mensaje de acuerdo al promedio obtenido
-- si el
-- promedio es de 90 a 100 Excelente
--  si el
-- promedio es  mayor a 80 y menor a 90 Muy
-- bueno
--  si promedio
-- es mayor 70 y menor a 80 Bueno
--  si el
-- promedio es mayor a 60 y menor a 70 Malo
--  si el
-- promedio es menor a 60 mensaje ¨Debe  estudiar más¨.
CREATE DATABASE T22
GO
USE T22
GO
CREATE TABLE Estudiante(
    Matricula INT,
    Nombre VARCHAR(50),
    Carrera VARCHAR(50),
    PromedioExamen FLOAT,
    PromedioTrabajo FLOAT,
    PromedioParticipacion FLOAT
)
GO

INSERT INTO Estudiante VALUES(1, 'Juan', 'Ingenieria', 90, 90, 90),
    (2, 'Pedro', 'Ingenieria', 80, 80, 80),
    (3, 'Maria', 'Ingenieria', 70, 70, 70),
    (4, 'Jose', 'Ingenieria', 60, 60, 60)
    GO
USE T22
GO
CREATE FUNCTION dbo.CalcPromedioEstudiante(@Matricula INT)
RETURNS VARCHAR(255) AS
    BEGIN
        DECLARE @PromedioExamen FLOAT;
        DECLARE @PromedioTrabajo FLOAT;
        DECLARE @PromedioParticipacion FLOAT;

        DECLARE @PromedioGeneral FLOAT;
        DECLARE @Response VARCHAR(255);

        SET @PromedioExamen = (SELECT PromedioExamen FROM Estudiante WHERE Matricula = @Matricula);
        SET @PromedioTrabajo = (SELECT PromedioTrabajo FROM Estudiante WHERE Matricula = @Matricula);
        SET @PromedioParticipacion = (SELECT PromedioParticipacion FROM Estudiante WHERE Matricula = @Matricula);

        SET @PromedioGeneral = ((@PromedioExamen * 0.6) + (@PromedioTrabajo * 0.3) + (@PromedioParticipacion * 0.1))
        IF @PromedioGeneral >= 90
            SET @Response = 'Excelente'
        ELSE IF @PromedioGeneral >= 80 AND @PromedioGeneral < 90
            SET @Response = 'Muy bueno'
        ELSE IF @PromedioGeneral >= 70 AND @PromedioGeneral < 80
            SET @Response = 'Bueno'
        ELSE IF @PromedioGeneral >= 60 AND @PromedioGeneral < 70
            SET @Response = 'Malo'
        ELSE IF @PromedioGeneral > 100
            SET @Response = 'No se puede calcular'
        ELSE
            SET @Response = 'Debe estudiar más'
        RETURN @Response + '-' + CONVERT(VARCHAR(20), @PromedioGeneral)
END
GO

USE T22
GO
SELECT *, dbo.CalcPromedioEstudiante(1) AS "Promedio" FROM Estudiante WHERE Matricula = 1
GO 
