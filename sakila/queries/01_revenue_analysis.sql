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
