{{
    config(materialized = "table")
}}

SELECT 
	split_part(actor, ' ', 1) first_name,
	COUNT(title) no_of_movies,
	SUM(price) sum_prices
FROM {{source("dellstore_dataset", "products")}}
GROUP BY first_name