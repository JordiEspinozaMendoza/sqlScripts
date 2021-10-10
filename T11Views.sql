USE T11
GO 
-- 1. Lista las oficinas con sus objetivos y ventas reales
-- CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL AS
-- SELECT OBJETIVO, VENTAS FROM dbo.Oficinas
-- GO

-- SELECT * FROM dbo.OFICINA_OBJETIVO_VENTA_REAL;

-- 2. Lista las oficinas con sus objetivos y ventas reales de la region oeste

-- CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL_OESTE AS 
-- SELECT OBJETIVO, VENTAS FROM dbo.Oficinas
-- WHERE REGION = 'OESTE'
-- GO
-- SELECT * FROM dbo.OFICINA_OBJETIVO_VENTA_REAL_OESTE;

-- 3. Lista las oficinas con sus objetivos y ventas reales de la region oeste, de aquellas 
-- cuyas ventas exceden sus objetivo, ordenadas en orden alfabetico por ciudad
-- CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL_OESTE_VENTAS_EXCEDIDAS AS 
-- SELECT TOP 100 OBJETIVO, VENTAS, CIUDAD FROM dbo.Oficinas
-- WHERE REGION = 'OESTE'
-- AND VENTAS > OBJETIVO
-- ORDER BY CIUDAD
-- GO

-- SELECT * FROM dbo.OFICINA_OBJETIVO_VENTA_REAL_OESTE_VENTAS_EXCEDIDAS;

--4. Cuales son los objetivos y ventas promedio para las oficinas de la region este?
-- CREATE VIEW dbo.OBJETIVOS_VENTAS_PROMEDIO_ESTE AS
-- SELECT AVG(OBJETIVO) AS 'OBJETIVO_PROMEDIO', AVG(VENTAS) AS 'VENTAS_PROMEDIO' FROM dbo.Oficinas
-- WHERE REGION = 'ESTE'
-- GO

-- SELECT * FROM dbo.OBJETIVOS_VENTAS_PROMEDIO_ESTE;

-- 5. Lista los nombres, oficinas de todos los repventas
-- CREATE VIEW dbo.NOMBRE_OFICINA_REPVENTAS AS 
-- SELECT NOMBRE, OFICINA_REP FROM dbo.REPVENTAS
-- GO
-- SELECT * FROM dbo.NOMBRE_OFICINA_REPVENTAS;

--6. Cual es el nombre, cuota y ventas del empleado numero 107
-- CREATE VIEW DATOS_EMPLEADO_100 AS
-- SELECT NOMBRE, CUOTA, VENTAS FROM dbp.REPVENTAS
-- WHERE 

--7. Cuales son las ventas promedio de los vendedores?
-- CREATE VIEW dbo.VENTAS_PROMEDIO_VENDEDORES AS
-- SELECT AVG(VENTAS) AS 'VENTAS_PROMEDIO' FROM dbo.REPVENTAS
-- GO
-- SELECT * FROM dbo.VENTAS_PROMEDIO_VENDEDORES;

--8. List el nombre de cualquier repventas cuyas ventas sean superiores a 500000
-- CREATE VIEW dbo.VENTAS_500000 AS 
-- SELECT NOMBRE, VENTAS FROM dbo.REPVENTAS
-- WHERE VENTAS > 500000
-- GO

-- SELECT * FROM dbo.VENTAS_500000;

--9. Lista de los vendedores, sus cuotas y sus direcciones
-- CREATE VIEW dbo.CUOTAS_DIRECCIONES_VENDEDORES AS 
-- SELECT NOMBRE, CUOTA, OFICINA_REP FROM dbo.REPVENTAS
-- GO

-- SELECT * FROM dbo.CUOTAS_DIRECCIONES_VENDEDORES;

-- 10. Lista la poblacion, region y ventas de cada oficina de ventas
-- CREATE VIEW dbo.POBLACION_REGION_VENTAS AS
-- SELECT CIUDAD, REGION, VENTAS FROM dbo.Oficinas
-- GO
-- SELECT * FROM dbo.POBLACION_REGION_VENTAS;

--11. lista la ciudad, region y ventas de cada oficina de ventas 
-- CREATE VIEW dbo.CIUDAD_REGION_VENTAS AS
-- SELECT CIUDAD, REGION, VENTAS FROM dbo.Oficinas
-- GO
-- SELECT * FROM dbo.CIUDAD_REGION_VENTAS;

--12.dcc