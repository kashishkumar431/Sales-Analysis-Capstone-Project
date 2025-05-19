SELECT 
    p.CategoryID,
    SUM(od.Quantity * od.UnitPrice) AS Revenue,
    SUM(od.Quantity) AS TotalSold
FROM 
    sales_analysis.products p
JOIN 
    sales_analysis.order_details od ON p.ProductID = od.ProductID
GROUP BY 
    p.CategoryID;
