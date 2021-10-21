-- CREATE DATABASE T9;
USE T9;
CREATE TABLE DEPTOS(
    noDept INTEGER PRIMARY KEY,
    nombre VARCHAR(20),
)
CREATE TABLE PRODUCTOS(
    idProd INTEGER PRIMARY KEY,
    descProducto VARCHAR(50),
)
CREATE TABLE TIPOS(
    tipo VARCHAR(50) PRIMARY KEY,
    descTipo VARCHAR(50),
)
CREATE TABLE EMPLEADOS(
    noEmp INTEGER PRIMARY KEY,
    nombre VARCHAR(20),
    rfc VARCHAR(13),
    tipo VARCHAR(50),
    correo VARCHAR(50),
    paisNac VARCHAR(20),
    sueldo DECIMAL(10,2),
    depto INTEGER,

    FOREIGN KEY(tipo) REFERENCES TIPOS(tipo),
    FOREIGN KEY(depto) REFERENCES DEPTOS(noDept),
);

-- 2. Cree una regla que garantice que el correo del empleado contiene la palabra tec intermedio
CREATE RULE EMPLEADOS_EMAIL_TEC AS @correo LIKE '%tec%';
EXEC sp_bindrule EMPLEADOS_EMAIL_TEC, 'EMPLEADOS.correo';

-- 3. Regla q garantice que la descPto sean (Plasma, Bocinas, Impresora)
CREATE RULE PRODUCTOS_DESC_DPTO AS @descPto IN ('Plasma', 'Bocinas', 'Impresora');
EXEC sp_bindrule PRODUCTOS_DESC_DPTO, 'PRODUCTOS.descPto';

-- 4. Regla que asegure que el valor de PaisNac sea México, Francia o España.
CREATE RULE EMPLEADOS_PAIS_NAC AS @paisNac IN ('México', 'Francia', 'España');
EXEC sp_bindrule EMPLEADOS_PAIS_NAC, 'EMPLEADOS.paisNac';

-- -- 5. Regla que asegure que los deptos. Sean (Sistemas, Finanzas, Producción) 
CREATE RULE DEPTOS_NAME AS @nombre IN ('Sistemas', 'Finanzas', 'Producción');
EXEC sp_bindrule DEPTOS_NAME, 'DEPTOS.nombre';

-- -- 6. Regla que garantice que el sueldo sea >=1000 y <=25000
CREATE RULE EMPLEADOS_SUELDO_RANGO AS @sueldo >=1000 AND @sueldo <=25000;
EXEC sp_bindrule EMPLEADOS_SUELDO_RANGO, 'EMPLEADOS.sueldo';

-- -- 7. Regla que asegure que el RFC Contenga 4 letras, 6 números,2 letras, 1 número
CREATE RULE EMPLEADOS_RFC_FORMAT AS @rfc LIKE '%[A-Z]{4}[0-9]{6}[A-Z]{2}[0-9]{1}';
EXEC sp_bindrule EMPLEADOS_RFC_FORMAT, 'EMPLEADOS.rfc';
-- -- 8.Regla que garantiza q el idPto sea valor numérico 
CREATE RULE PRODUCTOS_ID_PROD_NUMERICO AS @idProd LIKE '%[0-9]%';
EXEC sp_bindrule PRODUCTOS_ID_PROD_NUMERICO, 'PRODUCTOS.idProd';

-- 9. Verifica el funcionamiento de cada regla
INSERT INTO DEPTOS VALUES(1, 'Sistemas');
INSERT INTO DEPTOS VALUES(2, 'Finanzas');
INSERT INTO DEPTOS VALUES(3, 'Producción');

INSERT INTO PRODUCTOS VALUES(1, 'Plasma');
INSERT INTO PRODUCTOS VALUES(2, 'Bocinas');
INSERT INTO PRODUCTOS VALUES(3, 'Impresora');

INSERT INTO TIPOS VALUES('1', 'Empleado');
INSERT INTO TIPOS VALUES('2', 'Jefe');
INSERT INTO TIPOS VALUES('3', 'Gerente');

INSERT INTO EMPLEADOS VALUES 
INSERT INTO EMPLEADOS VALUES(
    -- noEmp
    1, 
    -- nombre
    'Juan',
    -- rfc
    'JUAN123456789',
    -- tipo
    '1',
    -- correo
    'juan@tec.com',
    -- paisNac
    'México',
    -- sueldo
    2000.50,
    -- depto
    1
);

INSERT INTO EMPLEADOS VALUES(2, 'Pedro', 'PEDRO12345678S9', '1', 'pedro@tec.com', 'Francia', 2000.50, 2);