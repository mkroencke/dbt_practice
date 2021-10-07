

  create  table "dellstore"."public"."task2__dbt_tmp"
  as (
    

SELECT
	orderdate AS orderdate,
	SUM(netamount) AS netamount
FROM (
	SELECT * 
	FROM 
    	"dellstore"."public"."orders" AS ord
	JOIN
		"dellstore"."public"."customers" AS cust
	ON ord.customerid = cust.customerid
) AS orderCustomerData
WHERE luhn_verify(creditcard::int8) = FALSE
GROUP BY orderdate
  );