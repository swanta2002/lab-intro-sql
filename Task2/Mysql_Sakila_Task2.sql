USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE first_name = 'Scarlett';

-- How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT DISTINCT(COUNT(title))
FROM film;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT FlOOR(AVG(length/60)) AS hours, AVG(length % 60) AS minutes
FROM film;

-- How many distinct (different) actors' last names are there?
SELECT DISTINCT(last_name)
FROM actor;

-- How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS 'days_operated'
FROM rental; -- gave wrong result, and I dn't know why

SELECT TIMESTAMPDIFF(DAY, '2005-05-31 00:46:31', '2005-05-24 22:53:30') AS 'days_operated'
FROM rental;

SELECT DATEDIFF('2005-05-31 00:46:31', '2005-05-24 22:53:30') AS 'days_operated'
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, DATE_FORMAT(rental_date, '%M') AS 'month', DATE_FORMAT(rental_date, '%W') AS 'day'
FROM rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, date_format(rental_date, '%W') AS 'day_type'
FROM rental;


-- Get release years.

-- Get all films with ARMAGEDDON in the title.
SELECT title, film_id
FROM film
WHERE title like '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT title, film_id
FROM film
WHERE title like '%APOLLO';

-- Get 10 the longest films.
SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT film_id, special_features, COUNT(title)
FROM film
GROUP BY 1, 2
HAVING special_features LIKE '%Behind the Scenes'

