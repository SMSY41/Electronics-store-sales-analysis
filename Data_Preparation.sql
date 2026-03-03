-- CREATE DATABASE Final;
USE Final;
GO
--SELECT DB_NAME() AS CurrentDatabase;
--SELECT name 
--FROM sys.tables;
--EXEC sp_rename 'electronics_store_sales_dataset_Sheet1', 'sales_data';
--EXEC sp_help 'sales_data';

--To fix num type
/*
ALTER TABLE sales_data
ALTER COLUMN Unit_Price DECIMAL(10,2);

ALTER TABLE sales_data
ALTER COLUMN Tax DECIMAL(5,2);

ALTER TABLE sales_data
ALTER COLUMN Gross_Amount DECIMAL(10,2);

ALTER TABLE sales_data
ALTER COLUMN Discount_Amount DECIMAL(10,2);

ALTER TABLE sales_data
ALTER COLUMN Tax_Amount DECIMAL(10,2);

ALTER TABLE sales_data
ALTER COLUMN Total_Amount DECIMAL(10,2);

ALTER TABLE sales_data
ALTER COLUMN Discount DECIMAL(5,2);
*/
--finding dublicate
/*
ALTER TABLE sales_data
ADD CONSTRAINT PK_sales PRIMARY KEY (InvoiceID);
*/

-- calculated columns
/*
SELECT *
FROM sales_data
WHERE Total_Amount <>
      (Gross_Amount - Discount_Amount + Tax_Amount);
*/