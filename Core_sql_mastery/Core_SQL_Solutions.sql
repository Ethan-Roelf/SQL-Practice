-- Question 1
SELECT DISTINCT(title) FROM film;

-- Question 2
SELECT first_name, last_name, email FROM customer WHERE active = 0;

-- Question 3
SELECT title FROM film WHERE rental_rate = 0.99;

-- Question 4
SELECT title FROM film WHERE release_year = 2006;

-- Question 5
SELECT address, district FROM address WHERE TRIM(district) = 'California';

-- Question 6
SELECT payment_id, amount FROM payment WHERE amount > 10.00 ORDER BY payment_date DESC;

-- Question 7
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM actor;

-- Question 8
SELECT COUNT(film_id) FROM film;

-- Question 9
SELECT title FROM film;

-- Question 10
SELECT title, length FROM film ORDER BY length DESC LIMIT 10;

-- Question 11
SELECT title, length FROM (SELECT title, length, DENSE_RANK() OVER (ORDER BY length DESC) as rnk FROM film) t WHERE rnk <= 10;

-- Question 12
SELECT title, description FROM film WHERE rental_duration BETWEEN 3 AND 5;

-- Question 13
SELECT s.store_id, c.city FROM store s JOIN address a ON s.address_id = a.address_id JOIN city c ON a.city_id = c.city_id;

-- Question 14
SELECT c.first_name, c.last_name, a.address FROM customer c JOIN address a USING (address_id);

-- Question 15
SELECT address FROM address WHERE address2 IS NULL;

-- Question 16
SELECT UPPER(title) FROM film;

-- Question 17
SELECT title FROM film WHERE UPPER(description) LIKE '%DOCUMENTARY%';

-- Question 18
SELECT rental_id, MONTHNAME(rental_date) FROM rental ORDER BY rental_date DESC;

-- Question 19
SELECT ROUND(AVG(rental_rate), 2) FROM film;

-- Question 20
SELECT title, length, CASE WHEN length < 60 THEN 'short' WHEN length > 60 THEN 'long' END AS duration FROM film;

-- Question 21
SELECT DISTINCT rating FROM film;

-- Question 22
SELECT c.name, SUM(p.amount) FROM category c JOIN film_category fc ON c.category_id = fc.category_id JOIN inventory i ON fc.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id JOIN payment p ON r.rental_id = p.rental_id GROUP BY c.name;

-- Question 23
SELECT customer_id, CONCAT(first_name, ' ', last_name) AS full_name, SUM(amount) as total FROM customer JOIN payment USING (customer_id) GROUP BY customer_id ORDER BY total DESC LIMIT 5;

-- Question 24
SELECT f.title FROM film f LEFT JOIN inventory i ON f.film_id = i.film_id WHERE i.film_id IS NULL;

-- Question 25
SELECT staff_id, COUNT(rental_id) FROM staff LEFT JOIN rental USING (staff_id) GROUP BY staff_id;

-- Question 26
SELECT c.name, COUNT(fc.film_id) FROM category c JOIN film_category fc ON c.category_id = fc.category_id GROUP BY c.name HAVING COUNT(fc.film_id) > 60;

-- Question 27
SELECT f.title FROM film f LEFT JOIN inventory i ON f.film_id = i.film_id LEFT JOIN rental r ON i.inventory_id = r.inventory_id WHERE r.inventory_id IS NULL ORDER BY f.title DESC;

-- Question 28
SELECT customer_id, AVG(amount) as avg_pay FROM customer LEFT JOIN payment USING (customer_id) GROUP BY customer_id ORDER BY avg_pay ASC;

-- Question 29
SELECT DATE_FORMAT(payment_date, '%y-%m-%d') FROM payment;

-- Question 30
SELECT first_name FROM actor UNION SELECT first_name FROM customer;

-- Question 31
SELECT first_name FROM actor WHERE first_name NOT IN (SELECT first_name FROM customer);

-- Question 32
SELECT a.first_name, a.last_name, COUNT(fa.film_id) FROM actor a JOIN film_actor fa ON a.actor_id = fa.actor_id GROUP BY a.actor_id;

-- Question 33
SELECT AVG(DATEDIFF(return_date, rental_date)) FROM rental;

-- Question 34
SELECT title FROM film WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

-- Question 35
SELECT city FROM city ci JOIN country co ON ci.country_id = co.country_id WHERE co.country IN ('United Kingdom', 'United States');

-- Question 36
SELECT COALESCE(address2, 'No Secondary Address') FROM address;

-- Question 37
SELECT f.title, i.store_id, COUNT(*) FROM film f JOIN inventory i ON f.film_id = i.film_id WHERE f.title = 'Academy Dinosaur' GROUP BY i.store_id;

-- Question 38
SELECT YEAR(payment_date), MONTH(payment_date), SUM(amount) FROM payment GROUP BY YEAR(payment_date), MONTH(payment_date);

