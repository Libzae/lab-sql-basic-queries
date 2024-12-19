USE sakila;

SHOW TABLES;
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
SELECT title FROM film;
SELECT * FROM language;
#3.2 List of languages used in films, with the column aliased as `language` from the `language` table 
SELECT name FROM language;
#- 3.3 List of first names of all employees from the `staff` table
SELECT * FROM staff;
SELECT first_name FROM staff;

#4. Retrieve unique release years.
SELECT DISTINCT release_year FROM film;
#5. Counting records for database insights:
	#5.1 Determine the number of stores that the company has
SELECT * FROM store;
SELECT SUM(store_id) FROM store;
#5.2 Determine the number of employees that the company has
SELECT * FROM staff;
SELECT COUNT(first_name) FROM staff;
#5.3 Determine how many films are available for rent and how many have been rented.
SELECT * FROM rental;
SELECT 
    SUM(CASE WHEN return_date IS NULL THEN 1 ELSE 0 END) AS available_for_rent,
    SUM(CASE WHEN return_date IS NOT NULL THEN 1 ELSE 0 END) AS rented
FROM rental;
#5.4 Determine the number of distinct last names of the actors in the database.
SELECT * FROM actor;
SELECT
    COUNT(DISTINCT last_name) AS last_distinct_names
FROM actor;
#6. Retrieve the 10 longest films.
USE sakila;
SELECT * FROM film
ORDER BY length ASC LIMIT 3;
#7.  Use filtering techniques in order to:
#- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * FROM actor WHERE first_name= "SCARLETT";
#- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes. 
SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%'
AND length > 100;
#- 7.3 Determine the number of films that include Behind the Scenes content
SELECT * FROM film
WHERE special_features LIKE "Behind the Scenes";