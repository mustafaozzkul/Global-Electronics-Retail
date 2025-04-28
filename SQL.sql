--Data Controlling
SELECT * FROM customers

-- Data Model Creating 
-- CONSTRAINTING PRIMARY KEY AND FOREIGN KEY
ALTER TABLE customers
ADD CONSTRAINT pk_customers PRIMARY KEY (customerkey);

ALTER TABLE stores
ADD CONSTRAINT pk_storekey PRIMARY KEY (storekey)

ALTER TABLE products
ADD CONSTRAINT pk_productskey PRIMARY KEY (productkey)

DELETE FROM sales
WHERE customerkey = 743343

ALTER TABLE sales
ADD CONSTRAINT fk_customerkey 
FOREIGN KEY (customerkey) REFERENCES customers(customerkey)


ALTER TABLE sales
ALTER COLUMN storekey TYPE INT USING storekey :: INT

ALTER TABLE stores
ALTER COLUMN storekey TYPE INT USING storekey :: INT

ALTER TABLE sales
ADD CONSTRAINT fk_storekey
FOREIGN KEY (storekey) REFERENCES stores(storekey)

ALTER TABLE sales
ADD CONSTRAINT fk_productskey
FOREIGN KEY (productkey) REFERENCES products(productkey)

-- Business Questions--

-- 1- Total Number of Customers

SELECT 
	COUNT(*) as total_customer
FROM customers

-- 2- Gender Distribution

SELECT
	gender,
	COUNT(*) AS customers
FROM customers
GROUP BY 1 

-- 3- Age Distribution

SELECT 
	age,
	COUNT(*) as customer
FROM customers
GROUP BY 1
ORDER BY 2 DESC

-- 4- Country Distribution

SELECT
	country,
	COUNT(*) AS customer
FROM customers
GROUP BY 1
ORDER BY 2 DESC

-- 5- Total Orders for each age group

SELECT
	CASE
	WHEN age >= 65 THEN 'Old'
	WHEN age >=30 THEN 'Adult'
	ELSE 'Young'
	END as age_group,
	COUNT(s.order_number) as Total_order
FROM customers c
JOIN sales s on s.customerkey = c.customerkey
GROUP BY 1 

-- 6- Total Profit for each age group	

SELECT
	CASE
	WHEN age >= 65 THEN 'Old'
	WHEN age >=30 THEN 'Adult'
	ELSE 'Young'
	END as age_group,
	ROUND(SUM(s.quantity * p.unit_profit):: NUMERIC,2) as Total_profit
FROM customers c
LEFT JOIN sales s on s.customerkey = c.customerkey
LEFT JOIN products p on p.productkey = s.productkey 
GROUP BY 1
ORDER BY 2 DESC

-- 7- Total Sales

SELECT 
	ROUND(SUM(s.quantity * p.unit_price_usd):: NUMERIC ,1) as total_sales
FROM sales s
LEFT JOIN products p on s.productkey = p.productkey

-- 8- Total Cost

SELECT 
	ROUND(SUM(s.quantity * p.unit_cost_usd):: NUMERIC ,1) as total_cost
FROM sales s
LEFT JOIN products p on s.productkey = p.productkey

-- 9- Total Porfit

SELECT 
	ROUND(SUM(s.quantity * (p.unit_price_usd - p.unit_cost_usd)):: NUMERIC ,1) as total_profit
FROM sales s
LEFT JOIN products p on s.productkey = p.productkey


-- 10- How much order has done for each year

SELECT 
	EXTRACT (YEAR FROM order_date) as year,
	COUNT(*)
FROM sales
GROUP BY 1
ORDER BY 1 ASC

-- 11- Total Sales by Country

SELECT
	s.country,
	ROUND(SUM(sl.quantity * p.unit_price_usd):: NUMERIC ,1) as total_sales
FROM stores s
LEFT JOIN sales sl on sl.storekey = s.storekey
LEFT JOIN products p on p.productkey = sl.productkey
GROUP BY 1
ORDER BY 2 DESC

-- 12- Avg Unit Cost

SELECT
	ROUND(AVG(unit_cost_usd):: NUMERIC,1) as avg_unit_cost
FROM products

-- 13- What is the Avg Unit Profit 

SELECT
	ROUND(AVG(unit_profit):: NUMERIC,1) as avg_unit_cost
FROM products

-- 14- Which Store has the higher Total Sales

SELECT 
	s.storekey,
	SUM(sl.quantity * p.unit_price_usd)
FROM stores s
LEFT JOIN sales sl ON s.storekey = sl.storekey
LEFT JOIN products p ON p.productkey = sl.productkey
GROUP BY 1
ORDER BY 2 DESC

-- 15- Which brand has the highest number of sales

SELECT 
	p.brand,
	COUNT(*)
FROM products p
JOIN sales s ON s.productkey = p.productkey
GROUP BY 1
ORDER BY 2 DESC

-- 16- what is the most profitiable products for each brand
SELECT *
FROM(
WITH cte as (
SELECT
	brand,
	product_name,
	AVG(unit_profit) as avg_profit
FROM products
GROUP BY 1,2
)

SELECT 
	*,
	DENSE_RANK() OVER(PARTITION BY brand ORDER BY avg_profit DESC) as brand_rank
FROM cte
ORDER BY 1,3 DESC
) 
WHERE brand_rank = 1














