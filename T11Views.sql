USE T11
GO 
-- 1. Lista las oficinas con sus objetivos y ventas reales
CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL AS
SELECT OBJETIVO, VENTAS FROM dbo.Oficinas
GO

-- 2. Lista las oficinas con sus objetivos y ventas reales de la region oeste

CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL_OESTE AS 
SELECT OBJETIVO, VENTAS FROM dbo.Oficinas
WHERE REGION = 'OESTE'
GO

-- 3. Lista las oficinas con sus objetivos y ventas reales de la region oeste, de aquellas 
-- cuyas ventas exceden sus objetivo, ordenadas en orden alfabetico por ciudad
CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL_OESTE_VENTAS_EXCEDIDAS AS 
SELECT TOP 100 OBJETIVO, VENTAS, CIUDAD FROM dbo.Oficinas
WHERE REGION = 'OESTE'
AND VENTAS > OBJETIVO
ORDER BY CIUDAD
GO


--4. Cuales son los objetivos y ventas promedio para las oficinas de la region este?
CREATE VIEW dbo.OBJETIVOS_VENTAS_PROMEDIO_ESTE AS
SELECT AVG(OBJETIVO) AS 'OBJETIVO_PROMEDIO', AVG(VENTAS) AS 'VENTAS_PROMEDIO' FROM dbo.Oficinas
WHERE REGION = 'ESTE'
GO


-- 5. Lista los nombres, oficinas de todos los repventas
CREATE VIEW dbo.NOMBRE_OFICINA_REPVENTAS AS 
SELECT NOMBRE, OFICINA_REP FROM dbo.REPVENTAS
GO

--7. Cuales son las ventas promedio de los vendedores?
CREATE VIEW dbo.VENTAS_PROMEDIO_VENDEDORES AS
SELECT AVG(VENTAS) AS 'VENTAS_PROMEDIO' FROM dbo.REPVENTAS
GO

--8. List el nombre de cualquier repventas cuyas ventas sean superiores a 500000
CREATE VIEW dbo.VENTAS_500000 AS 
SELECT NOMBRE, VENTAS FROM dbo.REPVENTAS
WHERE VENTAS > 500000
GO


--9. Lista de los vendedores, sus cuotas y sus direcciones
CREATE VIEW dbo.CUOTAS_DIRECCIONES_VENDEDORES AS 
SELECT NOMBRE, CUOTA, OFICINA_REP FROM dbo.REPVENTAS
GO


-- 10. Lista la poblacion, region y ventas de cada oficina de ventas
CREATE VIEW dbo.POBLACION_REGION_VENTAS AS
SELECT CIUDAD, REGION, VENTAS FROM dbo.Oficinas
GO

--11. lista la ciudad, region y ventas de cada oficina de ventas 
CREATE VIEW dbo.CIUDAD_REGION_VENTAS AS
SELECT CIUDAD, REGION, VENTAS FROM dbo.Oficinas
GO

-- 12 Despliega que sucedera si se eleva la cuota de cada vendedor un 3% de sus ventas anuales
CREATE VIEW dbo.CUOTAS_VENDEDORES_3_PORCENTAJE AS
SELECT NOMBRE, (CUOTA + (CUOTA * 0.03)) AS 'CUOTA_NUEVA' FROM dbo.REPVENTAS
GO
-- 13 Muestr todos los datos de la tabla oficinas
CREATE VIEW dbo.ALL_OFICINAS AS
SELECT * FROM dbo.Oficinas
GO

-- 15. List las oficinas cuyas ventas estan por debajo del 80% del objetivo
CREATE VIEW dbo.VENTAS_80_PORCENTAJE_OBJETIVO AS
SELECT * FROM dbo.Oficinas
WHERE VENTAS < (OBJETIVO * 0.8)
GO

-- 17. Encuentra los pedidos cuyo importe esta entre 30000.00 y 39999.99
CREATE VIEW dbo.PEDIDOS_IMPORTE_30000_39999 AS
SELECT * FROM dbo.PEDIDOS
WHERE Importe BETWEEN 30000.00 AND 39999.99
GO

-- 18. Lista los vendedores cuyas ventas no estan entre el 80 y el 120% de su cuota
CREATE VIEW dbo.VENTAS_80_120_PORCENTAJE_ AS
SELECT * FROM dbo.REPVENTAS 
WHERE VENTAS < (CUOTA*0.8) AND VENTAS > (CUOTA*1.2)
GO

-- 19. Lista los vendedores que trabajan en New York, Atlanta o Denver
CREATE VIEW dbo.VENDEDORES_NY_ATLANTIC_DENVER AS
SELECT * FROM dbo.REPVENTAS 
INNER JOIN dbo.Oficinas ON dbo.REPVENTAS.OFICINA_REP = dbo.Oficinas.Oficina
WHERE dbo.Oficinas.CIUDAD IN ('New York', 'Atlanta', 'Denver')
GO

-- 20 Encuentra los vendedores que están por debajo de la cuota a con ventas
-- inferioresw a 300000
CREATE VIEW dbo.VENDEDORES_CUOTA_300000 AS
SELECT * FROM dbo.REPVENTAS
WHERE VENTAS < CUOTA OR VENTAS < 300000
GO

-- 21. Muestra las ventas de cada oficina, ordenadas en orden alfabetico por región
-- y dentro de cada region por ciudad
CREATE VIEW dbo.VENTAS_OFICINAS_REGION_CIUDAD_ORDENADAS AS
SELECT TOP 100 FROM dbo.Oficinas 
ORDER BY REGION, CIUDAD
GO

-- 22. Lista las oficinas, clasificadas en orden descendente de ventas, de modo que las OFicinas
-- con mejor rendimiento aparezcan primero
CREATE VIEW dbo.VENTAS_OFICIAS_ORDER_DESC AS
SELECT TOP 100 FROM dbo.Oficinas
ORDER BY VENTAS DESC
GO 

-- 23. Cuales son las cuotas asignadas minima y maxima? 
CREATE VIEW dbo.CUOTAS_MIN_MAX AS
SELECT MIN(CUOTAS), MAX(CUOTAS) FROM dbo.REPVENTAS
GO

-- 24. Cual es el promedio de pedido ordenado por ACME Mfg?
CREATE VIEW dbo.PEDIDOS_PROMEDIO_ACME_MFG AS
SELECT AVG(Cant) AS 'PEDIDOS_PROMEDIO' FROM dbo.PEDIDOS 
WHERE CLIE = 2103
GO

-- 25. Cuantas vendedores superan su cuota
CREATE VIEW dbo.VENDEDORES_CUOTA_SUPERADA AS
SELECT COUNT(NOMBRE) FROM dbo.REPVENTAS 
WHERE VENTAS > CUOTA
GO

-- 26 Cuantos pedidos de mas de 25000 hay en los registros?
CREATE VIEW dbo.PEDIDOS_25000 AS
SELECT COUNT(PedidoID) FROM dbo.PEDIDOS 
WHERE Importe > 25000
GO

-- 27 Cual es el promedio de perdida para cada vendedor?
CREATE VIEW dbo.PERDIDA_PROMEDIO_VENDEDOR AS
SELECT NOMBRE, AVG(VENTAS - CUOTA) 
WHERE VENTAS < CUOTA
GROUP BY NOMBRE
GO

-- 29. Calcula los pedidos totales por cada cliente y cada vendedor
CREATE VIEW dbo.PEDIDOS_TOTALES AS 
SELECT COUNT(PEDIDOS.PedidoID) AS 'PEDIDOS_TOTALES', PEDIDOS.CLIE, CLIENTES.EMPRESA
FROM dbo.PEDIDOS
INNER JOIN dbo.CLIENTES ON dbo.PEDIDOS.CLIE = dbo.CLIENTES.Num_cliente
GROUP BY dbo.PEDIDOS.CLIE, dbo.CLIENTES.EMPRESA
GO 