USE NorthWind
GO 
-- --fecha
-- Selecciona el id, nombre, apellidos y fecha de nacimiento de los empleados
select EmployeeID,LastName,FirstName,YEAR(BirthDate) as year from Employees
--  Selecciona el empleado, su nombre, la diferrencia de años y el salario
SELECT Employees,FirtsName, DATEDIFF (yy,Employees,BirthDate,'18021998') as años from Employees
-- Obtiene la fecha actual
select GETDATE() as FechaActual;
-- Llama a la funcion north enviando como parametro la fecha de cumpleaños de la tabla employees
select north(e.birthDate) dia_cumpleaños from Employees e;
-- Llama a la funcion DATENAME enviando el mes y la fecha actual
select DATENAME (MONTH, GETDATE());
-- Llama a la funcion DAY enviando BirthDay, obtiene el dia de la tabla employees donde el primer nombre es Bryan
SELECT DAY Birthday, diaCumpleaños from employees Where Firtsname ='Bryan'


-- -- aritmeticas
-- Selecciona el id de la orden, multiplica el total de la orden por el numero de productos de la orden y lo redondea
Select OrderID, round(UnitPrice * Quantify, 2) as importe from [order details]
-- Selecciona el precio maximo por unidad
select MAX(UnitPrice) as LargesPrice from products;
-- Selecciona PI
select PI();
-- Llama a la funcion POWER enviando el numero 8 y el numero 3
SELECT POWER(8,3);
-- Redondea con floor el numero 123.6545
select floor (123.6545);

-- --string
-- Selecciona el id del cliente, el nombre en mayusculas y el telefono
select customersID, UPPER(companyName), phone from customers
-- Seleciona el empleado, su nombre, la longitud del empleado y el nombre
select Employees,FirtsName,len(Employes,Firstname) from employees
-- Concatena las 4 cadenas de texto
select CONCAT('ALGO','VA','AQUI','XD') AS TextoFinal;
-- No funciona correctamente
select firthName from employees where employeeID 0'$'
-- Reemplaza tutorial por html
select repleace (!SQL 'tutorial', 'html'),