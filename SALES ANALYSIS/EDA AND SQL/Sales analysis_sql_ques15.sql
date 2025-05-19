SELECT 
    s.CompanyName AS Supplier,
    c.CategoryName AS Category,
    ROUND(AVG(p.UnitPrice), 2) AS AvgUnitPrice,
    COUNT(p.ProductID) AS NumProducts
FROM 
    sales_analysis.products p
JOIN 
    sales_analysis.suppliers s ON p.SupplierID = s.SupplierID
JOIN 
    sales_analysis.categories c ON p.CategoryID = c.CategoryID
GROUP BY 
    s.CompanyName, c.CategoryName
ORDER BY 
    s.CompanyName, AvgUnitPrice DESC;
