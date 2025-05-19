SELECT 
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS Month,
    CASE 
        WHEN MONTH(o.OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(o.OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(o.OrderDate) IN (9, 10, 11) THEN 'Autumn'
        ELSE 'Winter'
    END AS Season,
    SUM(od.Quantity) AS TotalDemand
FROM 
    sales_analysis.orders o
JOIN 
    sales_analysis.order_details od ON o.OrderID = od.OrderID
GROUP BY 
    Month, Season
ORDER BY 
    Month;
