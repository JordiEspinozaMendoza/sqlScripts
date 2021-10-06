USE Northwind
GO 
-- CREATE VIEW dbo.OrderSubtotalsView (OrderID, Subtotal) 
-- AS SELECT OD.OrderID, SUM(CONVERT(money, (OD.UnitPrice * Quantity*(1-Discount)/100))*100)
--     FROM [Order Details] OD
--     GROUP BY OD.OrderID
-- GO

-- SELECT * FROM dbo.OrderSubtotalsView
-- CREATE VIEW dbo.ShipStatusView
-- AS 
-- SELECT OrderID, ShippedDate, ContactName
-- FROM Customers c INNER JOIN Orders o ON C.CustomerID = O.CustomerID
-- WHERE RequiredDate < ShippedDate
-- GO

-- SELECT * FROM dbo.ShipStatusView
-- GO
CREATE VIEW dbo.TotalPurchaseView
AS SELECT 
-- CREATE VIEW dbo.TopSalesView
-- AS SELECT * FROM dbo.TotalPurchaseView 
--     WHERE Subtotal > 50000
-- GO  