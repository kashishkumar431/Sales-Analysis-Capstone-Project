SELECT 
    p.CategoryID,
    c.CategoryName,
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM 
    sales_analysis.order_details od
JOIN 
    sales_analysis.products p ON od.ProductID = p.ProductID
JOIN 
    sales_analysis.categories c ON p.CategoryID = c.CategoryID
GROUP BY 
    p.CategoryID, c.CategoryName, p.ProductID, p.ProductName
ORDER BY 
    TotalRevenue DESC;
