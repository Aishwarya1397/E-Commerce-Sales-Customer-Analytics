-- ============================================================
-- MARKETING ANALYSIS
-- ============================================================

USE ecommerce_analysis;

SELECT
    discount_applied,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY discount_applied;

SELECT
    promo_code_used,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY promo_code_used;

SELECT
    payment_method,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY payment_method
ORDER BY total_revenue DESC;

SELECT
    shipping_type,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    AVG(purchase_amount_usd) AS average_purchase
FROM shopping_trends
GROUP BY shipping_type
ORDER BY total_revenue DESC;

SELECT
    color,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY color
ORDER BY total_revenue DESC;

SELECT
    size,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY size
ORDER BY total_revenue DESC;

SELECT
    category,
    discount_applied,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY category, discount_applied
ORDER BY category, total_revenue DESC;

SELECT
    season,
    promo_code_used,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY season, promo_code_used
ORDER BY season;

SELECT
    category,
    color,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY category, color
ORDER BY total_revenue DESC;

SELECT
    season,
    size,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY season, size
ORDER BY season, total_revenue DESC;