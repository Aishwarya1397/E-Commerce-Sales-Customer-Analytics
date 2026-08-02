-- ============================================================
-- Project : E-Commerce Sales Analysis
-- File    : 08_business_insights.sql
-- Purpose : Executive Business Insights
-- Author  : Aishwarya Tupe
-- ============================================================

USE ecommerce_analysis;

SELECT
    COUNT(*) AS total_transactions,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd),2) AS average_order_value
FROM shopping_trends;

SELECT
    category,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY category
ORDER BY total_revenue DESC;

SELECT
    season,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY season
ORDER BY total_revenue DESC;

SELECT
    location,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY location
ORDER BY total_revenue DESC;

SELECT
    season,
    category,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY season, category
ORDER BY season, total_revenue DESC;

SELECT
    discount_applied,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd),2) AS average_purchase
FROM shopping_trends
GROUP BY discount_applied;


SELECT
    promo_code_used,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd),2) AS average_purchase
FROM shopping_trends
GROUP BY promo_code_used;


SELECT
    subscription_status,
    COUNT(*) AS customers,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd),2) AS average_purchase
FROM shopping_trends
GROUP BY subscription_status;

SELECT
    payment_method,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY payment_method
ORDER BY total_revenue DESC;

SELECT
    shipping_type,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY shipping_type
ORDER BY total_revenue DESC;


SELECT
    item_purchased,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY item_purchased
ORDER BY total_revenue DESC
LIMIT 10;

SELECT
    item_purchased,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY item_purchased
ORDER BY total_revenue ASC
LIMIT 10;


SELECT
    CASE
        WHEN purchase_amount_usd < 30 THEN 'Low Spender'
        WHEN purchase_amount_usd BETWEEN 30 AND 60 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS customer_segment,
    COUNT(*) AS customers,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY customer_segment
ORDER BY total_revenue DESC;

SELECT
    customer_id,
    SUM(purchase_amount_usd) AS total_spent
FROM shopping_trends
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;


SELECT
    category,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(
        SUM(purchase_amount_usd) * 100 /
        SUM(SUM(purchase_amount_usd)) OVER(),
        2
    ) AS revenue_percentage
FROM shopping_trends
GROUP BY category
ORDER BY revenue_percentage DESC;

