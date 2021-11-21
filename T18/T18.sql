-- -- 1. Crea 3 usuarios en la base de datos PEDIDOS (Tarea 11).
-- USE T11
-- GO 
-- -- • Usuario 1: Nombre de usuario “Juan” contraseña ‘64HFP”
-- -- • Usuario 2: Nombre de usuario “Pedro” contraseña “LMPR08”
-- -- • Usuario3: Nombre usuario “Diana” contraseña “2fy753”
-- CREATE LOGIN Juan WITH PASSWORD = 'f5itILP!qW1g'
-- GO
-- CREATE LOGIN Pedro WITH PASSWORD = 'f5itILP!qW1g'
-- GO
-- CREATE LOGIN Diana WITH PASSWORD = 'f5itILP!qW1g'
-- GO
-- CREATE USER Juan FOR LOGIN Juan
-- GO
-- CREATE USER Pedro FOR LOGIN Pedro
-- GO
-- CREATE USER Diana FOR LOGIN Diana
-- GO
-- -- 2. Crea un rol definido por el usuario denominado “R_Ejercicios” y asígnalo a todos
-- -- los usuarios.
-- CREATE ROLE R_Ejercicios
-- GO
-- ALTER ROLE R_Ejercicios ADD MEMBER Juan
-- GO
-- ALTER ROLE R_Ejercicios ADD MEMBER Pedro
-- GO
-- ALTER ROLE R_Ejercicios ADD MEMBER Diana
-- GO
-- -- 3. Asigna los siguientes privilegios a cada usuario en la tabla Pedidos:
-- -- • Juan: Insert, Update, Delete
-- -- • Pedro: Select, Insert
-- -- • Diana: Delete, Select
-- GRANT INSERT, UPDATE, DELETE ON Pedidos TO Juan
-- GO
-- GRANT SELECT, INSERT ON Pedidos TO Pedro
-- GO
-- GRANT DELETE, SELECT ON Pedidos TO Diana
-- GO
-- -- 4. Elimina el privilegio Insert para “Pedro”
-- REVOKE INSERT ON Pedidos TO Pedro
-- GO
-- -- 5. Bloquea todos los Delete en la tabla Pedidos
-- DENY DELETE ON Pedidos TO PUBLIC
-- GO
-- -- 6. Elimina el privilegio Update para “Juan”
-- REVOKE UPDATE ON Pedidos TO Juan
-- GO
-- -- 7. Al usuario “Juan” asígnale un rol en el que pueda realizar todas las actividades
-- -- con la base de datos.
-- ALTER ROLE db_owner ADD MEMBER Juan
-- GO
-- -- 8. Al usuario “Pedro” asígnale un rol en el que pueda sólo pueda accesar a las tablas
-- -- por medio de Select.
-- ALTER ROLE db_datareader ADD MEMBER Pedro
-- GO  
-- -- 9. Al usuario “Diana” dale un rol ena hacer asignar permisos y roles. el que pued
-- ALTER ROLE db_securityadmin ADD MEMBER Diana
-- GO
CREATE FUNCTION dbo.FechaTexto(@Fecha DATE) RETURNS VARCHAR(50) AS BEGIN DECLARE @mes VARCHAR(50)
SET
    @mes = CASE
        MONTH(@Fecha)
        WHEN 1 THEN 'Enero'
        WHEN 2 THEN 'Febrero'
        WHEN 3 THEN 'Marzo'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Mayo'
        WHEN 6 THEN 'Junio'
        WHEN 7 THEN 'Julio'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Septiembre'
        WHEN 10 THEN 'Octubre'
        WHEN 11 THEN 'Noviembre'
        WHEN 12 THEN 'Diciembre'
    END RETURN CAST(DAY(@Fecha) AS VARCHAR(25)) + ' de ' + @mes + ' de ' + CAST(YEAR(@Fecha) AS VARCHAR(25));

END
GO
SELECT
    dbo.FechaTexto(GETDATE())
GO

CREATE FUNCTION dbo.SueldoBruto(@Sueldo FLOAT, @Horas INT) 
RETURNS FLOAT AS BEGIN RETURN @Sueldo * @Horas; END
GO

SELECT dbo.SueldoBruto(10000.500, 10)
GO    