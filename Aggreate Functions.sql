USE gfg;
SELECT * FROM products;

-- Finding the number of products in the dataset
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(product_name) AS total_products FROM products;

-- Finding the average discounted price of products in the dataset
SELECT AVG(discounted_price) AS average_price FROM products;
SELECT AVG(marked_price) AS average_price FROM products;

-- Finding the most expensive product on Myntra
SELECT MAX(discounted_price) AS average_price FROM products;
SELECT MAX(marked_price) AS average_price FROM products;

-- Finding the least expensive product on Myntra
SELECT MIN(discounted_price) AS average_price FROM products;
SELECT MIN(marked_price) AS average_price FROM products;

-- Find the total rating count of all products
SELECT SUM(rating_count) AS total_rating FROM products;

-- Find the total unique brands
SELECT DISTINCT brand_name AS brands FROM products;

-- Find the number of unique brands
SELECT COUNT(DISTINCT brand_name) AS total_brands FROM products;
