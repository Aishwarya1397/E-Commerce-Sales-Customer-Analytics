-- ============================================================
-- Project : E-Commerce Sales Analysis
-- Author  : Aishwarya Tupe
-- Database: ecommerce_analysis
-- Table   : shopping_trends
-- ============================================================

USE ecommerce_analysis;

-- ============================================================
-- Business Question 1
-- Find the total number of transactions
-- ============================================================

SELECT COUNT(*) AS total_transactions
FROM shopping_trends;

-- ============================================================
-- Business Question 2
-- Calculate total revenue
-- ============================================================

SELECT SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends;

-- ============================================================
-- Business Question 3
-- Calculate average purchase amount
-- ============================================================

SELECT AVG(purchase_amount_usd) AS average_purchase_amount
FROM shopping_trends;

-- ============================================================
-- Business Question 4
-- Find minimum and maximum purchase amount
-- ============================================================

SELECT
    MIN(purchase_amount_usd) AS minimum_purchase,
    MAX(purchase_amount_usd) AS maximum_purchase
FROM shopping_trends;


-- ============================================================
-- BASIC QUERIES
-- ============================================================

USE ecommerce_analysis;

-- Total Transactions

SELECT COUNT(*) AS total_transactions
FROM shopping_trends;

-- Total Revenue

SELECT SUM(purchase_amount_usd) AS total_revenue
FROM shopping_trends;

-- Average Purchase Amount

SELECT AVG(purchase_amount_usd) AS average_purchase_amount
FROM shopping_trends;

-- Minimum and Maximum Purchase Amount

SELECT
    MIN(purchase_amount_usd) AS minimum_purchase,
    MAX(purchase_amount_usd) AS maximum_purchase
FROM shopping_trends;

-- Total Categories

SELECT COUNT(DISTINCT category) AS total_categories
FROM shopping_trends;

-- Total Locations

SELECT COUNT(DISTINCT location) AS total_locations
FROM shopping_trends;

-- Total Payment Methods

SELECT COUNT(DISTINCT payment_method) AS total_payment_methods
FROM shopping_trends;

-- Total Shipping Types

SELECT COUNT(DISTINCT shipping_type) AS total_shipping_types
FROM shopping_trends;
