USE ORDERSDB
GO


-- 1.Despliegue los datos de los clientes, unido a la información de las órdenes que
-- haya adquirido cada cliente.

SELECT CUSTOMER.*, ORDERS.*  FROM ORDERCUSTOMER
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
INNER JOIN ORDERS ON ORDERCUSTOMER.orderNo = ORDERS.orderNo
GO

-- ? View
CREATE VIEW CUSTOMER_ORDERS AS
SELECT CUSTOMER.custId, CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.phone, 
ORDERS.orderNo, ORDERS.dateOrder, ORDERS.totalAmount
FROM ORDERCUSTOMER
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
INNER JOIN ORDERS ON ORDERCUSTOMER.orderNo = ORDERS.orderNo
GO

SELECT * FROM CUSTOMER_ORDERS GO

-- -- 2.Despliega los datos de los artículos, junto con la información de las órdenes en la
-- -- que se haya efectuado

SELECT ITEM.*, ORDERS.* FROM ORDERITEM
INNER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
INNER JOIN ORDERS ON ORDERITEM.orderNo = ORDERS.orderNo
GO
-- ? View
CREATE VIEW ITEM__ORDERS AS
SELECT ITEM.itemNo, ITEM.itemName, ITEM.unitPrice, ORDERS.orderNo, ORDERS.dateOrder, ORDERS.totalAmount
FROM ORDERITEM
INNER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
INNER JOIN ORDERS ON ORDERITEM.orderNo = ORDERS.orderNo
GO

SELECT * FROM ITEM__ORDERS
GO

-- -- 3.Despliega los datos de los proveedores y los datos de los artículos que
-- -- ellos surten, incluye el costo unitario

SELECT SUPPLIER.*, ITEM.* FROM SUPPLERITEM 
INNER JOIN SUPPLIER ON SUPPLIER.supplerNo = SUPPLERITEM.supplerNo
INNER JOIN ITEM ON ITEM.itemNo = SUPPLERITEM.itemNo
GO
-- ? View
CREATE VIEW SUPPLIER_ITEM AS
SELECT SUPPLIER.supplerNo, SUPPLIER.supName, SUPPLIER.street, SUPPLIER.phone, ITEM.itemNo, ITEM.itemName, ITEM.unitPrice
FROM SUPPLERITEM
INNER JOIN SUPPLIER ON SUPPLIER.supplerNo = SUPPLERITEM.supplerNo
INNER JOIN ITEM ON ITEM.itemNo = SUPPLERITEM.itemNo
GO
SELECT * FROM SUPPLIER_ITEM

-- 4. Realiza un full outer join con las item, contains y order

SELECT * FROM ORDERITEM 
FULL OUTER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
FULL OUTER JOIN ORDERS ON ORDERITEM.orderNo = ORDERS.orderNo
GO
-- ? View
CREATE VIEW ORDERITEM_ITEM_ORDERS AS
SELECT ORDERITEM.orderNo, ORDERITEM.itemNo, ITEM.itemName, ITEM.unitPrice, ORDERS.dateOrder, ORDERS.totalAmount
FROM ORDERITEM
FULL OUTER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
FULL OUTER JOIN ORDERS ON ORDERITEM.orderNo = ORDERS.orderNo
GO
SELECT * FROM ORDERITEM_ITEM_ORDERS


-- -- 5. Efectúa una consulta left outer join con la tabla supplier, supplies
SELECT SUPPLIER.*, ITEM.* FROM SUPPLERITEM
LEFT OUTER JOIN SUPPLIER ON SUPPLIER.supplerNo = SUPPLERITEM.supplerNo
LEFT OUTER JOIN ITEM ON ITEM.itemNo = SUPPLERITEM.itemNo
GO

-- ? View
CREATE VIEW SUPPLIER_ITEM_VIEW AS
SELECT SUPPLIER.supplerNo, SUPPLIER.supName, SUPPLIER.street, ITEM.itemNo, ITEM.itemName, ITEM.unitPrice
FROM SUPPLERITEM
LEFT OUTER JOIN SUPPLIER ON SUPPLIER.supplerNo = SUPPLERITEM.supplerNo
LEFT OUTER JOIN ITEM ON ITEM.itemNo = SUPPLERITEM.itemNo
GO

SELECT * FROM SUPPLIER_ITEM_VIEW

-- -- 6.Despliega los datos de las órdenes, el nombre, calle, ciudad,límite de crédito, de
-- -- los clientes que haya realizado órdenes

SELECT ORDERS.street, ORDERS.city, CUSTOMER.creditLimit, CUSTOMER.firstName FROM ORDERCUSTOMER
INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
GO
-- ? View
CREATE VIEW ORDERS_CUSTOMER_VIEW AS
SELECT ORDERS.street, ORDERS.city, CUSTOMER.creditLimit, CUSTOMER.firstName FROM ORDERCUSTOMER
INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
GO

SELECT * FROM ORDERS_CUSTOMER_VIEW
GO

-- -- 7.Despliega los datos de los clientes que haya realizado una orden con un monto
-- -- mayor a 10,000

SELECT CUSTOMER.*, ORDERS.* FROM ORDERCUSTOMER
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
WHERE ORDERS.totalAmount > 10000
GO
-- ? View
CREATE VIEW CUSTOMER_ORDERS_10000_VIEW AS
SELECT CUSTOMER.custId, CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.phone FROM ORDERCUSTOMER
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
WHERE ORDERS.totalAmount > 10000
GO

SELECT * FROM CUSTOMER_ORDERS_10000_VIEW
GO 

-- -- 8. Despliega la información de los artículos, de las órdenes realizadas por el cliente
-- -- jimenez hector
SELECT CUSTOMER.firstName, CUSTOMER.lastName, ITEM.itemName FROM ORDERCUSTOMER
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
INNER JOIN ORDERITEM ON ORDERITEM.orderNo = ORDERS.orderNo
INNER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
WHERE CUSTOMER.firstName = 'jimenez' AND CUSTOMER.lastName = 'hector'
GO
-- ? View
CREATE VIEW CUSTOMER_ORDERS_ITEM_VIEW_HECTOR AS
SELECT CUSTOMER.firstName, CUSTOMER.lastName, ITEM.itemName FROM ORDERCUSTOMER
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
INNER JOIN ORDERITEM ON ORDERITEM.orderNo = ORDERS.orderNo
INNER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
WHERE CUSTOMER.firstName = 'jimenez' AND CUSTOMER.lastName = 'hector'
GO

SELECT * FROM CUSTOMER_ORDERS_ITEM_VIEW_HECTOR

-- -- 9. Despliega los datos de los productos cuyo precio sea menor que el promedio de
-- -- precio
SELECT * FROM ITEM WHERE unitPrice < (SELECT AVG(unitPrice) FROM ITEM)
GO
-- 10. Despliega los datos de los productos en cuyo nombre contenga la sílaba jet
SELECT * FROM ITEM WHERE itemName LIKE '%jet%'
GO

-- ? View
CREATE VIEW ITEM_JET_VIEW AS
SELECT * FROM ITEM WHERE itemName LIKE '%jet%'
GO
SELECT * FROM ITEM_JET_VIEW
GO