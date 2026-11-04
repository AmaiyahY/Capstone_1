-- Project: Capstone 1 Analysis
-- Sales territory: MA(Massachusetts)
-- Region: Northeast
USE sample_sales;
DESCRIBE store_sales;
DESCRIBE management;
SELECT region, state, regionaldirector
FROM management;

-- 1)total revenue overall for sales start & date and end date.
-- Answer: Total revenue = 816,660,879.30
	     -- Date Range: 01/01/2022 - 12/31/2025
SELECT SUM(sale_amount) AS Total_Sales,
MIN(transaction_date) AS Start_Date,
MAX(transaction_date) AS End_Date
FROM store_sales
JOIN store_locations
WHERE State = 'Massachusetts';

-- 2) What is the revenue breakdown by year and month for the sales territory
-- Answer:
SELECT YEAR(transaction_date) as SaleYear,
MONTH(transaction_date) as SaleMonth,
SUM(sale_amount) as Total
FROM store_sales
JOIN store_locations
WHERE state = 'Massachusetts'
GROUP BY SaleYear, SaleMonth
ORDER BY SaleYear, SaleMonth
