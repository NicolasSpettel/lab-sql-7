-- Lab | SQL Queries 7

USE sakila;

-- 1. In the table actor, which are the actors whose last names are not repeated?
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd.
-- These three actors have the same last name. So we do not want to include this last name in our output.
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

SELECT last_name AS 'unique last names' FROM actor GROUP BY last_name HAVING COUNT(last_name) = 1;

-- 2. Which last names appear more than once?
-- We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT last_name 'duplicate last names' FROM actor GROUP BY last_name HAVING COUNT(last_name) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(staff_id) AS 'number of rentals' FROM rental GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(film_id) AS 'releases this year' FROM film GROUP BY release_year;
-- select distinct release_year from film;

-- 5. Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(film_id) AS 'films with this rating' FROM film GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, ROUND(SUM(length)/COUNT(length),2) AS 'mean length of movies' FROM film GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT 
    rating AS 'ratings with mean length of movies longer than 2 hours'
FROM
    film
GROUP BY rating
HAVING ROUND(SUM(length) / COUNT(length), 2) > 120;

