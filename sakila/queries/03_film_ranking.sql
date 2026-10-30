1. Monthly Revenue Analysis
-- =====================================================
-- BUSINESS QUESTION:
-- How much revenue did the business generate each month?
--
-- SKILLS:
-- strftime, SUM, ROUND, GROUP BY, ORDER BY,
-- Date Formatting, Time-Based Analysis
-- =====================================================
SELECT
strftime('%Y-%m', payment_date) AS "Year and month",
ROUND(SUM(amount), 2) AS "Total" 
FROM payment
GROUP BY strftime('%Y-%m',payment_date)
ORDER BY strftime('%Y-%m',payment_date) ASC;

 

2. Top 5 Revenue-Generating Film Categories
-- =====================================================
-- BUSINESS QUESTION:
-- Which five film categories generate the highest revenue?
--
-- SKILLS:
-- JOIN, SUM, ROUND, GROUP BY, ORDER BY, LIMIT,
-- Multi-Table Analysis
-- =====================================================
SELECT
c.name AS "Category",
ROUND(SUM(p.amount),2) AS "Total"
FROM category c
JOIN film_category fc
	ON c.category_id = fc.category_id
JOIN inventory i
	ON fc.film_id = i.film_id
JOIN rental r
	ON i.inventory_id = r.inventory_id
JOIN payment p
	ON r.rental_id = p.rental_id
GROUP BY c.category_id, c.name
ORDER BY ROUND(SUM(p.amount),2) DESC
LIMIT 5;

 
3. Top 10 Most Rented Films
-- =====================================================
-- BUSINESS QUESTION:
-- Which ten films have been rented the most?
--
-- SKILLS:
-- JOIN, COUNT, GROUP BY, ORDER BY, LIMIT,
-- Aggregation
-- =====================================================
SELECT
f.title AS "Movie",
COUNT(r.rental_id) AS "Total"
FROM film f
JOIN inventory i
	ON f.film_id = i.film_id
JOIN rental r
	ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY COUNT(i.film_id) DESC
LIMIT 10;


 
4. Top 10 Customers by Total Spending
-- =====================================================
-- BUSINESS QUESTION:
-- Who are the ten highest-spending customers?
--
-- SKILLS:
-- JOIN, SUM, ROUND, GROUP BY, ORDER BY, LIMIT,
-- Customer Analysis
-- =====================================================
SELECT
c.first_name||' '||c.last_name AS "Customer",
ROUND(SUM(p.amount),2) AS "Total"
FROM customer c
JOIN payment p
	ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY SUM(p.amount) DESC
LIMIT 10;

 
5. Top 3 Films by Revenue in Action and Comedy
-- =====================================================
-- BUSINESS QUESTION:
-- Which three films generate the highest revenue
-- within the Action and Comedy categories?
--
-- SKILLS:
-- CTEs (WITH), ROW_NUMBER, PARTITION BY,
-- Window Functions, SUM, GROUP BY, ORDER BY
-- =====================================================
WITH rnk_mov AS (
  SELECT
  f.title AS "Movie",
  c.name AS "Category",
  ROUND(SUM(p.amount),2) AS "Total",
ROW_NUMBER() OVER (
  PARTITION BY c.name
  ORDER BY SUM(p.amount) DESC
) AS "Position"
  FROM film f
  JOIN film_category fc
  	ON f.film_id = fc.film_id
  JOIN inventory i
  	ON fc.film_id = i.film_id
  JOIN rental r
  	ON i.inventory_id = r.inventory_id
  JOIN payment p
  	ON r.rental_id = p.rental_id
 JOIN category c
  	ON fc.category_id = c.category_id
WHERE c.name IN ('Comedy','Action')
GROUP BY f.film_id
)

SELECT *
FROM rnk_mov
WHERE "Position" <= 3
ORDER BY "Category", "Position";
