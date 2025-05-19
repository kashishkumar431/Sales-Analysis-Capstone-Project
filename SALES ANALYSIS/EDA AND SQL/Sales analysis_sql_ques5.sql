SELECT 
    c.CustomerID,
    c.Country,
    c.City,
    p.CategoryID,
    cat.CategoryName,
    o.OrderID,
    SUM(od.Quantity) AS TotalQuantity,
    SUM(od.Quantity * od.UnitPrice) AS OrderValue
FROM 
    customers c
JOIN 
    orders o ON c.CustomerID = o.CustomerID
JOIN 
    order_details od ON o.OrderID = od.OrderID
JOIN 
    products p ON od.ProductID = p.ProductID
JOIN 
    categories cat ON p.CategoryID = cat.CategoryID
GROUP BY 
    c.CustomerID, c.Country, c.City, p.CategoryID, cat.CategoryName, o.OrderID
ORDER BY 
    OrderValue DESC;
