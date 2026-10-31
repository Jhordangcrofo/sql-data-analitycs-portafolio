Sakila Database — SQL Business Analysis
Project Overview

This project explores the Sakila database using SQL to analyze rental revenue, film performance, customer spending, and monthly business activity.

Through five business-oriented SQL queries, the project demonstrates how relational data can be transformed into meaningful insights to support business analysis and decision-making.

The analysis covers monthly revenue trends, the highest-revenue film categories, the most frequently rented films, top-spending customers, and film rankings within selected categories.

A key focus of this project is the use of Common Table Expressions (CTEs) and window functions to rank films by revenue within individual categories.
Project Objectives

    Analyze monthly revenue trends over time.
    Identify the five film categories generating the highest revenue.
    Determine the ten most frequently rented films.
    Identify the ten customers with the highest total spending.
    Rank the top three films by revenue within the Action and Comedy categories.

Tools & Technologies

    SQL
    SQLite
    Sakila relational database

Database Overview

Sakila is a sample database representing a DVD rental business. It contains information about films, categories, inventory, rentals, payments, and customers.

This project focuses on the following tables:
Table 	Purpose
payment 	Payment transactions and amounts
category 	Film category information
film_category 	Relationships between films and categories
film 	Film titles and related information
inventory 	Film copies available for rental
rental 	Rental transactions
customer 	Customer information

These tables are joined to connect rental activity with payment records, allowing the analysis to examine revenue and rental performance across different business dimensions.
Author

Roberto Andrade

Aspiring Data Analyst | SQL | Excel | Power Query | Power BI
