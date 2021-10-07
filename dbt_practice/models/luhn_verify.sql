/* Taken from https://wiki.postgresql.org/wiki/Luhn_algorithm */

CREATE OR REPLACE FUNCTION luhn_verify(int8) RETURNS boolean AS $$
SELECT
         MOD(SUM(doubled_digit / INT8 '10' + doubled_digit % INT8 '10'), 10) = 0
FROM
(SELECT
         MOD( ( $1::int8 / (10^n)::int8 ), 10::int8)
         * (MOD(n,2) + 1)
         AS doubled_digit
         FROM generate_series(0, floor(log( $1 ))::integer) AS n
) AS doubled_digits $$ LANGUAGE SQL