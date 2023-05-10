SELECT c.name AS category_name, COUNT(f.film_id) AS number_of_films
FROM film_category AS fc
JOIN film AS f ON f.film_id=fc.film_id
JOIN category AS c ON c.category_id=fc.category_id
GROUP BY category_name
ORDER BY number_of_films DESC;
