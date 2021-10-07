{{
    config(materialized = "table")
}}

SELECT
	orderdate AS orderdate,
	SUM(netamount) AS netamount
FROM (
	SELECT * 
	FROM 
    	{{source("dellstore_dataset", "orders")}} AS ord
	JOIN
		{{source("dellstore_dataset", "customers")}} AS cust
	ON ord.customerid = cust.customerid
) AS orderCustomerData
WHERE luhn_verify(creditcard::int8) = FALSE
GROUP BY orderdate