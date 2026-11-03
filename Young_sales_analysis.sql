USE sample_sales;
-- Project: Capstone 1 Analysis
-- Sales territory: MA(Massachusetts)
-- Region: Northeast
SHOW TABLES;
DESCRIBE store_sales;
DESCRIBE management;
SELECT region, state, regionaldirector
FROM management;

-- 1)total revenue overall for sales start & date and end date.
-- STORESALES
SELECT SUM(sale_amount) AS Total_Sales,
MIN(transaction_date) AS Start_Date,
MAX(transaction_date) AS End_Date
FROM store_sales
JOIN store_locations
WHERE State = 'Massachusetts'
