--Question 1:
SELECT first_name, last_name, customer_id, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas'

--Answer: There are 5 customers who live in the Texas district: 
	--Jennifer Davis(customer_id 6), Kim Cruz(118), Richard Mccrary(305), 
	--Bryan Hardison(400), Ian Still(561)

--Question 2:
SELECT c.first_name, c.last_name, p.amount
FROM payment AS p
JOIN customer AS c
ON p.customer_id = c.customer_id
WHERE p.amount > 6.99

--Answer: There are 1406 payments over 6.99

--Question 3:
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	);
	
--Answer: There are 6 customers who made payments over $175.

--Question 4:
SELECT c.first_name, c.last_name, c.address_id, country.country
FROM customer AS c
JOIN address AS a
ON c.address_id = a.address_id
JOIN city
ON city.city_id = a.city_id
JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal'

--Answer: Kevin Schuler lives in Nepal. 

--Question 5:
SELECT r.staff_id, COUNT(*), s.first_name, s.last_name
FROM rental AS r
JOIN staff AS s
ON r.staff_id = s.staff_id
GROUP BY r.staff_id, s.first_name, s.last_name

--Answer: Mike Hillyer had 8040 rentals.

--Question 6:
SELECT f_a.film_id, COUNT(*), f.title
FROM film_actor AS f_a
JOIN film as f
ON f_a.film_id = f.film_id
GROUP BY f_a.film_id, f.title
ORDER BY COUNT(*) DESC

--Answer: Lambs Cincinatti had the most actors with 15. 

--Question 7:
SELECT a.actor_id, COUNT(*), a.first_name, a.last_name
FROM film_actor AS f_a
JOIN actor as a
ON f_a.actor_id = a.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY COUNT(*) ASC

--Answer: Emily Dee has been in the least movies with 14. 

--Question 8:
SELECT district, COUNT(*) FROM address GROUP BY district HAVING COUNT(*) > 5 ORDER BY COUNT(*) DESC 

--Answer:  There are 9 districts with over 5 customers.

