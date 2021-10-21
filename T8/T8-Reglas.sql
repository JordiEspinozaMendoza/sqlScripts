-- CREATE DATABASE ORDERSDB;
USE ORDERSDB;
-- CREATE TABLE SUPPLIER(
--     supplerNo INTEGER NOT NULL,
--     supName VARCHAR(50) NOT NULL,
--     -- Phone details    
--     countryCode VARCHAR(3) NOT NULL,
--     areaCode VARCHAR(3) NOT NULL,
--     phone VARCHAR(9) NOT NULL,
--     -- Address details
--     street VARCHAR(50) NOT NULL,
--     city VARCHAR(50) NOT NULL,
--     stateName VARCHAR(50) NOT NULL,
--     zip VARCHAR(5) NOT NULL,
--     country VARCHAR(50) NOT NULL,
--     -- Contact details
--     contactName VARCHAR(50) NOT NULL,
-- );
-- CREATE TABLE CUSTOMER(
--     custId INTEGER NOT NULL,
--     firstName VARCHAR(50) NOT NULL,
--     lastName VARCHAR(50) NOT NULL,
--     -- Phone details
--     areaCode VARCHAR(3) NOT NULL,
--     phone VARCHAR(9) NOT NULL,
--     -- Address details
--     street VARCHAR(50) NOT NULL,
--     city VARCHAR(50) NOT NULL,
--     stateName VARCHAR(50) NOT NULL,
--     zip VARCHAR(5) NOT NULL,
--     -- Credit limit details
--     creditLimit DECIMAL(19, 4) NOT NULL
-- );
-- CREATE TABLE ORDERS(
--     orderNo INTEGER NOT NULL,
--     dateOrder DATE,
--     totalAmount DECIMAL(19, 4) NOT NULL,
--     tax DECIMAL(19, 4) NOT NULL,
--     -- Deliver to address
--     street VARCHAR(50) NOT NULL,
--     city VARCHAR(50) NOT NULL,
--     stateName VARCHAR(50) NOT NULL,
--     zip VARCHAR(5) NOT NULL,
--     -- Deliver to phone
--     areaCode VARCHAR(3) NOT NULL,
--     phone VARCHAR(9) NOT NULL
-- );

-- CREATE TABLE ITEM(
--     itemNo INTEGER NOT NULL,
--     itemName VARCHAR(50) NOT NULL,
--     unitPrice DECIMAL(19, 4) NOT NULL,
--     qtyOnHand INTEGER NOT NULL,
--     reorderPoint INTEGER NOT NULL,
-- );
CREATE TABLE ORDERCUSTOMER(
    custId INTEGER NOT NULL,
    orderNo INTEGER NOT NULL,

    FOREIGN KEY (custId) REFERENCES CUSTOMER(custId),
    FOREIGN KEY (orderNo) REFERENCES ORDERS(orderNo),
    PRIMARY KEY (custId, orderNo)
)

-- CREATE TABLE ORDERITEM(
--     orderNo INTEGER NOT NULL,
--     itemNo INTEGER NOT NULL,
-- );
-- CREATE TABLE SUPPLERITEM(
--     itemNo INTEGER NOT NULL,    
--     supplerNo INTEGER NOT NULL,
-- );
-- -- 2. Crea una restricción que garantice que los valores en límite de crédito estén entre el rango de 10,000 y 100,00.
-- ALTER TABLE CUSTOMER ADD CONSTRAINT CK_LIMIT CHECK  (creditLimit >=10000 AND creditLimit <= 10000);
-- -- 3. Crea una claúsula UNIQUE para el atributo ItemName, de la tabla ITEM.
-- ALTER TABLE ITEM ADD CONSTRAINT UK_ITEMNAME UNIQUE (itemName);
-- -- 4.Crea mediante una restricción la llave primaria de la tabla CUSTOMER.
-- ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (custId);
-- -- 5.Crea un valor DEFAULT denominado mínimo, con un valor de 10 y agrégalo al atributo
-- -- reorderPoint de la tabla Item.
-- ALTER TABLE ITEM ADD CONSTRAINT CK_REORDERPOINT CHECK (reorderPoint >= 10);
-- -- 6. Crea una restricción CHECK para asegurar que los valores insertados en country en la
-- -- tabla Supplier solo contengan los siguientes valores (México, USA, Japón, Francia,Italia)
-- ALTER TABLE SUPPLIER ADD CONSTRAINT CK_COUNTRY CHECK (country IN ('México', 'USA', 'Japón', 'Francia', 'Italia'));

-- -- Reglas.
-- -- 1. Crea una regla que garantice que los atributos Zip, tendrán exclusivamente 5 caracteres
-- -- numéricos, aplícalo en tantos atributos zip existan en la BD.

-- CREATE RULE ZIP_LENGTH AS @zip LIKE '%[^0-9]%' AND LEN(@zip) = 5;
-- EXEC sp_bindrule ZIP_LENGTH, 'SUPPLIER.zip';

-- -- 2. Crea una regla que garantice que los datos insertados en el atributo UnitPrice de la
-- -- tabla Item, el valor debe ser mayor que 1 y menor as 9999.

-- CREATE RULE UNITPRICE_RANGE AS @unitPrice >= 1 AND @unitPrice <= 9999;
-- EXEC sp_bindrule UNITPRICE_RANGE, 'ITEM.unitPrice';

-- -- 3. Crea una regla que garantice que los customer_Id deben tener un formato de 5 dígitos
-- -- numéricos.

-- CREATE RULE CUSTOMER_ID_FORMAT AS @custId LIKE '%[0-9]{5}%';

-- -- 4. Crea una regla que garantice que el areaCode solo contengan 3 dígitos numéricos.

-- CREATE RULE AREACODE_FORMAT AS @areaCode LIKE '%[0-9]{3}%';

-- -- 5. Crea una regla que asegure que en los atributos SupName, FirstName y LastName, solo
-- -- contengan caracteres alfabéticos, utiliza la misma regla y aplícala a los tres atributos.

-- CREATE RULE NAME_FORMAT AS @name LIKE '%[a-zA-Z]%';
