-- ============================================================
-- WINDOW FUNCTIONS
-- ============================================================

USE ecommerce_analysis;

SELECT
    customer_id,
    purchase_amount_usd,
    ROW_NUMBER() OVER(ORDER BY purchase_amount_usd DESC) AS row_num
FROM shopping_trends;

SELECT
    customer_id,
    purchase_amount_usd,
    RANK() OVER(ORDER BY purchase_amount_usd DESC) AS customer_rank
FROM shopping_trends;

SELECT VERSION();

SELECT
    customer_id,
    purchase_amount_usd,
    DENSE_RANK() OVER (
        ORDER BY purchase_amount_usd DESC
    ) AS customer_rank
FROM shopping_trends;


SELECT
    category,
    customer_id,
    purchase_amount_usd,
    RANK() OVER(
        PARTITION BY category
        ORDER BY purchase_amount_usd DESC
    ) AS category_rank
FROM shopping_trends;


SELECT
    customer_id,
    purchase_amount_usd,
    SUM(purchase_amount_usd)
    OVER(
        ORDER BY customer_id
    ) AS running_revenue
FROM shopping_trends;


SELECT
    customer_id,
    category,
    purchase_amount_usd,
    AVG(purchase_amount_usd)
    OVER(
        PARTITION BY category
    ) AS category_average
FROM shopping_trends;


SELECT
    customer_id,
    purchase_amount_usd,
    LAG(purchase_amount_usd)
    OVER(
        ORDER BY customer_id
    ) AS previous_purchase
FROM shopping_trends;


SELECT
    customer_id,
    purchase_amount_usd,
    LEAD(purchase_amount_usd)
    OVER(
        ORDER BY customer_id
    ) AS next_purchase
FROM shopping_trends;


SELECT
    category,
    customer_id,
    purchase_amount_usd,
    FIRST_VALUE(purchase_amount_usd)
    OVER(
        PARTITION BY category
        ORDER BY purchase_amount_usd DESC
    ) AS highest_purchase
FROM shopping_trends;


SELECT
    category,
    customer_id,
    purchase_amount_usd,
    LAST_VALUE(purchase_amount_usd)
    OVER(
        PARTITION BY category
        ORDER BY purchase_amount_usd
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_purchase
FROM shopping_trends;


SELECT
    category,
    SUM(purchase_amount_usd) AS revenue,
    ROUND(
        SUM(purchase_amount_usd) * 100 /
        SUM(SUM(purchase_amount_usd)) OVER(),
        2
    ) AS revenue_percentage
FROM shopping_trends
GROUP BY category;


WITH ranked_customers AS
(
    SELECT
        customer_id,
        category,
        purchase_amount_usd,
        ROW_NUMBER() OVER(
            PARTITION BY category
            ORDER BY purchase_amount_usd DESC
        ) AS rn
    FROM shopping_trends
)

SELECT *
FROM ranked_customers
WHERE rn <= 3;