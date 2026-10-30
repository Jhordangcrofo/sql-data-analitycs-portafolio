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
