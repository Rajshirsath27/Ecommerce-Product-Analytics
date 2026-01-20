E-commerce Data Analysis Queries


-- 1. Create Database
CREATE DATABASE IF NOT EXISTS flipkart_eda;

-- 2. Use Database
USE flipkart_eda;

-- 3. View All Records
SELECT * FROM flipkart_products;

-- 4. Count Total Records
SELECT COUNT(*) AS total_products
FROM flipkart_products;

-- 5. Check Distinct Brands
SELECT DISTINCT brand
FROM flipkart_products;

-- 6. Count Products by Brand
SELECT brand, COUNT(*) AS product_count
FROM flipkart_products
GROUP BY brand
ORDER BY product_count DESC;

-- 7. Top 10 Brands
SELECT brand, COUNT(*) AS product_count
FROM flipkart_products
GROUP BY brand
ORDER BY product_count DESC
LIMIT 10;

-- 8. Average Retail Price
SELECT AVG(retail_price) AS avg_retail_price
FROM flipkart_products;

-- 9. Average Discounted Price
SELECT AVG(discounted_price) AS avg_discounted_price
FROM flipkart_products;

-- 10. Create Discount Column
SELECT product_name,
       retail_price,
       discounted_price,
       (retail_price - discounted_price) AS discount
FROM flipkart_products;

-- 11. Products with Highest Discount
SELECT product_name, brand,
       retail_price,
       discounted_price,
       (retail_price - discounted_price) AS discount
FROM flipkart_products
ORDER BY discount DESC
LIMIT 10;

-- 12. Price Range Analysis
SELECT
    MIN(discounted_price) AS min_price,
    MAX(discounted_price) AS max_price,
    AVG(discounted_price) AS avg_price
FROM flipkart_products;

-- 13. Products Below 500 Price
SELECT product_name, brand, discounted_price
FROM flipkart_products
WHERE discounted_price < 500;

-- 14. Count FK Advantage Products
SELECT is_FK_Advantage_product,
       COUNT(*) AS count
FROM flipkart_products
GROUP BY is_FK_Advantage_product;

-- 15. Rating Analysis
SELECT product_rating, COUNT(*) AS count
FROM flipkart_products
GROUP BY product_rating
ORDER BY count DESC;

-- 16. Average Rating by Brand
SELECT brand,
       AVG(product_rating) AS avg_rating
FROM flipkart_products
WHERE product_rating IS NOT NULL
GROUP BY brand
ORDER BY avg_rating DESC;

-- 17. Top Rated Products
SELECT product_name, brand, product_rating
FROM flipkart_products
ORDER BY product_rating DESC
LIMIT 10;

-- 18. Category Wise Product Count
SELECT product_category_tree,
       COUNT(*) AS total_products
FROM flipkart_products
GROUP BY product_category_tree
ORDER BY total_products DESC;

-- 19. Products With No Rating
SELECT COUNT(*) AS no_rating_products
FROM flipkart_products
WHERE product_rating = 'No rating available';

-- 20. Most Expensive Products
SELECT product_name, brand, retail_price
FROM flipkart_products
ORDER BY retail_price DESC
LIMIT 10;

-- 21. Cheapest Products
SELECT product_name, brand, discounted_price
FROM flipkart_products
ORDER BY discounted_price ASC
LIMIT 10;

-- 22. Price vs Rating Analysis
SELECT product_name,
       discounted_price,
       product_rating
FROM flipkart_products
WHERE product_rating IS NOT NULL;

-- 23. Brand Performance Summary
SELECT brand,
       COUNT(*) AS total_products,
       AVG(discounted_price) AS avg_price,
       AVG(product_rating) AS avg_rating
FROM flipkart_products
GROUP BY brand;


