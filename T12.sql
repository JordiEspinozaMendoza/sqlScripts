USE ORDERSDB
GO

-- 1.Despliegue los datos de los clientes, unido a la información de las órdenes que
-- haya adquirido cada cliente.

-- SELECT CUSTOMER.*, ORDERS.*  FROM ORDERCUSTOMER
-- INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
-- INNER JOIN ORDERS ON ORDERCUSTOMER.orderNo = ORDERS.orderNo
-- GO

-- 2.Despliega los datos de los artículos, junto con la información de las órdenes en la
-- que se haya efectuado

-- SELECT ITEM.*, ORDERS.* FROM ORDERITEM
-- INNER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
-- INNER JOIN ORDERS ON ORDERITEM.orderNo = ORDERS.orderNo
-- GO

-- 3.Despliega los datos de los proveedores y los datos de los artículos que
-- ellos surten, incluye el costo unitario

-- SELECT SUPPLIER.*, ITEM.* FROM SUPPLERITEM 
-- INNER JOIN SUPPLIER ON SUPPLIER.supplerNo = SUPPLERITEM.supplerNo
-- INNER JOIN ITEM ON ITEM.itemNo = SUPPLERITEM.itemNo
-- GO

-- 4. Realiza un full outer join con las item, contains y order

-- SELECT * FROM ORDERITEM 
-- FULL OUTER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
-- FULL OUTER JOIN ORDERS ON ORDERITEM.orderNo = ORDERS.orderNo
-- GO

-- 5. Efectúa una consulta left outer join con la tabla supplier, supplies
-- SELECT SUPPLIER.*, ITEM.* FROM SUPPLERITEM
-- LEFT OUTER JOIN SUPPLIER ON SUPPLIER.supplerNo = SUPPLERITEM.supplerNo
-- LEFT OUTER JOIN ITEM ON ITEM.itemNo = SUPPLERITEM.itemNo
-- GO

-- 6.Despliega los datos de las órdenes, el nombre, calle, ciudad,límite de crédito, de
-- los clientes que haya realizado órdenes

-- SELECT ORDERS.street, ORDERS.city, CUSTOMER.creditLimit, CUSTOMER.firstName FROM ORDERCUSTOMER
-- INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
-- INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
-- GO


-- 7.Despliega los datos de los clientes que haya realizado una orden con un monto
-- mayor a 10,000

-- SELECT CUSTOMER.*, ORDERS.* FROM ORDERCUSTOMER
-- INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
-- INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
-- WHERE ORDERS.totalAmount > 10000
-- GO

-- 8. Despliega la información de los artículos, de las órdenes realizadas por el cliente
-- jimenez hector
SELECT CUSTOMER.firstName, CUSTOMER.lastName, ITEM.itemName FROM ORDERCUSTOMER
INNER JOIN CUSTOMER ON CUSTOMER.custId = ORDERCUSTOMER.custId
INNER JOIN ORDERS ON ORDERS.orderNo = ORDERCUSTOMER.orderNo
INNER JOIN ORDERITEM ON ORDERITEM.orderNo = ORDERS.orderNo
INNER JOIN ITEM ON ITEM.itemNo = ORDERITEM.itemNo
WHERE CUSTOMER.firstName = 'jimenez' AND CUSTOMER.lastName = 'hector'
GO

-- 9. Despliega los datos de los productos cuyo precio sea menor que el promedio de
-- precio
-- SELECT * FROM ITEM WHERE unitPrice < (SELECT AVG(unitPrice) FROM ITEM)
-- GO
-- 10. Despliega los datos de los productos en cuyo nombre contenga la sílaba jet
-- SELECT * FROM ITEM WHERE itemName LIKE '%jet%'
-- GO