-- USE Northwind;
-- ALTER TABLE dbo.Customers ADD CONSTRAINT DF_

USE ENCUESTAS;
-- SELECT * FROM Customers;

-- INSERT INTO Customers VALUES(
--     -- CustomerID
--     'BLFKI',
--     -- CompanyName
--     'Blondesddsl père et fils',
--     -- ContactName
--     DEFAULT,
--     -- ContactTitle
--     'Sales Representative',
--     -- Address
--     'Rue Joseph-Bens 532',
--     -- City
--     'Bruxelles',
--     -- Region
--     NULL,
--     -- PostalCode
--     'B-1180',
--     -- Country
--     'Belgium',
--     -- Phone
--     '(02) 201 24 67',
--     -- Fax
--     '(02) 201 24 68'
-- );
-- SELECT * FROM Customers WHERE CustomerID = 'BLFKI';
-- CREATE TABLE EQUIPOS(
--     clave int IDENTITY,
--     descripcion VARCHAR(40) NOT NULL,
--     marca VARCHAR(40) NOT NULL DEFAULT 'Apple',
--     precio DECIMAL(6,2),
--     cantidad TINYINT DEFAULT 0,
-- )

-- ALTER TABLE EQUIPOS ADD tipo VARCHAR(40);
-- CREATE DEFAULT TipoEquipo AS 'Electronica';
-- EXEC sp_bindefault TipoEquipo, 'Equipos.tipo';
-- INSERT INTO EQUIPOS VALUES(
--     -- descripcion
--     'MacBook Pro 2',
--     -- marca
--     DEFAULT,
--     -- precio
--     4545.00,
--     -- cantidad
--     DEFAULT,
--     -- tipo
--     DEFAULT
-- );
SELECT * FROM EQUIPOS;