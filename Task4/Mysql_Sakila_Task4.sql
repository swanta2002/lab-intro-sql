USE sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT name AS categories, COUNT(*) AS count
FROM film_category fc
JOIN category c
ON fc.category_id = c.category_id
GROUP BY categories
ORDER BY count DESC;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT s.first_name AS 1_name, s.last_name AS 2_name, s.staff_id AS staff_id, SUM(p.amount) AS total_amount
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
GROUP BY 1_name, 2_name, staff_id
ORDER BY total_amount;

-- Which actor has appeared in the most films?
SELECT a.actor_id AS actorid, COUNT(*) num_appearance
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY actorid
ORDER BY num_appearance DESC
LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)
SELECT c.customer_id AS customerid, c.first_name AS 1_name, COUNT(*) most_active
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id
GROUP BY customerid, 1_name
ORDER By most_active DESC
LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name AS 1_name, s.last_name AS 2_name, a.address AS 1_address, a.address2 AS 2_address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

-- List each film and the number of actors who are listed for that film.
SELECT f.title AS title, f.film_id AS filmid, COUNT(fa.actor_id) num_actors
FROM film_actor fa
JOIN film f
ON fa.film_id = f.film_id
GROUP BY title,filmid
ORDER BY num_actors;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers
--  alphabetically by last name.
SELECT c.last_name 1_name, SUM(p.amount) total_paid
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY 1_name
ORDER BY 1_name ASC;

-- List number of films per category.
SELECT c.name AS categories, COUNT(*) num_category
FROM film_category fc
JOIN category c 
ON fc.category_id = c.category_id
GROUP BY categories
ORDER BY num_category;
