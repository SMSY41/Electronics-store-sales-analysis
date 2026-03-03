USE Final;
GO


-- F.1 Average Satisfaction Rating per Product Category

SELECT 
    Product_Category,
    ROUND(AVG(Satisfaction_Rating), 2) AS Avg_Satisfaction
FROM sales_data
GROUP BY Product_Category
ORDER BY Avg_Satisfaction DESC;



-- Correlation Between Spending and Satisfaction

-- Shows average satisfaction for different spending ranges
SELECT 
    CASE 
        WHEN Total_Amount < 500 THEN '<500'
        WHEN Total_Amount BETWEEN 500 AND 1000 THEN '500-1000'
        WHEN Total_Amount BETWEEN 1000 AND 3000 THEN '1000-3000'
        WHEN Total_Amount BETWEEN 3001 AND 5000 THEN '3001-5000'
        ELSE '>5000'
    END AS Spending_Range,
    ROUND(AVG(Satisfaction_Rating), 2) AS Avg_Satisfaction,
    COUNT(*) AS Transactions
FROM sales_data
GROUP BY 
    CASE 
        WHEN Total_Amount < 500 THEN '<500'
        WHEN Total_Amount BETWEEN 500 AND 1000 THEN '500-1000'
        WHEN Total_Amount BETWEEN 1000 AND 3000 THEN '1000-3000'
        WHEN Total_Amount BETWEEN 3001 AND 5000 THEN '3001-5000'
        ELSE '>5000'
    END
ORDER BY Spending_Range;



--  Branch with the Most Satisfied Customers

SELECT TOP 1
    Store_Branch,
    ROUND(AVG(Satisfaction_Rating), 2) AS Avg_Satisfaction
FROM sales_data
GROUP BY Store_Branch
ORDER BY Avg_Satisfaction DESC;
