-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION func_interval_priority(p_interval interval) RETURNS integer AS 
$$
BEGIN
    IF p_interval >= INTERVAL '0 seconds' THEN
        RETURN 0; 
    ELSE
        RETURN 1;
    END IF;
END;
$$ 
LANGUAGE plpgsql;

WITH balance_currency AS (
    SELECT user_id, money, type, currency_id, b.updated as b_updated, 
            name, rate_to_usd, c.updated as c_updated, c.updated - b.updated as delta
    FROM balance b
    JOIN currency c ON b.currency_id = c.id
),
 r AS (
    SELECT balance_currency.*, 
       ROW_NUMBER() OVER (
    PARTITION BY b_updated, user_id, currency_id 
    ORDER BY 
        func_interval_priority(b_updated - c_updated) ASC,
        ABS(EXTRACT(EPOCH FROM (b_updated - c_updated))) ASC) AS rn
    FROM balance_currency
),
tab AS (
SELECT * FROM r
WHERE rn =1
)


SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    COALESCE(b.name, 'not defined') AS currency_name,
    money * rate_to_usd
FROM "user" as u
FULL JOIN tab b ON u.id = b.user_id
WHERE b.name IS NOT NULL
ORDER BY u.name = 'not defined', 1 DESC, lastname = 'not defined' DESC, 2, 3;

