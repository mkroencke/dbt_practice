

SELECT 
	split_part(actor, ' ', 1) first_name,
	COUNT(title) no_of_movies,
	SUM(price) sum_prices
FROM "dellstore"."public"."products"
GROUP BY first_name