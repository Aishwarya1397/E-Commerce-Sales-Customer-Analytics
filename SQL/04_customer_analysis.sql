-- ============================================================
-- CUSTOMER ANALYSIS
-- ============================================================

USE ecommerce_analysis;

SELECT
    gender,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY gender
ORDER BY average_purchase DESC;

SELECT
    gender,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY gender
ORDER BY total_revenue DESC;

SELECT
    age,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY age
ORDER BY average_purchase DESC;

SELECT
    subscription_status,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY subscription_status;

SELECT
    frequency_of_purchases,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY frequency_of_purchases
ORDER BY total_revenue DESC;

SELECT
    previous_purchases,
    COUNT(*) AS customers,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY previous_purchases
ORDER BY previous_purchases;

SELECT
    customer_id,
    SUM(purchase_amount_usd) AS total_spent
FROM shopping_trends
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

SELECT
    subscription_status,
    AVG(review_rating) AS average_rating
FROM shopping_trends
GROUP BY subscription_status;

SELECT
    gender,
    COUNT(*) AS total_customers
FROM shopping_trends
GROUP BY gender;

SELECT
    age,
    COUNT(*) AS total_customers
FROM shopping_trends
GROUP BY age
ORDER BY total_customers DESC;