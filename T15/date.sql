USE pubs
go

---------------------------------- GETDATE() ----------------------------------------------------//
/*
Se aplica a: sí SQL Server (todas las versiones compatibles) síAzure SQL Database síAzure SQL Managed 
Instance síAzure Synapse Analytics síAnalytics Platform System (PDW).

Explicación
Devuelve la marca de tiempo del sistema de la base de datos actual como un valor de fecha y hora sin el desplazamiento de la zona 
horaria de la base de datos. Este valor se deriva del sistema operativo del equipo en el que se ejecuta la instancia de SQL Server.

Sintaxis

GETDATE()



*/

--EJEMPLO--
SELECT GETDATE() AS TODAY; --fecha y hora del sistema

---------------------------------- MONTH ----------------------------------------------------//
/*

Se aplica a: sí SQL Server (todas las versiones compatibles) síAzure SQL Database sí Azure SQL Managed Instance síAzure 
Synapse Analytics síAnalytics Platform System (PDW)

Explicación
Devuelve un número entero que representa el mes de la fecha especificada. 

Para obtener una descripción general de todas las funciones y tipos de datos de fecha y 
hora de Transact-SQL, consulte Funciones y tipos de datos de fecha y hora (Transact-SQL).

Argumentos

Fecha
Es una expresión que se pueden resolver en un tiempo , fecha , smalldatetime , fecha y hora , datetime2 o datetimeoffset valor. 
El argumento de fecha puede ser una expresión, expresión de columna, variable definida por el usuario o literal de cadena.

Sintaxsis 

MONTH(date)

*/

--  EJEMPLO  --
SELECT MONTH(GETDATE()) AS TODAY; --selección personalizada (day, moth, year)
GO
-------------------------------------------------------------------------------------------------//

---------------------------------- DATEPART ----------------------------------------------------//
/*

Explicación
El DATEPART() función se utiliza para devolver un solo parte de una fecha / hora, como año, mes, día, hora, minuto, etc.

Sintaxis
DATEPART(datepart,date)

Donde la fecha es una expresión de fecha válida y datepart puede ser uno de los siguientes:

datepart		Abreviatura
year			yy, yyyy
quarter			qq, q
month			mm, m
dayofyear		dy, y
day				dd, d
week			wk, ww
weekday			dw, w
hour			hh
minute			mi, n
second			ss, s
millisecond		ms
microsecond		mcs
nanosecond		ns

*/

--  EJEMPLOS  -- 
SELECT DATEPART(DAY,GETDATE()) AS OrderYear; --una parte de la fecha u hora
GO

SELECT pubdate, DATEPART(YEAR,GETDATE()) AS current_year, DATEDIFF(YY, pubdate, GETDATE()) AS difference 
FROM titles --diferencia
GO
-------------------------------------------------------------------------------------------------//

---------------------------------- DATENAME -----------------------------------------------------//
/*

Se aplica a: sí SQL Server (todas las versiones compatibles) síAzure SQL Database síAzure SQL Managed 
Instance sí Azure Synapse Analytics síAnalytics Platform System (PDW).

Explicación
Esta función devuelve una cadena de caracteres que representa la parte de 
fecha especificada de la fecha especificada.

Sintaxis 
DATENAME(datepart, date)

Argumentos

datepart

La parte específica del argumento de fecha que DATENAME se devolverá. 
Esta tabla enumera todos los argumentos válidos de la parte de fecha.

datepart			Abreviaturas
año					yy, yyyy
cuarto				qq, q
mi					mmm
día del año			dy, y
día					dd, d
semana				wk, ww
día laborable		dw, w
hora				SS
minuto				mi, n
segundo				ss, s
milisegundo			Sra
microsegundo		mcs
nanosegundo			ns
TZoffset			tz
ISO_WEEK			ISOWK, ISOWW

*/

--  EJEMPLOS  -- 
SELECT DATENAME(DAY,'2022-12-27') AS today; --obtiene el nombre de una parte de la fecha
GO
------------------------------------------------------------------------------------------------//

---------------------------------- DATEDIFF ----------------------------------------------------//
/*

Explicación
El DATEDIFF() función devuelve el tiempo transcurrido entre dos fechas.

Sintaxis
DATEDIFF(datepart,startdate,enddate)

Donde startdate y enddate son expresiones de fecha válidos y datepart puede ser uno de los siguientes:

datepart			Abreviatura
year				yy, yyyy
quarter				qq, q
month				mm, m
dayofyear			dy, y
day					dd, d
week				wk, ww
weekday				dw, w
hour				hh
minute				mi, n
second				ss, s
millisecond			ms
microsegundo		mcs
nanosecond			ns

*/

--  EJEMPLOS  -- 
SELECT DATEDIFF(DAY,'2021-10-23','2023-10-23'); --diferencia de fechas acorde a lo indicado (días, meses, años)
GO
SELECT DATEDIFF(MONTH,'2021-10-23','2023-10-23');
GO
SELECT DATEDIFF(YEAR,'2021-10-23','2023-10-23');
GO
------------------------------------------------------------------------------------------------//

---------------------------------- DATEADD -----------------------------------------------------//
/*

Explicación
El DATEADD() la función suma o resta un intervalo de tiempo especificado a partir de una fecha.

Sintaxis 
DATEADD(datepart,number,date)

Donde la fecha es una expresión de fecha válida y el número es el número de intervalo que desee agregar. 
El número puede ser positivo o bien, para las fechas en el futuro, o negativo, para las fechas en el pasado.

datepart puede ser uno de los siguientes:

datepart			Abreviatura
year				yy, yyyy
quarter				qq, q
month				mm, m
dayofyear			dy, y
day					dd, d
week				wk, ww
weekday				dw, w
hour				hh
minute				mi, n
second				ss, s
millisecond			ms
microsecond			mcs
nanosecond			ns

*/

--  EJEMPLOS  -- 
SELECT pubdate, DATEADD(YY, 3, pubdate) AS pubdateadd 
FROM titles --añade tiempo a la fecha (en este caso tres años)
GO
-------------------------------------------------------------------------------------------------//
