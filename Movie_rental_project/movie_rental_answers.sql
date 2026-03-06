-- 1
SELECT 
rental_id,
customer_id,
COUNT(rental_id) OVER(PARTITION BY customer_id) AS tot_rentals
FROM rental;

SELECT 
f.film_id,
fc.category_id,
f.title,
f.rental_rate,
DENSE_RANK() OVER(PARTITION BY fc.category_id ORDER BY f.rental_rate DESC) AS rnk
FROM film AS f
JOIN film_category AS fc USING (film_id);

SELECT 
payment_id,
amount,
AVG(amount) OVER() AS avg_payment
FROM payment;

SELECT 
film_id,
title
FROM film 
WHERE length> (SELECT AVG(length) FROM film);

SELECT
email 
FROM staff 
UNION ALL 
SELECT 
email  
FROM customer;

-- Should actually use RANK() here, as it handles ties.
SELECT 
customer_id,
SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY amount DESC 
LIMIT 10;

SELECT 
f.film_id,
f.title
FROM film f
WHERE EXISTS 
(SELECT 1 FROM rental 
JOIN inventory inv USING (inventory_id)
WHERE inv.film_id=f.film_id);

--8
SELECT 
customer_id,
rental_id,
rental_date,
MIN(rental_date) OVER(PARTITION BY customer_id ORDER BY rental_date ASC) AS first_rental
FROM rental;

--9

SELECT 
    city.city_id,
    city.city 
FROM city AS city
WHERE EXISTS (
    SELECT 1
    FROM address AS a
    JOIN customer AS c ON a.address_id = c.address_id
    WHERE a.city_id = city.city_id 
      AND c.active = 1
);

-- 10
SELECT 
film_id,
rental_rate,
NTILE(5) OVER(ORDER BY rental_rate) AS group_number
FROM film;

-- 11
SELECT
customer_id,
amount,
SUM(amount) OVER(PARTITION BY customer_id ORDER by payment_date) AS running_total
FROM payment;

-- 12
SELECT
customer_id
FROM customer AS c
WHERE EXISTS(

    SELECT customer_id
    FROM rental AS r
    JOIN inventory AS inv USING(inventory_id)
    JOIN film AS f USING (film_id)
    WHERE UPPER(f.title)='ACADEMY DINOSAUR'
    AND r.customer_id = c.customer_id -- without this, the engine just checks if anyone rented the film, and the returns true(correlated sub query)
);

-- 13 NB - why cant you use the where clause directly afte the group by?

SELECT *
FROM (
    SELECT 
        staff_id,
        COUNT(rental_id) AS staff_total,
        AVG(COUNT(rental_id)) OVER() AS team_avg
    FROM rental
    GROUP BY staff_id
) AS performance_report
WHERE staff_total > team_avg;

-- 14

SELECT 
store_id,
SUM(amount) AS revenue
FROM payment 
JOIN staff USING (staff_id)
GROUP BY store_id;

-- 15
SELECT
c.name
FROM category AS c 
WHERE EXISTS
(
    SELECT 
    category_id FROM 
    film_category AS fc 
    WHERE c.category_id=fc.category_id
);

-- 16
SELECT
customer_id,
rental_id,
LEAD(rental_id) OVER(PARTITION BY customer_id ORDER BY rental_date ASC) AS next_rental
FROM rental;

-- 17
