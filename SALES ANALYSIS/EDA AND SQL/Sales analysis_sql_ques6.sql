SELECT 
    c.Country,
    COUNT(o.OrderID) AS TotalOrders,
    COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
    ROUND(COUNT(o.OrderID) / COUNT(DISTINCT c.CustomerID), 2) AS AvgOrdersPerCustomer
FROM 
    sales_analysis.customers c
JOIN 
    sales_analysis.orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.Country
ORDER BY 
    AvgOrdersPerCustomer DESC;
