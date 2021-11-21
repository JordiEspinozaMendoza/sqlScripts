
-- INSERT 
CREATE TABLE PEDIDOS
(
    PedidoID VARCHAR(10),
    CLIE VARCHAR(10),
    Producto varchar(10),
    Cant int,
    Importe decimal(12, 2)
);
CREATE TABLE Oficinas
(
    OFICINA VARCHAR(3),
    CIUDAD VARCHAR(30),
    REGION VARCHAR(30),
    OBJETIVO DECIMAL(10, 2),
    VENTAS DECIMAL(10, 2),
);
CREATE TABLE CLIENTES
(
    Num_Clie int NOT NULL,
    EMPRESA VARCHAR(30),
    Rep_Clie int,
    Limite_Credito MONEY
);
CREATE TABLE REPVENTAS
(
    NOMBRE VARCHAR(30),
    OFICINA_REP VARCHAR(3),
    CUOTA DECIMAL(10, 2),
    VENTAS DECIMAL(10, 2),
);
DROP TABLE PEDIDOS;
USE T11
GO 
INSERT INTO PEDIDOS VALUES(112961, 2117, '2A44L', 7, 3150),
    (113012, 2111, '41003', 35, 3745.00),
    (112989, 2101, '114', 6, 1458.00),
    (113051, 2118, 'XK47', 4, 1420.00),
    (112968, 2102, '41004', 34, 3978.00),
    (113036, 2107, '41002', 9, 22500.00),
    (113045, 2112, '2A44R', 10, 45000.00),
    (112963, 2103, '41004', 28, 3276.00),
    (113013, 2118, '41003', 1, 652.00),
    (113058, 2108, '112', 10, 1480.00),
    (112997, 2124, '41003', 1, 652.00),
    (112983, 2103, '41004', 6, 702.00),
    (113024, 2114, 'XK47', 20, 7100.00),
    (113062, 2121, '114', 10, 2430.00),
    (112979, 2114, '4100Z', 6, 15000.00),
    (113027, 2103, '41002', 54, 4104.00),
    (113007, 2112, '773C', 3, 2925.00),
    (113069, 2109, '775C', 22, 31350.00),
    (113034, 2107, '2A45C', 8, 362.00),
    (112992, 2118, '41002', 10, 760.00),
    (112975, 2111, '2A440', 6, 2100.00),
    (113055, 2108, '4100X', 6, 150.00),
    (113048, 2120, '779C', 2, 3750.00),
    (112993, 2106, '2A45C', 24, 1896.00),
    (113065, 2106, 'XK47', 6, 2130.00),
    (113003, 2108, '779C', 3, 5625.00),
    (113049, 2118, 'XK47', 2, 776.00),
    (112987, 2103, '4100Y', 11, 27500.00),
    (113057, 2111, '4100X', 24, 600.00),
    (113042, 2113, '2A44R', 5, 22500.00);


INSERT INTO
    CLIENTES
VALUES
    (2111, 'JCP Inc.', 103, 50000.00),
    (2102, 'Fist Corp.', 101, 65000),
    (2103, 'Acme mig.', 105, 50000),
    (2123, 'Carter y Sons', 102, 40000),
    (2107, 'Ace International', 110, 35000),
    (2115, 'Saithson Corp', 101, 20000),
    (2101, 'Jones Mig.', 106, 65000),
    (2112, 'Letacorp', 103, 50000),
    (2121, 'QMA Assoc.', 103, 45000),
    (2114, 'Orion Corp.', 102, 20000),
    (2124, 'Peter Brothers', 107, 40000),
    (2108, 'Hols y Landis', 109, 55000),
    (2117, 'J.P. Sinclair', 106, 35000),
    (2122, 'Three-Way Lines', 105, 30000),
    (2120, 'Rico Enterprise.', 102, 50000),
    (2106, 'Ered Lewis Corp.', 102, 65000),
    (2119, 'Soloacn Inc.', 109, 25000),
    (2118, 'Midwest Systems', 108, 60000),
    (2113, 'Ian y Schaidt', 104, 20000),
    (2109, 'Chen Associates', 107, 25000),
    (2105, 'AAA Investments', 101, 45000);

INSERT INTO
    Oficinas
VALUES
    ('22', 'Denver', 'Oeste', 300000.00, 786042.00),
    ('11', 'New York', 'Este', 575000.00, 692637.00),
    ('12', 'Chicago', 'Este', 350000.00, 367911.00),
    ('13', 'Atlanta', 'Este', 350000.00, 367911.00),
    (
        '21',
        'Los Angeles',
        'Oeste',
        725000.00,
        335915.00
    );

INSERT INTO
    REPVENTAS
VALUES
    ('Bill Adams', '13', 350000.00, 367911.00),
    ('Mary Jones', '11', 300000.00, 392725.00),
    ('Sue Smith', '21', 350000.00, 474050.00),
    ('Sam Clark', '11', 275000.00, 299912.00),
    ('Bob Smith', '12', 200000.00, 142594.00);
insert into REPVENTAS
values
    ('Dan Roberts', 12, 300000.00, 305673.00)
insert into REPVENTAS
values
    ('Tom Snyder', null, null, 75985.00)
insert into REPVENTAS
values
    ('Larry Fitch', 21, 350000.00, 361865.00)
insert into REPVENTAS
values
    ('Paul Cruz', 12, 275000.00, 286775.00)
insert into REPVENTAS
values
    ('Nancy Angelli', 22, 300000.00, 186042.00);
GO
-- 1. Lista las oficinas con sus objetivos y ventas reales
CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL AS
SELECT OBJETIVO, VENTAS FROM dbo.Oficinas
GO

-- -- 2. Lista las oficinas con sus objetivos y ventas reales de la region oeste

CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL_OESTE AS 
SELECT OBJETIVO, VENTAS FROM dbo.Oficinas
WHERE REGION = 'OESTE'
GO

-- -- 3. Lista las oficinas con sus objetivos y ventas reales de la region oeste, de aquellas 
-- -- cuyas ventas exceden sus objetivo, ordenadas en orden alfabetico por ciudad
CREATE VIEW dbo.OFICINA_OBJETIVO_VENTA_REAL_OESTE_VENTAS_EXCEDIDAS AS 
SELECT TOP 100 OBJETIVO, VENTAS, CIUDAD FROM dbo.Oficinas
WHERE REGION = 'OESTE'
AND VENTAS > OBJETIVO
ORDER BY CIUDAD
GO


-- --4. Cuales son los objetivos y ventas promedio para las oficinas de la region este?
CREATE VIEW dbo.OBJETIVOS_VENTAS_PROMEDIO_ESTE AS
SELECT AVG(OBJETIVO) AS 'OBJETIVO_PROMEDIO', AVG(VENTAS) AS 'VENTAS_PROMEDIO' FROM dbo.Oficinas
WHERE REGION = 'ESTE'
GO


-- -- 5. Lista los nombres, oficinas de todos los repventas
CREATE VIEW dbo.NOMBRE_OFICINA_REPVENTAS AS 
SELECT NOMBRE, OFICINA_REP FROM dbo.REPVENTAS
GO

-- --7. Cuales son las ventas promedio de los vendedores?
CREATE VIEW dbo.VENTAS_PROMEDIO_VENDEDORES AS
SELECT AVG(VENTAS) AS 'VENTAS_PROMEDIO' FROM dbo.REPVENTAS
GO

-- --8. List el nombre de cualquier repventas cuyas ventas sean superiores a 500000
CREATE VIEW dbo.VENTAS_500000 AS 
SELECT NOMBRE, VENTAS FROM dbo.REPVENTAS
WHERE VENTAS > 500000
GO


-- --9. Lista de los vendedores, sus cuotas y sus direcciones
CREATE VIEW dbo.CUOTAS_DIRECCIONES_VENDEDORES AS 
SELECT NOMBRE, CUOTA, OFICINA_REP FROM dbo.REPVENTAS
GO


-- -- 10. Lista la poblacion, region y ventas de cada oficina de ventas
CREATE VIEW dbo.POBLACION_REGION_VENTAS AS
SELECT CIUDAD, REGION, VENTAS FROM dbo.Oficinas
GO

-- --11. lista la ciudad, region y ventas de cada oficina de ventas 
CREATE VIEW dbo.CIUDAD_REGION_VENTAS AS
SELECT CIUDAD, REGION, VENTAS FROM dbo.Oficinas
GO

-- -- 12 Despliega que sucedera si se eleva la cuota de cada vendedor un 3% de sus ventas anuales
CREATE VIEW dbo.CUOTAS_VENDEDORES_3_PORCENTAJE AS
SELECT NOMBRE, (CUOTA + (CUOTA * 0.03)) AS 'CUOTA_NUEVA' FROM dbo.REPVENTAS
GO
-- -- 13 Muestr todos los datos de la tabla oficinas
CREATE VIEW dbo.ALL_OFICINAS AS
SELECT * FROM dbo.Oficinas
GO
-- 14. No es posible realizar 

-- -- 15. List las oficinas cuyas ventas estan por debajo del 80% del objetivo
CREATE VIEW dbo.VENTAS_80_PORCENTAJE_OBJETIVO AS
SELECT * FROM dbo.Oficinas
WHERE VENTAS < (OBJETIVO * 0.8)
GO
-- 16. No es posible realizar 

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
SELECT TOP 100 VENTAS, REGION, CIUDAD FROM dbo.Oficinas 
ORDER BY REGION, CIUDAD
GO

-- 22. Lista las oficinas, clasificadas en orden descendente de ventas, de modo que las OFicinas
-- con mejor rendimiento aparezcan primero
CREATE VIEW dbo.VENTAS_OFICIAS_ORDER_DESC AS
SELECT TOP 100 OFICINA FROM dbo.Oficinas
ORDER BY VENTAS DESC
GO 

-- 23. Cuales son las cuotas asignadas minima y maxima? 
CREATE VIEW dbo.CUOTAS_MIN_MAX AS
SELECT MIN(CUOTA), MAX(CUOTA) FROM dbo.REPVENTAS
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
SELECT NOMBRE, AVG(VENTAS - CUOTA) *-1
FROM REPVENTAS
WHERE VENTAS < CUOTA
GROUP BY NOMBRE
GO
-- 28. No es posible realizar 

-- 29. Calcula los pedidos totales por cada cliente y cada vendedor
CREATE VIEW dbo.PEDIDOS_TOTALES AS 
SELECT COUNT(PEDIDOS.PedidoID) AS 'PEDIDOS_TOTALES', PEDIDOS.CLIE, CLIENTES.EMPRESA
FROM dbo.PEDIDOS
INNER JOIN dbo.CLIENTES ON dbo.PEDIDOS.CLIE = dbo.CLIENTES.Num_clie
GROUP BY dbo.PEDIDOS.CLIE, dbo.CLIENTES.EMPRESA
GO 
-- 30. No es posible realizar 
