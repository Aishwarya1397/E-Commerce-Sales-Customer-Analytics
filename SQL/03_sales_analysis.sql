-- ============================================================
-- SALES ANALYSIS
-- ============================================================

USE ecommerce_analysis;

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
    category,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY category
ORDER BY average_purchase DESC;

SELECT
    season,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY season
ORDER BY average_purchase DESC;

