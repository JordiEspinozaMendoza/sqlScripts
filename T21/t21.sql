-- Escriba una función que devuelva los datos de un
-- estudiante incluidos su nombre matricula, carrera, créditos cursados y despliegue junto a los datos del estudiante la etapa que cursa actualmente:
-- si la cantidad de créditos cursados es menor a 90
-- se encuentra en etapa básica
-- Si es mayor a 90 y menor a 200 se encuentra en
-- etapa disciplinaria
-- si es mayor que 200 hasta 274 se encuentra en etapa
-- terminal.

-- CREATE DATABASE T21
-- GO



-- CREATE TABLE Estudiante(
--     Matricula INT,
--     Nombre VARCHAR(50),
--     Creditos INT,
--     CARRERA VARCHAR(50),
-- )
-- GO


-- INSERT 15 STUDENTS
-- INSERT INTO Estudiante VALUES(1, 'Juan', 90, 'Ingenieria en Sistemas'),
-- (2, 'Pedro', 100, 'Ingenieria en Sistemas'),
-- (3, 'Maria', 200, 'Ingenieria en Sistemas'),
-- (4, 'Jose', 200, 'Ingenieria en Sistemas'),
-- (5, 'Juan', 200, 'Ingenieria en Sistemas'),
-- (6, 'Pedro', 200, 'Ingenieria en Sistemas'),
-- (7, 'Maria', 200, 'Ingenieria en Sistemas'),
-- (8, 'Jose', 200, 'Ingenieria en Sistemas'),
-- (9, 'Juan', 200, 'Ingenieria en Sistemas'),
-- (10, 'Pedro', 200, 'Ingenieria en Sistemas'),
-- (11, 'Maria', 200, 'Ingenieria en Sistemas'),
-- (12, 'Jose', 200, 'Ingenieria en Sistemas'),
-- (13, 'Juan', 200, 'Ingenieria en Sistemas'),
-- (14, 'Pedro', 200, 'Ingenieria en Sistemas'),
-- (15, 'Maria', 200, 'Ingenieria en Sistemas')
-- GO
USE T21
GO
CREATE FUNCTION dbo.EstudianteInformacion(@Matricula int)
RETURNS varchar(255)
AS
    BEGIN
        DECLARE @Etapa VARCHAR(50);
        DECLARE @Creditos int;
        DECLARE @Nombre VARCHAR(50);
        DECLARE @Carrera VARCHAR(50);

        SET @Nombre = (SELECT Nombre FROM Estudiante WHERE Matricula= @Matricula);
        SET @Carrera = (SELECT Carrera FROM Estudiante WHERE Matricula= @Matricula);
        SET @Creditos = (SELECT Creditos FROM Estudiante WHERE Matricula= @Matricula);

        IF @Creditos < 90
            SET @Etapa = 'Basica';
        ELSE IF @Creditos > 90 AND @Creditos < 200
            SET @Etapa = 'Disciplinaria';
        ELSE IF @Creditos > 200 AND @Creditos < 274
            SET @Etapa = 'Terminal';
        ELSE
            SET @Etapa = 'No se encuentra en ninguna etapa';

        RETURN 'Nombre: ' + @Nombre + ' Matricula: ' + CONVERT(VARCHAR(50), @Matricula) + ' Carrera: ' + @Carrera + ' Creditos: ' + CONVERT(VARCHAR(50), @Creditos) + ' Etapa: ' + @Etapa;
    END
GO
--
USE T21
GO
SELECT dbo.EstudianteInformacion(1);