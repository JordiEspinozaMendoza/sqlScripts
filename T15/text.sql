-- * SOUNDEX

-- ? SOUNDEX = Convierte un valor alphanumérico en un código de 4 caracteres
-- ? que representa como se escucha una palabra al ser pronunciada en inglés.

-- ? DIFFERENCE: Compara 2 valores SOUNDEX diferentes, regresa un valor entero
-- ? que indica la diferencia entre los dos valores SOUNDEX

-- ? 0 = No similares
-- ? 4 = Muy similares

-- ? Referencia: https://docs.microsoft.com/en-us/sql/t-sql/functions/difference-transact-sql?view=sql-server-ver15

SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene');  
GO  

-- * PANTIDEX
-- ? Regresa la posición inicial de la primera ocurrencia de un
-- ? patrón dentro de una expresión

-- ? 0 =  El patrón no se encuentra en la expresión

-- ? Referencia: https://docs.microsoft.com/en-us/sql/t-sql/functions/patindex-transact-sql?view=sql-server-ver15

SELECT position = PATINDEX('%ter%', 'interesting data');
GO

-- * REPLACE
-- ? Reemplaza todas las ocurrencias de una cadena específica
-- ? dentro de otra cadena

-- ? Referencia: https://docs.microsoft.com/en-us/sql/t-sql/functions/replace-transact-sql?view=sql-server-ver15

SELECT REPLACE('This is a Test'  COLLATE Latin1_General_BIN,  
'Test', 'desk' );  
GO

-- * SPACE
-- ? Regresa una cadena de espacios

-- ? Referencia: https://docs.microsoft.com/en-us/sql/t-sql/functions/space-transact-sql?view=sql-server-ver15

USE pubs
GO

SELECT RTRIM(lname) + SPACE(1)+LTRIM(fname) AS NOMBRE_COMPLETO FROM employee
ORDER BY lname, fname;
GO

-- * STUFF
-- ? Regresa una cadena de caracteres 
-- ? rellenada con una cadena específica

-- ? Refreencia: https://docs.microsoft.com/en-us/sql/t-sql/functions/stuff-transact-sql?view=sql-server-ver15

SELECT STUFF('Hola me llamo Juan', 15, 16, 'Jordi') AS STUFF
GO