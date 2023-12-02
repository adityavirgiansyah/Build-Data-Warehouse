# To see 100 records from the mobile_data table
SELECT 
  * 
FROM 
  `plucky-hue-391709.flipkart_ecommerce.mobile_data` 
LIMIT 100;

# To see 100 records from the scraped_data table
SELECT 
  * 
FROM 
  `plucky-hue-391709.flipkart_ecommerce.scraped_data` 
LIMIT 100;

# Aggregating data from the imported tables to create a new table in Big Query
CREATE TABLE `flipkart_ecommerce.mobile` SELECT * FROM `plucky-hue-391709.flipkart_ecommerce.mobile_data`
UNION ALL
SELECT * FROM `plucky-hue-391709.flipkart_ecommerce.scraped_data`;

# Drop Table
DROP TABLE `plucky-hue-391709.flipkart_ecommerce.mobile_data`;
DROP TABLE `plucky-hue-391709.flipkart_ecommerce.scraped_data`;

# Getting useful insights by querying aggregated data in Big Query
# Analyze data

# mobile phones by brand
SELECT 
  Brand, 
  COUNT(*) 
FROM 
  `plucky-hue-391709.flipkart_ecommerce.mobile`
GROUP BY 
  1;

# rating >= 3.5
SELECT
  *
FROM
  `plucky-hue-391709.flipkart_ecommerce.mobile`
WHERE
  Rating >= 3.5;

# mobile phone having selling_price between 10,000 and 15,000
SELECT
  *
FROM
  `plucky-hue-391709.flipkart_ecommerce.mobile`
WHERE
  Selling_Price >= 10000 
  AND Original_Price <= 15000;

# mobile phone have selling price as original price
SELECT
  *
FROM
  `plucky-hue-391709.flipkart_ecommerce.mobile`
WHERE
  Selling_Price = Original_Price;

# the most widely sold model in ecommerce
SELECT
  Model,
  COUNT(*) AS model_count
FROM
  `plucky-hue-391709.flipkart_ecommerce.mobile`
GROUP BY
  1
ORDER BY
  model_count DESC;

# Finding the details of mobile phones which have Memory greater than 6 GB
SELECT 
  * 
FROM 
  `plucky-hue-391709.flipkart_ecommerce.mobile` 
WHERE 
  (CAST(SUBSTRING(Memory,1,length(Memory)-2) AS FLOAT64)>6) 
  AND (RIGHT(Memory,2)="GB");