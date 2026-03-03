USE Final;
GO

--Identify the Top 5 Product Categories by Total Revenue
SELECT 
    Product_Category,
    SUM(Total_Amount) AS Total_Revenue
FROM sales_data
GROUP BY Product_Category
ORDER BY Total_Revenue DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;


--Find the Top-Selling Product (by Quantity) in Each Category and Branch
WITH RankedProducts AS (
    SELECT
        Store_Branch,
        Product_Category,
        Product_Name,
        SUM(Quantity) AS Total_Quantity,
        ROW_NUMBER() OVER (PARTITION BY Store_Branch, Product_Category 
                           ORDER BY SUM(Quantity) DESC) AS rn
    FROM sales_data
    GROUP BY Store_Branch, Product_Category, Product_Name
)
SELECT 
    Store_Branch,
    Product_Category,
    Product_Name,
    Total_Quantity
FROM RankedProducts
WHERE rn = 1
ORDER BY Store_Branch, Product_Category;

--Calculate Average Discount and Profit Margin per Category
SELECT 
    Product_Category,
    ROUND(AVG(Discount), 2) AS Average_Discount_Percentage,
    ROUND(AVG(
        (Total_Amount - (Unit_Price * 0.8 * Quantity)) / Total_Amount * 100
    ), 2) AS Average_Profit_Margin_Percentage
FROM sales_data
GROUP BY Product_Category
ORDER BY Average_Profit_Margin_Percentage DESC;
