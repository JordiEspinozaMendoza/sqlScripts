CREATE DATABASE T11;

CREATE TABLE PEDIDOS
(
    PedidoID int NOT NULL,
    CLIE int,
    Producto varchar(10),
    Cant int,
    Importe decimal(10, 6)
);

CREATE TABLE PEDIDOS
(
    PedidoID int NOT NULL,
    CLIE int,
    Producto varchar(10),
    Cant int,
    Importe decimal(10, 6)
)
CREATE TABLE Oficinas
(
    OFICINA VARCHAR(3),
    CIUDAD VARCHAR(30),
    REGION VARCHAR(30),
    OBJETIVO DECIMAL(10, 2),
    VENTAS DECIMAL(10, 2),
);

INSERT INTO
    PEDIDOS
VALUES
    (112961, 2117, '2A44L', 7, 31.500),
    (113012, 2111, '41003', 35, 3.745),
    (112989, 2101, '114', 6, 1.458),
    (113051, 2118, 'XK47', 4, 1.420),
    (112968, 2102, '41004', 34, 3.978),
    (113036, 2107, '41002', 9, 22.500),
    (113045, 2112, '2A44R', 10, 45.000),
    (112963, 2103, '41004', 28, 3.276),
    (113013, 2118, '41003', 1, 652),
    (113058, 2108, '112', 10, 1.480),
    (112997, 2124, '41003', 1, 652),
    (112983, 2103, '41004', 6, 702),
    (113024, 2114, 'XK47', 20, 7.100),
    (113062, 2121, '114', 10, 2.430),
    (112979, 2114, '4100Z', 6, 15.000),
    (113027, 2103, '41002', 54, 4104),
    (113007, 2112, '773C', 3, 2925),
    (113069, 2109, '775C', 22, 31350),
    (113034, 2107, '2A45C', 8, 362),
    (112992, 2118, '41002', 10, 760),
    (112975, 2111, '2A440', 6, 2100),
    (113055, 2108, '4100X', 6, 150),
    (113048, 2120, '779C', 2, 3750),
    (112993, 2106, '2A45C', 24, 1896),
    (113065, 2106, 'XK47', 6, 2130),
    (113003, 2108, '779C', 3, 5625),
    (113049, 2118, 'XK47', 2, 776),
    (112987, 2103, '4100Y', 11, 27500),
    (113057, 2111, '4100X', 24, 600),
    (113042, 2113, '2A44R', 5, 22500);
CREATE TABLE CLIENTES
(
    Num_Clie int NOT NULL,
    EMPRESA VARCHAR(30),
    Rep_Clie int,
    Limite_Credito MONEY
);

INSERT INTO
    CLIENTES
VALUES
    (2111, 'JCP Inc.', 103, 50000),
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

CREATE TABLE REPVENTAS
(
    NOMBRE VARCHAR(30),
    OFICINA_REP VARCHAR(3),
    CUOTA DECIMAL(10, 2),
    VENTAS DECIMAL(10, 2),
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
    ('Nancy Angelli', 22, 300000.00, 186042.00)