-- Вывести количество фильмов в каждой категории, отсортировать по убыванию.

SELECT c.name AS category_name, COUNT(f.film_id) AS number_of_films
FROM film_category AS fc
JOIN film AS f ON f.film_id=fc.film_id
JOIN category AS c ON c.category_id=fc.category_id
GROUP BY category_name
ORDER BY number_of_films DESC;

-- Вывести 10 актеров, чьи фильмы большего всего арендовали, отсортировать по убыванию.

SELECT a.first_name, a.last_name, COUNT(r.rental_id) AS number_of_rentals
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id=fa.actor_id
JOIN inventory AS i ON fa.film_id=i.film_id
JOIN rental AS r ON i.inventory_id=r.inventory_id
GROUP BY a.actor_id
ORDER BY number_of_rentals DESC
LIMIT 10;

-- Вывести категорию фильмов, на которую потратили больше всего денег.

SELECT c.name AS category_name, SUM(p.amount) AS spent
postgres-# FROM category AS c
postgres-# JOIN film_category AS fc ON c.category_id=fc.category_id
postgres-# JOIN film AS f ON f.film_id=fc.film_id
postgres-# JOIN inventory AS i ON f.film_id=i.film_id
postgres-# JOIN rental AS r ON i.inventory_id=r.inventory_id
postgres-# JOIN payment AS p ON r.rental_id=p.rental_id
postgres-# GROUP BY c.category_id
postgres-# ORDER BY spent DESC
postgres-# LIMIT 1;

