USE ORDERSDB
GO
-- 1.Mediante restricción crea las llaves primarias compuestas y llaves foráneas de las tablas Supplies y la tabla Contains.
ALTER TABLE SUPPLIER ADD CONSTRAINT PK_SUPPLIER PRIMARY KEY(supplerNo);
ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY(custId);
ALTER TABLE ORDERS ADD CONSTRAINT PK_ORDERS PRIMARY KEY(orderNo);
ALTER TABLE ITEM ADD CONSTRAINT PK_ITEM PRIMARY KEY(itemNo);

ALTER TABLE ORDERITEM ADD CONSTRAINT PK_ORDERITEM PRIMARY KEY(orderNo, itemNo);
ALTER TABLE SUPPLERITEM ADD CONSTRAINT PK_SUPPLIERITEM PRIMARY KEY(itemNo, supplerNo);


ALTER TABLE ORDERITEM ADD CONSTRAINT FK_ORDERITEM_ORDER FOREIGN KEY(orderNo) REFERENCES ORDERS(orderNo);
ALTER TABLE ORDERITEM ADD CONSTRAINT FK_ORDERITEM_ITEM FOREIGN KEY(itemNo) REFERENCES ITEM(itemNo);

ALTER TABLE SUPPLERITEM ADD CONSTRAINT FK_SUPPLIERITEM_ITEM FOREIGN KEY(itemNo) REFERENCES ITEM(itemNo);
ALTER TABLE SUPPLERITEM ADD CONSTRAINT FK_SUPPLIERITEM_SUPPLIER FOREIGN KEY(supplerNo) REFERENCES SUPPLIER(supplerNo);

INSERT INTO CUSTOMER VALUES
(1, 'Luis', 'Antonio', 123,123456789, 'street 1','city 1', 'state 1', '12345', 1500.0000),
(2, 'Juan', 'Antonio', 123,123456789, 'street 2','city 2', 'state 2', '12345', 1500.0000),
(3, 'Pedro', 'Antonio', 123,123456789, 'street 3','city 3', 'state 3', '12345', 1500.0000),
(4, 'Maria', 'Antonio', 123,123456789, 'street 4','city 4', 'state 4', '12345', 1500.0000),
(5, 'Luis', 'Antonio', 123,123456789, 'street 5','city 5', 'state 5', '12345', 1500.0000),
(6, 'Juan', 'Antonio', 123,123456789, 'street 6','city 6', 'state 6', '12345', 1500.0000),
(7, 'Pedro', 'Antonio', 123,123456789, 'street 7','city 7', 'state 7', '12345', 1500.0000),
(8, 'Maria', 'Antonio', 123,123456789, 'street 8','city 8', 'state 8', '12345', 1500.0000),
(9, 'Luis', 'Antonio', 123,123456789, 'street 9','city 9', 'state 9', '12345', 1500.0000),
(10, 'Juan', 'Antonio', 123,123456789, 'street 10','city 10', 'state 10', '12345', 1500.0000),
(11, 'Pedro', 'Antonio', 123,123456789, 'street 11','city 11', 'state 11', '12345', 1500.0000),
(12, 'Maria', 'Antonio', 123,123456789, 'street 12','city 12', 'state 12', '12345', 1500.0000),
(13, 'Luis', 'Antonio', 123,123456789, 'street 13','city 13', 'state 13', '12345', 1500.0000),
(14, 'Juan', 'Antonio', 123,123456789, 'street 14','city 14', 'state 14', '12345', 1500.0000);
