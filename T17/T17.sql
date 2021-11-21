	USE NorthWind
	GO

-- Creación de usuarios
CREATE LOGIN Ismael WITH PASSWORD = '123456'
GO
CREATE USER Ismael FOR LOGIN Ismael
GO
CREATE LOGIN Jose WITH PASSWORD = '123456'
GO
CREATE USER Jose FOR LOGIN Jose;
GO
CREATE LOGIN Emiliano WITH PASSWORD = '123456'
GO
CREATE USER Emiliano FOR LOGIN Emiliano;
GO


-- Privilegios 
ALTER ROLE db_securityadmin ADD MEMBER Ismael
GO

GRANT SELECT, INSERT ON DatosGenerales TO Ismael;
GO
CREATE ROLE observa_e_inserta AUTHORIZATION Ismael; 
GO
GRANT SELECT ON DatosGenerales TO Jose;
GO
CREATE ROLE observa AUTHORIZATION Jose; 
GO	
GRANT INSERT ON DatosGenerales TO Emiliano;
GO
CREATE ROLE inserta AUTHORIZATION Emiliano; 
GO

-- Test de privilegios
SELECT * FROM DatosGenerales
EXECUTE AS USER = 'Ismael';
SELECT * FROM Estregia
EXECUTE AS USER = 'Jose';
SELECT * FROM DatosGenerales
EXECUTE AS USER = 'Emiliano';

-- Remover privilegios
REVOKE SELECT ON DatosGenerales To Ismael;
REVOKE SELECT ON DatosGenerales To Jose;
REVOKE INSERT ON DatosGenerales To Emiliano;