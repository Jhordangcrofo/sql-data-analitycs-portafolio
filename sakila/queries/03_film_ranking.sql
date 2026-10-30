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
