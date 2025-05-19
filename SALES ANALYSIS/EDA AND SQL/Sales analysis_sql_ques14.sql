SELECT 
    s.CompanyName AS Supplier,
    c.CategoryName AS Category,
    SUM(od.Quantity * od.UnitPrice) AS Revenue,
    SUM(od.Quantity) AS TotalQuantity
FROM 
    sales_analysis.suppliers s
JOIN 
    sales_analysis.products p ON s.SupplierID = p.SupplierID
JOIN 
    sales_analysis.categories c ON p.CategoryID = c.CategoryID
JOIN 
    sales_analysis.order_details od ON p.ProductID = od.ProductID
GROUP BY 
    s.CompanyName, c.CategoryName
ORDER BY 
    s.CompanyName, Revenue DESC;
