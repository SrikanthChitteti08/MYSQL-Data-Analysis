USE products;
SELECT * FROM products;

-- 1. Finding the names of unique brands
SELECT DISTINCT brand_name FROM products;

-- 2. Finding the number of unique brands
SELECT COUNT(DISTINCT brand_name) FROM products;

-- 3. Finding the number of products in each brand
SELECT brand_tag, COUNT(product_tag) FROM products GROUP BY brand_tag;

-- 4. Finding the top 5 brands who have the most number of products | different products in their inventory
SELECT brand_tag, COUNT(product_tag) AS 'products' 
FROM products 
GROUP BY brand_tag
ORDER BY products DESC LIMIT 5;

-- 5. Finding the top 5 brands who sold the most number of products
SELECT brand_tag, SUM(rating_count) AS 'products_sold' 
FROM products 
GROUP BY brand_tag
ORDER BY products_sold DESC LIMIT 5;

-- 6. Finding the top 5 most expensive brands based on their discounted price
SELECT brand_tag, ROUND(AVG(discounted_price)) AS 'average_price' 
FROM products 
GROUP BY brand_tag
ORDER BY average_price DESC LIMIT 5;

-- 7. Finding the top 5 least expensive brands based on their discounted price
SELECT brand_tag, ROUND(AVG(discounted_price)) AS 'average_price' 
FROM products 
GROUP BY brand_tag
ORDER BY average_price ASC LIMIT 5;

-- 8. Finding the top 10 best-selling product categories 
SELECT product_tag, SUM(rating_count) AS 'product_sold' 
FROM products 
GROUP BY product_tag
ORDER BY product_sold DESC LIMIT 5;

-- 9. Finding the top 10 brands who give the maximum discount
SELECT brand_tag, AVG(discount_percent) AS 'avg_discount' 
FROM products 
GROUP BY brand_tag
ORDER BY avg_discount DESC LIMIT 5;

-- 10. Finding the top 5 most expensive product categories
SELECT product_tag, AVG(discounted_price) AS 'avg_price' 
FROM products 
GROUP BY product_tag
ORDER BY avg_price DESC LIMIT 5;

-- 11. Brand Report Card
SELECT brand_tag, 
    SUM(rating_count) AS 'people_rated',
    MIN(marked_price) AS 'min_mar_price',
    AVG(marked_price) AS 'avg_mar_price',
    MAX(marked_price) AS 'max_mar_price' 
FROM products 
GROUP BY brand_tag;

-- 12. Which product category of any brand is sold the most?
SELECT brand_tag, product_tag, SUM(rating_count) AS 'people_rated' 
FROM products 
GROUP BY brand_tag, product_tag
ORDER BY people_rated DESC LIMIT 10;

-- 13. List top 5 brands which have sold the most number of t-shirts
SELECT brand_tag, product_tag, SUM(rating_count) AS 'orders', AVG(discounted_price) AS 'avg_price'
FROM products 
WHERE product_tag = 'tshirts'
GROUP BY brand_tag
ORDER BY orders DESC LIMIT 5;

-- 14. List top 5 brands which have sold the most number of shirts
SELECT brand_tag, product_tag, SUM(rating_count) AS 'orders', AVG(discounted_price) AS 'avg_price'
FROM products 
WHERE product_tag = 'shirts'
GROUP BY brand_tag
ORDER BY orders DESC LIMIT 5;

-- 15. List top 5 brands which have sold the most number of jeans
SELECT brand_tag, product_tag, SUM(rating_count) AS 'orders', AVG(discounted_price) AS 'avg_price'
FROM products 
WHERE product_tag = 'jeans'
GROUP BY brand_tag
ORDER BY orders DESC LIMIT 5;

-- 16. List top 5 brands which have sold the most number of dresses
SELECT brand_tag, product_tag, SUM(rating_count) AS 'orders', AVG(discounted_price) AS 'avg_price'
FROM products 
WHERE product_tag = 'dresses'
GROUP BY brand_tag
ORDER BY orders DESC LIMIT 5;

-- 17. Most popular product name listed in Myntra
SELECT product_name, COUNT(product_name) AS 'name_count' 
FROM products 
GROUP BY product_name 
ORDER BY name_count DESC LIMIT 10;

-- 18. Number of products sold for every rating (0 - 5)
SELECT rating, COUNT(rating) AS 'freq' 
FROM products 
GROUP BY rating 
ORDER BY rating ASC;

-- 19. Number of products sold for every rating by Nike
SELECT rating, COUNT(rating) AS 'freq' 
FROM products 
WHERE brand_tag = 'nike'
GROUP BY rating 
ORDER BY rating ASC;

-- 20. Number of products sold for every rating in the t-shirt category
SELECT rating, COUNT(rating_count) AS 'freq' 
FROM products 
WHERE product_tag = 'tshirts'
GROUP BY rating 
ORDER BY rating ASC;

-- 21. Relation between price of the t-shirt and its rating with respect to people rated
SELECT product_tag, rating, ROUND(AVG(rating_count)) AS 'product_count', ROUND(AVG(discounted_price))
FROM products
WHERE product_tag = 'tshirts'
GROUP BY rating
ORDER BY rating ASC;

-- 22. Find the average rating for each product category (product tag) along with the number of products and total rating count
SELECT product_tag, AVG(rating) AS 'avg_rating', COUNT(*) AS 'total_products', SUM(rating_count) AS 'total_rating_count'
FROM products
GROUP BY product_tag
ORDER BY avg_rating ASC;

-- 23. Find the brand with the highest average rating among products with a discounted price greater than 5000
SELECT brand_tag, AVG(rating) AS 'avg_rating', SUM(rating_count)
FROM products
WHERE discounted_price > 5000
GROUP BY brand_tag
ORDER BY avg_rating DESC;
