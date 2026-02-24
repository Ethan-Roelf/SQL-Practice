/*
Customer Directory: The marketing team needs a list of all customer names along with their full street address.

Rental Frequency: Provide a list of all film titles in our database and how many times each has been rented. 
Make sure films that have never been rented are still visible with a count of zero.

Geographic Coverage: Show all cities currently in our database and the names of any customers living in them. If a city has no customers, it should still appear in the list.

Transaction Log: Generate a list of all rental IDs and their dates, along with the first and last name of the staff member who handled the transaction.

Catalog Classification: List every film title in the library along with its associated category name.

Potential Market Expansion: The store manager wants to see every possible combination of our current Stores and all Languages in our system to evaluate future dubbed-film procurement.

Customer Lifetime Value: Calculate the total amount paid by each customer. Show their first name, last name, and the sum of their payments.

Cast List: Produce a list of all actors and the titles of films they have appeared in. Ensure actors who are in the system but haven't been assigned to a film yet are included.

Store 1 Inventory: Display the inventory ID and film title for every item currently physically located at 'Store 1'.

Global Reach: List the names of all customers and the name of the country they reside in.

*/

/*
Intermediate: Gap Analysis & Logic
Inventory Discrepancies: Identify "Dead Stock"—provide a list of film titles that exist in our descriptions but do not have a single corresponding record in our inventory table.

Orphaned Records: Find address records in our system that are not linked to any customer, staff member, or store.

Targeted Film History: Find the names of all customers who have specifically rented the film 'BUCKET BROTHERHOOD'.

System Overview: The manager wants a master list of all unique IDs that exist in either the Customer table or the Staff table to identify everyone registered in our ecosystem.

Inactive Users: Find the names of customers who have never rented a movie from us.

Filtered Expansion: Generate a list of all films paired with all stores, but only for films with a 'G' rating.

Genre Performance: List the names of all actors who have appeared in films categorized as 'Animation'.

Unused Metadata: Identify languages in the language table that are currently not used by any film in our catalog.

Family Ties: Find pairs of actors who share the same last name.

Rental Returns: For every rental recorded, show the film title, the customer's last name, and the return date.
*/

SELECT first_name, last_name, a.address FROM customer AS c
LEFT JOIN address AS a
ON c.address_id=a.address_id;

SELECT f.title, COUNT(r.rental_id) AS total_rentals FROM film AS f
LEFT JOIN inventory AS i ON
f.film_id=i.film_id
LEFT JOIN rental as r ON
i.inventory_id = r.inventory_id
GROUP BY f.title;

SELECT c.city, cust.first_name FROM city AS c
LEFT JOIN address as addr
ON c.city_id = addr.city_id
LEFT JOIN customer AS cust
ON addr.address_id=cust.address_id;

SELECT r.rental_id, r.rental_date, s.first_name, s.last_name FROM rental AS r
LEFT JOIN staff AS s ON r.staff_id=s.staff_id;

SELECT f.title,cat.name FROM film AS f
LEFT JOIN film_category AS fc 
ON f.film_id=fc.film_id
LEFT JOIN category AS cat ON
fc.category_id=cat.category_id;


SELECT s.store_id, l.name FROM store AS s
CROSS JOIN language AS l;

SELECT c.first_name, c.last_name, SUM(p.amount) AS total FROM customer AS c
LEFT JOIN payment AS p ON c.customer_id=p.customer_id
GROUP BY c.first_name,
c.last_name
ORDER BY total ASC;

SELECT act.first_name, f.title FROM actor AS act
LEFT JOIN film_actor AS fa
ON act.actor_id=fa.actor_id
LEFT JOIN film AS f
ON fa.film_id=f.film_id
-- How do i run this query so that names only appear once, and films appear in a list?

SELECT f.title, s.store_id FROM film AS f
JOIN inventory AS inv ON f.film_id=inv.film_id
JOIN store AS s ON inv.store_id=s.store_id
WHERE s.store_id=1;
-- What are other ways to write this query?

SELECT c.first_name, country.country FROM customer AS c 
LEFT JOIN address AS addr ON c.address_id=addr.address_id
LEFT JOIN city ON addr.city_id=city.city_id
LEFT JOIN country ON city.country_id=country.country_id;

SELECT f.title FROM film AS f
JOIN inventory AS i ON
f.film_id=i.film_id
WHERE i.inventory_id IS NULL;

SELECT addr.address_id, addr.address FROM address AS addr 
LEFT JOIN customer AS cust 
ON addr.address_id=cust.customer_id
WHERE cust.address_id IS NULL;

SELECT c.first_name, f.title FROM customer AS c 
JOIN rental AS r 
ON c.customer_id=r.customer_id
JOIN inventory AS inv
ON r.inventory_id=inv.inventory_id
JOIN film AS f 
ON inv.film_id=f.film_id
WHERE UPPER(f.title) LIKE 'BUCKET BROTHERHOOD';

--SKIPPED ONE QUESTION

SELECT c.first_name, c.last_name FROM customer AS c 
LEFT JOIN rental AS r ON c.customer_id=r.customer_id
WHERE r.rental_id IS NULL;

SELECT 
    f.title AS film_title, 
    s.store_id, 
    f.rating
FROM film f
CROSS JOIN store s
WHERE f.rating = 'G';

SELECT DISTINCT
    a.first_name,
    a.last_name,
    c.name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Animation';

SELECT lang.language_id, lang.name FROM language AS lang
LEFT JOIN film AS f
ON lang.language_id=f.language_id
WHERE f.language_id IS NULL;

SELECT DISTINCT 
    actor.actor_id,
    actor.first_name, 
    actor.last_name 
FROM actor AS actor 
JOIN actor AS actor2
ON actor.last_name=actor2.last_name
ORDER BY 
actor.last_name DESC;

SELECT rental.rental_id FROM rental AS rental
LEFT JOIN customer AS cust 
ON rental.customer_id = cust.customer_id
LEFT JOIN inventory AS inv 
ON rental.inventory_id=inv.inventory_id
LEFT JOIN film AS f 
ON inv.film_id=f.film_id;