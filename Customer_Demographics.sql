USE Final;
GO
--Compare Average Spending by Gender
SELECT 
    Gender,
    ROUND(AVG(Total_Amount), 2) AS Average_Spending
FROM sales_data
GROUP BY Gender;

-- Compare Total Spending Between Members and Non-Members
SELECT 
    Customer_Type,
    SUM(Total_Amount) AS Total_Spending
FROM sales_data
GROUP BY Customer_Type;

--Find Average Satisfaction Rating for Each Customer Type
SELECT 
    Customer_Type,
    ROUND(AVG(Satisfaction_Rating), 2) AS Average_Satisfaction
FROM sales_data
GROUP BY Customer_Type;
