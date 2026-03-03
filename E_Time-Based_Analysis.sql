USE Final;
GO


--Daily and Monthly Sales Trends

SELECT 
    'Daily' AS Period_Type,
    FORMAT(Purchase_Date, 'yyyy-MM-dd') AS Period,
    SUM(Total_Amount) AS Total_Revenue,
    COUNT(*) AS Total_Transactions
FROM sales_data
GROUP BY FORMAT(Purchase_Date, 'yyyy-MM-dd')

UNION ALL

SELECT 
    'Monthly' AS Period_Type,
    FORMAT(Purchase_Date, 'yyyy-MM') AS Period,
    SUM(Total_Amount) AS Total_Revenue,
    COUNT(*) AS Total_Transactions
FROM sales_data
GROUP BY FORMAT(Purchase_Date, 'yyyy-MM')

ORDER BY Period_Type, Period;


--Busiest Hour / Time of Day

-- Hourly transaction summary
SELECT 
    DATEPART(HOUR, Purchase_Date) AS Sale_Hour,
    COUNT(*) AS Total_Transactions,
    SUM(Total_Amount) AS Total_Revenue
FROM sales_data
GROUP BY DATEPART(HOUR, Purchase_Date)
ORDER BY Total_Transactions DESC;

-- Weekday vs Weekend Sales Performance


SELECT 
    CASE 
        WHEN DATENAME(WEEKDAY, Purchase_Date) IN ('Saturday', 'Sunday') 
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    COUNT(*) AS Total_Transactions,
    SUM(Total_Amount) AS Total_Revenue,
    ROUND(AVG(Total_Amount), 2) AS Avg_Transaction_Value
FROM sales_data
GROUP BY 
    CASE 
        WHEN DATENAME(WEEKDAY, Purchase_Date) IN ('Saturday', 'Sunday') 
        THEN 'Weekend'
        ELSE 'Weekday'
    END;

