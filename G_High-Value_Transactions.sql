USE Final;
GO

-- op 10 Invoices by Total Amount
SELECT TOP 10
    InvoiceID,
    Customer_Name,
    Product_Category,
    Store_Branch,
    Payment_Method,
    Total_Amount
FROM sales_data
ORDER BY Total_Amount DESC;
