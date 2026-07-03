show columns from orders;

-- checking for duplicates
SELECT `Row ID`, COUNT(*) 
FROM orders
GROUP BY `Row ID`
HAVING COUNT(*) > 1;

SELECT 
  SUM(`Order_Date` IS NULL) AS null_order_date,
  SUM(`Ship_Date` IS NULL) AS null_ship_date,
  SUM(`Ship Mode` IS NULL) AS null_ship_mode,
  SUM(`Customer ID` IS NULL) AS null_customer_id,
  SUM(`Customer Name` IS NULL) AS null_customer_name,
  SUM(`Segment` IS NULL) AS null_segment,
  SUM(`Country` IS NULL) AS null_country,
  SUM(`City` IS NULL) AS null_city,
  SUM(`State` IS NULL) AS null_state,
  SUM(`Postal Code` IS NULL) AS null_postal,
  SUM(`Region` IS NULL) AS null_region,
  SUM(`Product ID` IS NULL) AS null_product_id,
  SUM(`Category` IS NULL) AS null_category,
  SUM(`Sub-Category` IS NULL) AS null_subcategory,
  SUM(`Product Name` IS NULL) AS null_product_name,
  SUM(`Sales` IS NULL) AS null_sales,
  SUM(`Quantity` IS NULL) AS null_quantity,
  SUM(`Discount` IS NULL) AS null_discount,
  SUM(`Profit` IS NULL) AS null_profit
FROM orders;

SELECT `Row ID`,`Order ID`
FROM orders
WHERE `Row ID` IS NULL   OR `Order ID` IS NULL   OR `Order_Date` IS NULL
   OR `Ship_Date` IS NULL   OR `Ship Mode` IS NULL   OR `Customer ID` IS NULL
   OR `Customer Name` IS NULL   OR `Segment` IS NULL   OR `Country` IS NULL
   OR `City` IS NULL   OR `State` IS NULL   OR `Postal Code` IS NULL   OR `Region` IS NULL
   OR `Product ID` IS NULL   OR `Category` IS NULL   OR `Sub-Category` IS NULL
   OR `Product Name` IS NULL   OR `Sales` IS NULL   OR `Quantity` IS NULL   
   OR `Discount` IS NULL  OR `Profit` IS NULL;
      