SELECT 
    c.CustomerID,
    c.Country,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(od.Quantity * od.UnitPrice) AS TotalSpent,
    AVG(od.Quantity * od.UnitPrice) AS AvgOrderValue
FROM 
    sales_analysis.customers c
JOIN 
    sales_analysis.orders o ON c.CustomerID = o.CustomerID
JOIN 
    sales_analysis.order_details od ON o.OrderID = od.OrderID
GROUP BY 
    c.CustomerID, c.Country
ORDER BY 
    TotalSpent DESC;
