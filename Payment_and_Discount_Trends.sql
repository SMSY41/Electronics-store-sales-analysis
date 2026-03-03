USE Final;
GO

--Most Popular Payment Method
SELECT 
    Payment_Method,
    COUNT(*) AS Total_Transactions
FROM sales_data
GROUP BY Payment_Method
ORDER BY Total_Transactions DESC;

--Most Popular Payment Method Per Branch
WITH RankedPayments AS (
    SELECT 
        Store_Branch,
        Payment_Method,
        COUNT(*) AS Transaction_Count,
        ROW_NUMBER() OVER (
            PARTITION BY Store_Branch
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM sales_data
    GROUP BY Store_Branch, Payment_Method
)
SELECT 
    Store_Branch,
    Payment_Method,
    Transaction_Count
FROM RankedPayments
WHERE rn = 1
ORDER BY Store_Branch;

--Analyze Whether Higher Discounts Lead to Greater Quantities Sold
SELECT 
    Discount,
    AVG(Quantity) AS Avg_Quantity_Sold,
    COUNT(*) AS Transaction_Count
FROM sales_data
GROUP BY Discount
ORDER BY Discount;

--Find Which Payment Method Has the Highest Average Transaction Value
SELECT 
    Payment_Method,
    ROUND(AVG(Total_Amount), 2) AS Average_Transaction_Value
FROM sales_data
GROUP BY Payment_Method
ORDER BY Average_Transaction_Value DESC;

