USE ORDERSDB;
-- EXEC sp_bindrule ZIP_LENGTH, 'CUSTOMER.zip';
-- EXEC sp_bindrule ZIP_LENGTH, 'ORDERS.zip';

-- EXEC sp_bindrule CUSTOMER_ID_FORMAT, 'CUSTOMER.zip';
-- EXEC sp_bindrule AREACODE_FORMAT, 'SUPPLIER.zip';
-- EXEC sp_bindrule AREACODE_FORMAT, 'CUSTOMER.zip';
-- EXEC sp_bindrule AREACODE_FORMAT, 'ORDERS.zip';

EXEC sp_bindrule NAME_FORMAT, 'SUPPLIER.supName';
EXEC sp_bindrule NAME_FORMAT, 'CUSTOMER.firstName';
EXEC sp_bindrule NAME_FORMAT, 'CUSTOMER.lastName';

