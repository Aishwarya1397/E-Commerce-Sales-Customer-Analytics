-- ============================================================
-- ADVANCED SQL QUERIES
-- ============================================================

USE ecommerce_analysis;

SELECT
    customer_id,
    purchase_amount_usd,
    CASE
        WHEN purchase_amount_usd < 30 THEN 'Low Spender'
        WHEN purchase_amount_usd BETWEEN 30 AND 60 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS customer_segment
FROM shopping_trends;

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
    category,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY category
HAVING SUM(purchase_amount_usd) >
(
    SELECT AVG(category_revenue)
    FROM
    (
        SELECT SUM(purchase_amount_usd) AS category_revenue
        FROM shopping_trends
        GROUP BY category
    ) AS avg_table
);

SELECT *
FROM
(
    SELECT
        customer_id,
        SUM(purchase_amount_usd) AS total_spent
    FROM shopping_trends
    GROUP BY customer_id
) AS customer_sales
WHERE total_spent >
(
    SELECT AVG(total_spent)
    FROM
    (
        SELECT
            customer_id,
            SUM(purchase_amount_usd) AS total_spent
        FROM shopping_trends
        GROUP BY customer_id
    ) AS avg_sales
);

CREATE VIEW category_sales AS
SELECT
    category,
    SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends
GROUP BY category;

SELECT *
FROM category_sales;

WITH category_revenue AS
(
    SELECT
        category,
        SUM(purchase_amount_usd) AS total_revenue
    FROM shopping_trends
    GROUP BY category
)

SELECT *
FROM category_revenue
ORDER BY total_revenue DESC;

SELECT
    customer_id,
    purchase_amount_usd
FROM shopping_trends
WHERE purchase_amount_usd >
(
    SELECT AVG(purchase_amount_usd)
    FROM shopping_trends
)
ORDER BY purchase_amount_usd DESC;

SELECT
    season,
    category,
    SUM(purchase_amount_usd) AS revenue
FROM shopping_trends
GROUP BY season, category
ORDER BY season, revenue DESC;


SELECT
    customer_id,
    previous_purchases,
    purchase_amount_usd
FROM shopping_trends
WHERE previous_purchases >
20
ORDER BY previous_purchases DESC;

SELECT
    subscription_status,
    COUNT(*) AS customers,
    SUM(purchase_amount_usd) AS revenue,
    ROUND(
        SUM(purchase_amount_usd) * 100 /
        (SELECT SUM(purchase_amount_usd)
         FROM shopping_trends),
        2
    ) AS revenue_percentage
FROM shopping_trends
GROUP BY subscription_status;