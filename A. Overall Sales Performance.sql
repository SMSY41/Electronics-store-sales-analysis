USE Final;
GO
/*
SELECT 
    SUM(Total_Amount) AS Total_Revenue,
    COUNT(DISTINCT InvoiceID) AS Total_Transactions,
    AVG(Total_Amount) AS Average_Transaction_Value
FROM sales_data;


SELECT 
    Store_Branch,
    SUM(Total_Amount) AS Branch_Revenue,
    ROUND(
        (SUM(Total_Amount) * 100.0) / 
        (SELECT SUM(Total_Amount) FROM sales_data),
    2) AS Revenue_Percentage
FROM sales_data
GROUP BY Store_Branch
ORDER BY Branch_Revenue DESC;
*/