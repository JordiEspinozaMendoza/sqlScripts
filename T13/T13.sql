USE pubs
GO
--1. Genere una lista de la tabla Empleado donde solo se genere una columna de salida y esta contenga los campos: EmployeeID, LastName y FirstName.
-- SELECT CONCAT(emp_id, ' ', lname, ' ', fname) AS EmplAeado FROM Employee
-- GO
-- ? View
-- CREATE VIEW V_EMPLOYEES AS SELECT CONCAT(emp_id, ' ', lname, ' ', fname) AS Empleado FROM Employee
-- GO
-- SELECT * FROM V_EMPLOYEES
-- GO 

--2. Despliegue aquellos productos (Tabla Products) cuyos valores se encuentran entre los 4 y 20.
USE Northwind
GO
-- SELECT * FROM PRODUCTS WHERE ProductID BETWEEN 4 AND 20;
-- ? View
-- CREATE VIEW v_PRODUCTS_4_20 AS SELECT * FROM Products WHERE ProductID BETWEEN 4 AND 20
-- GO
-- SELECT * FROM v_PRODUCTS_4_20
-- GO 

--3. Liste los campos de la tabla productos que tengan exactamente un precio de 18,19 y 10.
-- SELECT * FROM PRODUCTS WHERE UnitPrice = 18.00 OR UnitPrice = 19.00 OR UnitPrice = 10.00;
-- ? View
-- CREATE VIEW V_PRODUCTS_18_19_20 AS 
-- SELECT * FROM Products WHERE UnitPrice = 18.00 OR UnitPrice = 19.00 OR UnitPrice = 10.00
-- GO
-- SELECT * FROM V_PRODUCTS_18_19_20
-- GO
--4. Encontrar todos los apellidos (LastName) en la tabla Employees que comiencen con la letra S.
-- SELECT * FROM Employees WHERE LastName LIKE 'S%';
-- ? View
-- CREATE VIEW V_EMPLOYEES_S AS SELECT * FROM Employees WHERE LastName LIKE 'S%'
-- GO
-- SELECT * FROM V_EMPLOYEES_S
-- GO
--5. Despliegue los datos de los empleados cuya primera letra del apellido comienza entre A y M.
-- SELECT * FROM Employees WHERE LastName LIKE '[A-M]%';
-- ? View
-- CREATE VIEW V_EMPLOYEES_A_M AS SELECT * FROM Employees WHERE LastName LIKE '[A-M]%'
-- GO
-- SELECT * FROM V_EMPLOYEES_A_M
-- GO

--6. Despliega los datos de un autor cuyo ID comienza con el numero 724, sabiendo que cada ID tiene el formato de tres digitos seguidos por un guion, seguido por dos digitos, otro guion y finalmente cuatrodigitos.
-- USE pubs
-- GO
-- SELECT * FROM authors WHERE au_id LIKE '724-%';
-- ? View
-- CREATE VIEW V_AUTHORS_724 AS SELECT * FROM authors WHERE au_id LIKE '724-%'
-- GO
-- SELECT * FROM V_AUTHORS_724
-- GO

--7. Liste todos los campos de la tabla Suppliers cuya columna Region sea NULL.
-- USE Northwind
-- GO
-- SELECT * FROM Suppliers WHERE Region IS NULL;
-- ? View
-- CREATE VIEW V_SUPPLIERS_NULL_REGION AS SELECT * FROM Suppliers WHERE Region IS NULL
-- GO
-- SELECT * FROM V_SUPPLIERS_NULL_REGION
-- GO

--8. Calcule la suma de las ventas del año hasta la fecha(ytd_sales) de todos los libros de la tabla titles.
USE pubs
GO
-- SELECT SUM(ytd_sales) AS 'SUM' FROM titles;
-- ? View
-- CREATE VIEW V_SUM_YTD_SALES AS SELECT SUM(ytd_sales) AS 'SUM' FROM titles
-- GO
-- SELECT * FROM V_SUM_YTD_SALES
-- GO

--9. Calcule el precio promedio de todos los libros (tabla titles).
-- SELECT AVG(price) AS 'Precio' FROM titles;
-- ? View
-- CREATE VIEW V_AVG_PRICE AS SELECT AVG(price) AS 'Precio' FROM titles
-- GO
-- SELECT * FROM V_AVG_PRICE
-- GO 

--10. Muestre el mayor valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
-- SELECT MAX(ytd_sales) AS 'MAX' FROM titles;
-- ? View
-- CREATE VIEW V_MAX_YTD_SALES AS SELECT MAX(ytd_sales) AS 'MAX' FROM titles
-- GO
-- SELECT * FROM V_MAX_YTD_SALES
-- GO 

--11. Muestre el minimo valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
-- SELECT MIN(ytd_sales) AS 'MIN' FROM titles;
-- ? View
-- CREATE VIEW V_MIN_YTD_SALES AS SELECT MIN(ytd_sales) AS 'MIN' FROM titles
-- GO
-- SELECT * FROM V_MIN_YTD_SALES

--12. Cuente las filas de la tabla titles.
-- SELECT COUNT(*) AS 'COUNT' FROM titles;
-- ? View
-- CREATE VIEW V_COUNT_TITLES AS SELECT COUNT(*) AS 'COUNT' FROM titles
-- GO
-- SELECT * FROM V_COUNT_TITLES
-- GO

--13. Cuente los datos de la tabla titles, cuyo tipo (TYPE) sea business.
-- SELECT COUNT(*) AS 'COUNT' FROM titles WHERE type = 'business';
-- ? View
-- CREATE VIEW V_COUNT_TYPE_BUSINESS AS SELECT COUNT(*) AS 'COUNT' FROM titles WHERE type = 'business'
-- GO
-- SELECT * FROM V_COUNT_TYPE_BUSINESS
-- GO

--14. Liste la suma de las ventas por año (ytd_sales) de la tabla titles, clasificándolas por tipo (TYPE) de título.
-- SELECT type,SUM(ytd_sales) AS 'SUM' FROM titles GROUP BY type;
-- ? View
-- CREATE VIEW V_SUM_YTD_SALES_GROUP_TYPE AS SELECT type,SUM(ytd_sales) AS 'SUM' FROM titles GROUP BY type
-- GO
-- SELECT * FROM V_SUM_YTD_SALES_GROUP_TYPE
-- GO

-- 15. Liste las sumas de las ventas por año (ytd_sales) hasta la fecha, clasificándolas por tipo (TYPE) y pub_id, liste solamente los grupos cuyo pub_id sea igual a 0877, utilizando having.
-- SELECT type,pub_id, SUM(ytd_sales) AS 'SUM' FROM titles GROUP BY type, pub_id HAVING pub_id = '0877';
-- ? View
-- CREATE VIEW V_SUM_YTD_SALES_GROUP_TYPE_HAVING_PUB_ID AS SELECT type, pub_id, SUM(ytd_sales) AS 'SUM' FROM titles GROUP BY type, pub_id HAVING pub_id = '0877'
-- GO
-- SELECT * FROM V_SUM_YTD_SALES_GROUP_TYPE_HAVING_PUB_ID
-- GO

--16. Combine las tablas stores y disconunts para mostrar que tienda (stor_id) ofrece un descuento y el tipo de descuento (discounttype). (Full Outer Join)
-- SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores FULL OUTER JOIN discounts ON stores.stor_id = discounts.stor_id;
-- ? View
-- CREATE VIEW V_STORES_DISCOUNTS AS SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores FULL OUTER JOIN discounts ON stores.stor_id = discounts.stor_id
-- GO
-- SELECT * FROM V_STORES_DISCOUNTS
-- GO

--17. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion LEFT OUTER JOIN.
-- SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores LEFT OUTER JOIN discounts ON stores.stor_id = discounts.stor_id;
-- ? View
-- CREATE VIEW V_STORES_DISCOUNTS_LEFT_JOIN AS SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores LEFT OUTER JOIN discounts ON stores.stor_id = discounts.stor_id
-- GO
-- SELECT * FROM V_STORES_DISCOUNTS_LEFT_JOIN
-- GO

--18. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion RIGHT.
-- SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores RIGHT OUTER JOIN discounts ON stores.stor_id = discounts.stor_id;
-- ? View
-- CREATE VIEW V_STORES_DISCOUNTS_RIGHT_JOIN AS SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores RIGHT OUTER JOIN discounts ON stores.stor_id = discounts.stor_id
-- GO
-- SELECT * FROM V_STORES_DISCOUNTS_RIGHT_JOIN
-- GO 

--19. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario igual al Maximo.
USE Northwind
GO 
-- SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice = (SELECT MAX(UnitPrice)FROM Products);
-- ? View
-- CREATE VIEW V_PRODUCTS_MAX_UNIT_PRICE AS SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice = (SELECT MAX(UnitPrice)FROM Products)
-- GO
-- SELECT * FROM V_PRODUCTS_MAX_UNIT_PRICE
-- GO 

--20. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario igual al Minimo.
-- SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice = (SELECT MIN(UnitPrice)FROM Products);
-- ? View
CREATE VIEW V_PRODUCTS_MIN_UNIT_PRICE AS SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice = (SELECT MIN(UnitPrice)FROM Products)
GO
SELECT * FROM V_PRODUCTS_MIN_UNIT_PRICE
