USE sakila;

-- Write a query to display for each store its store ID, city, and country.
SELECT s.store_id AS store_id , c.city AS city, ct.country AS country
FROM city c
JOIN country ct
ON c.country_id = ct.country_id
JOIN address a
ON a.city_id = c.city_id
JOIN store s
ON s.address_id = a.address_id
LIMIT 10; 

-- Write a query to display how much business, in dollars, each store brought in.
SELECT s.store_id AS store_id, SUM(p.amount) AS amount_dollars
FROM payment p 
JOIN staff st 
ON p.staff_id = st.staff_id
JOIN store s 
ON st.store_id = s.store_id
GROUP BY store_id;


-- Which film categories are longest?
SELECT c.name AS category, MAX(length) AS length 
FROM film_category fc
JOIN category c 
ON fc.category_id = c.category_id
JOIN film f
ON fc.film_id = f.film_id
GROUP BY category
ORDER BY length DESC;

-- Display the most frequently rented movies in descending order.
SELECT  f.title AS title, MAX(f.rental_rate) As frequently_rented
FROM inventory i
JOIN film f 
ON i.film_id = f.film_id
JOIN rental r
ON r.inventory_id = i.inventory_id
GROUP BY title
ORDER BY frequently_rented DESC;

-- List the top five genres in gross revenue in descending order.
SELECT c.name AS genre, SUM(rental_rate + replacement_cost) AS gross_rev
FROM film_category fc
JOIN category c 
ON fc.category_id = c.category_id
JOIN film f  
ON fc.film_id = f.film_id
GROUP BY genre
ORDER BY gross_rev DESC
LIMIT 5;

-- Is "Academy Dinosaur" available for rent from Store 1?
SELECT f.title AS title, rental_id AS rental_id
FROM inventory i 
JOIN film f 
ON i.film_id = f.film_id
JOIN rental r 
ON r.inventory_id = i.inventory_id
-- WHERE title LIKE '%Academy Dinosaur%'
WHERE title = "Academy Dinosaur";

-- Get all pairs of actors that worked together.
SELECT a1.film_id, a2.film_id, a1.actor_id 
FROM film_actor a1
JOIN film_actor a2 
ON (a1.film_id <> a2.film_id) AND (a1.actor_id = a2.actor_id)
ORDER BY  a1.actor_id;

