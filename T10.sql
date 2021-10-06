USE pubs;
--1. Genere una lista de la tabla Empleado donde solo se genere una columna de salida y esta contenga los campos: EmployeeID, LastName y FirstName.
-- SELECT emp_id, lname, fname FROM EMPLOYEE;

--2. Despliegue aquellos productos (Tabla Products) cuyos valores se encuentran entre los 4 y 20.
USE Northwind;
-- SELECT * FROM PRODUCTS WHERE ProductID BETWEEN 4 AND 20;

--3. Liste los campos de la tabla productos que tengan exactamente un precio de 18,19 y 10.
-- SELECT * FROM PRODUCTS WHERE UnitPrice = 18.00 OR UnitPrice = 19.00 OR UnitPrice = 10.00;

--4. Encontrar todos los apellidos (LastName) en la tabla Employees que comiencen con la letra S.
-- SELECT * FROM Employees WHERE LastName LIKE 'S%';

--5. Despliegue los datos de los empleados cuya primera letra del apellido comienza entre A y M.
-- SELECT * FROM Employees WHERE LastName LIKE '[A-M]%';

--6. Despliega los datos de un autor cuyo ID comienza con el numero 724, sabiendo que cada ID tiene el formato de tres digitos seguidos por un guion, seguido por dos digitos, otro guion y finalmente cuatrodigitos.
USE pubs;
-- SELECT * FROM authors WHERE au_id LIKE '724-%';

--7. Liste todos los campos de la tabla Suppliers cuya columna Region sea NULL.
USE Northwind;
-- SELECT * FROM Suppliers WHERE Region IS NULL;
--8. Calcule la suma de las ventas del año hasta la fecha(ytd_sales) de todos los libros de la tabla titles.
USE pubs;
-- SELECT SUM(ytd_sales) AS 'SUM' FROM titles;
--9. Calcule el precio promedio de todos los libros (tabla titles).
-- SELECT AVG(price) AS 'Precio' FROM titles;

--10. Muestre el mayor valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
-- SELECT MAX(ytd_sales) AS 'MAX' FROM titles;

--11. Muestre el minimo valor de las ventas del año (ytd_sales) de todos los libros de la tabla titles.
-- SELECT MIN(ytd_sales) AS 'MIN' FROM titles;

--12. Cuente las filas de la tabla titles.
-- SELECT COUNT(*) AS 'COUNT' FROM titles;

--13. Cuente los datos de la tabla titles, cuyo tipo (TYPE) sea business.
-- SELECT COUNT(*) AS 'COUNT' FROM titles WHERE type = 'business';

--14. Liste la suma de las ventas por año (ytd_sales) de la tabla titles, clasificándolas por tipo (TYPE) de título.
-- SELECT type,SUM(ytd_sales) AS 'SUM' FROM titles GROUP BY type;

-- 15. Liste las sumas de las ventas por año (ytd_sales) hasta la fecha, clasificándolas por tipo (TYPE) y pub_id, liste solamente los grupos cuyo pub_id sea igual a 0877, utilizando having.
SELECT type,pub_id, SUM(ytd_sales) AS 'SUM' FROM titles GROUP BY type, pub_id HAVING pub_id = '0877';
--16. Combine las tablas stores y disconunts para mostrar que tienda (stor_id) ofrece un descuento y el tipo de descuento (discounttype). (Full Outer Join)
-- SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores FULL OUTER JOIN discounts ON stores.stor_id = discounts.stor_id;
--17. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion LEFT OUTER JOIN.
-- SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores LEFT OUTER JOIN discounts ON stores.stor_id = discounts.stor_id;

--18. Utilice el mismo ejemplo anterior solo utilice en el from la instruccion RIGHT.
-- SELECT stores.stor_id, stores.stor_name, discounts.discounttype FROM stores RIGHT OUTER JOIN discounts ON stores.stor_id = discounts.stor_id;

--19. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario igual al Maximo.
USE Northwind;
SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice = (SELECT MAX(UnitPrice)FROM Products);
--20. Muestre los Productos (ID del Producto, Nombre y Precio Unitario) que tengan un precio unitario igual al Minimo.
SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice = (SELECT MIN(UnitPrice)FROM Products);
