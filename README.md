# MYSQL Project From Myntra Dataset
## 📌 Project Overview:

This project focuses on data analytics using MySQL to derive insights from the Myntra dataset. It includes SQL queries for data exploration, transformation, and analysis, helping to uncover key trends and patterns.

## 📂 Dataset Information : 

### The dataset consists of 1,68,029 records and 13 columns:

![Screenshot 2025-02-25 164532](https://github.com/user-attachments/assets/1e2ca4e0-fa56-4657-a9ff-c2ab73e5d77e)

## MySQL for Data Analytics: Queries & Insights :
### 1. Finding the top 5 brands that sold the most number of products?

    SELECT brand_tag, SUM(rating_count) AS 'products_sold' FROM myntra.products 
      GROUP BY brand_tag
    ORDER BY products_sold DESC LIMIT 10;

### 2. Finding the worst rated product by nike & rating is not equals zero?
    SELECT product_name, rating, rating_count, ROUND(rating * rating_count) AS 'comb_rating' FROM myntra.products
        WHERE brand_tag = 'nike' AND rating != 0
    ORDER BY comb_rating ASC LIMIT 5;

### 4. Top 5 products based on best rating | rating * rating_count?
    SELECT product_name, rating, rating_count, 
        ROUND(rating * rating_count) AS 'comb_rating' 
        FROM myntra.products
    ORDER BY comb_rating DESC LIMIT 5;

### 5. Finding the brand adidas the discounted price 5000 to 8000 range, rating 4 above and rating count also 10 above ?
    SELECT product_name, brand_tag, marked_price, discounted_price FROM myntra.products 
        WHERE (discounted_price BETWEEN 3000 AND 8000) AND 
        brand_tag = 'Adidas'  AND rating > 4
    AND rating_count > 10;

### 6. Finding the top 10 brands that offer the maximum discount?
    SELECT brand_tag, AVG(discount_percent) AS 'price' FROM myntra.products 
        GROUP BY brand_tag 
    ORDER BY price DESC LIMIT 10;

### 7. List top 5 brands which has sold most number of shirts?
    SELECT brand_tag, product_tag, SUM(rating_count) as 'orders', AVG(discounted_price) as 'avg_price'
        FROM products 
    WHERE product_tag = 'shirts'
        GROUP BY brand_tag
    ORDER BY orders DESC LIMIT 5;

### 8. Finding the top 10 best rated t-shirts from nike or adidas | rating * rating_count?
    SELECT product_name, rating, rating_count, brand_tag, discounted_price, ROUND(rating * rating_count) AS 'comb_rating' FROM myntra.products
        WHERE brand_tag IN ('nike', 'adidas') AND product_tag = 'tshirts'
    ORDER BY comb_rating DESC LIMIT 10;

### 9. 10 worst rated t-shirts based on the rating of at least 100 people?
    SELECT product_name, rating, rating_count, brand_tag, discounted_price, product_link FROM myntra.products
        WHERE product_tag = 'tshirts' AND rating_count > 100
    ORDER BY rating ASC LIMIT 20;

### 10. Finding the top 5 least expensive brands based on their discounted price?
    SELECT brand_tag, ROUND(AVG(discounted_price))  AS 'average_price' FROM products 
        GROUP BY brand_tag
    ORDER BY average_price ASC LIMIT 5;


## Insights & Key Findings

**• Most Sold Brands:** The top brands with the highest product sales can be identified using customer reviews and ratings.

**• Worst Rated Products:** Identifies products with poor performance to understand customer dissatisfaction.

**• Best Deals & Discounts:** Determines which brands offer the best discounts, helping consumers make better purchasing decisions.

**• Brand Performance:** Helps in analyzing how brands like Nike, Adidas, and others perform across various product categories.

**• Price & Quality Correlation:** Finds the best-rated products in different price ranges.

**📌 Technologies Used**
✅ MySQL
✅ SQL Queries for Data Analysis
✅ EDA (Exploratory Data Analysis)
