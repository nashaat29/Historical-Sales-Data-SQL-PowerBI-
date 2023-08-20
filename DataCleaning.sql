------------------------------------------(store_data)------------------------------------------
-- Display data on store_data
SELECT TOP(10) *
FROM store_data

-- Check for duplicates
SELECT Order_ID, Ship_Date, Customer_ID,
	Product_ID, Sales, Discount,
	COUNT(*) AS count_
FROM store_data
GROUP BY Order_ID, Ship_Date, Customer_ID,
	Product_ID, Sales, Discount
HAVING COUNT(*) > 1 -- There is no duplicates

-- Check for NULL Values
SELECT COUNT(*) AS NULL_rows
FROM store_data
WHERE Order_ID IS NULL 
	OR Customer_ID IS NULL
	OR Ship_Date IS NULL
	OR Sales IS NULL

-- Calculate the average value from Sales column
DECLARE @avg_sales FLOAT
SELECT @avg_sales = AVG(Sales) FROM store_data WHERE Sales IS NOT NULL

-- Update the null values with the calculated average Sales
UPDATE store_data
SET Sales = @avg_sales
WHERE Sales IS NULL

-- Calculate Sales after discount apply
SELECT TOP(10) Sales,
	Discount,
	ROUND(Discount, 2) AS Rounded_Discount,
	(ROUND(Discount, 2) * Sales) AS Discount_value,
	Sales - (ROUND(Discount, 2) * Sales) AS Net_Sales --**Add to final Query**--
FROM store_data

------------------------------------------(master_product)------------------------------------------
-- Display data on master_product
SELECT TOP(10) *
FROM master_product

-- Check for duplicates
SELECT Product_ID, Product_Name, COUNT(*) AS count_
FROM master_product
GROUP BY Product_ID, Product_Name
HAVING COUNT(*) > 1 -- There is no duplicates

-- Check for NULL Values
SELECT COUNT(*) AS NULL_rows
FROM master_product
WHERE Product_ID IS NULL 
	OR Product_Name IS NULL

------------------------------------------(master_customer)------------------------------------------
-- Display data on master_customer
SELECT TOP(10) *
FROM master_customer

-- Check for duplicates
SELECT Customer_ID, Customer_Name, COUNT(*) AS count_
FROM master_customer
GROUP BY Customer_ID, Customer_Name
HAVING COUNT(*) > 1 -- There is no duplicates

-- Check for NULL Values
SELECT COUNT(*) AS NULL_rows
FROM master_customer
WHERE Customer_ID IS NULL 
	OR Customer_Name IS NULL 
	OR Postal_Code IS NULL

-- How many countries are present in our table?
SELECT DISTINCT(Country)
FROM master_customer -- we have only 'United States', ** useless column **

-- How many segments do we have in our table?
SELECT DISTINCT(Segment)
FROM master_customer

-- Create a new column Age_segment
ALTER TABLE master_customer
ADD Age_segment VARCHAR(20)

-- SET the Age_segment column using the CASE statement
UPDATE master_customer
SET Age_segment = CASE
		WHEN Age <= 30 THEN 'Young'
		WHEN Age > 30 AND Age <= 50 THEN 'Middle-aged'
		ELSE 'Old'
    END

------------------------------------------(JOIN and OPTIMIZATION)------------------------------------------
-- Join store_data table with master_product and master_customer table and select the columns we need for final analysis
SELECT d.Order_Date, DATEDIFF(day, d.Order_Date, d.Ship_Date) AS Days_to_ship, d.Ship_Mode, Sales - (ROUND(Discount, 2) * Sales) AS Net_Sales,
	p.Product_Name, p.Category, p.Sub_Category,
	c.Customer_Name, c.Age, c.Age_segment, c.Segment, c.Region, c.State, c.City
FROM store_data d
LEFT JOIN master_product p
	ON d.Product_ID = p.Product_ID
RIGHT JOIN master_customer c
	ON d.Customer_ID = c.Customer_ID

-- Save Result Data For Analysis --