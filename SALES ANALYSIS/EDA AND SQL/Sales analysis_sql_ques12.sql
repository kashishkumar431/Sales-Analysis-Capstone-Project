SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalUnitsSold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue,
    AVG(od.UnitPrice) AS AvgSellingPrice
FROM 
    sales_analysis.products p
JOIN 
    sales_analysis.order_details od ON p.ProductID = od.ProductID
GROUP BY 
    p.ProductID, p.ProductName
ORDER BY 
    TotalRevenue DESC;
