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
