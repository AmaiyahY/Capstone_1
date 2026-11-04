-- Project: Capstone 1 Analysis
-- Sales territory: MA(Massachusetts)
-- Region: Northeast
USE sample_sales;
DESCRIBE store_sales;
DESCRIBE management;
SELECT region, state, regionaldirector
FROM management;

-- 1)total revenue overall for sales start & date and end date.
-- Answer: Total revenue = 5,733,256.27
	     -- Date Range: 01/01/2022 - 12/31/2025
SELECT SUM(sale_amount) AS Total_Sales,
MIN(transaction_date) AS Start_Date,
MAX(transaction_date) AS End_Date
FROM store_sales
JOIN store_locations ON store_sales.store_id = store_locations.storeid
WHERE State = 'Massachusetts';

-- 2) What is the revenue breakdown by year and month for the sales territory
-- Answer: Will be in a cvs.
SELECT YEAR(transaction_date) as SaleYear,
MONTH(transaction_date) as SaleMonth,
SUM(sale_amount) as Total
FROM store_sales
JOIN store_locations
WHERE state = 'Massachusetts'
GROUP BY SaleYear, SaleMonth
ORDER BY SaleYear, SaleMonth;

-- 3) Provide a comparison of total revenue for the specific sales territory 
-- and the region it belongs to
-- Answer: Total revenue for all Northeast region: 24,237,526.98
-- Revenue for MA (back in Q1)
SELECT SUM(store_sales.sale_amount) AS region_total
FROM store_sales 
JOIN store_locations  ON store_sales.store_id = store_locations.storeid 
JOIN management ON store_locations.state = management.state 
WHERE management.region = 'Northeast';

-- 4) What is the number of transactions per month and average transaction amount by product
-- category for the sales territory?
-- Answer: In the cvs file
SELECT MONTH(store_sales.transaction_date) AS SaleMonth, AVG(store_sales.Sale_amount), 
COUNT(*) AS NumOfTransactions, inventory_categories.category
FROM Store_sales
JOIN Store_locations 
ON Store_sales.Store_ID = Store_Locations.Storeid
JOIN products 
ON Store_sales.prod_Num = Products.ProdNum
JOIN inventory_categories
ON inventory_categories.Categoryid = products.categoryid
WHERE store_locations.state = 'Massachusetts'
GROUP BY SaleMonth, products.categoryid
ORDER BY SaleMonth, products.categoryid
