WITH rate_currency AS (
    SELECT *, MAX(updated) OVER (PARTITION BY id) as m
    FROM currency
),
last_rate_currency AS (
    SELECT * FROM rate_currency
    WHERE updated = m
)

SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    type,
    sum(b.money) AS volume,
    COALESCE(c.name, 'not defined') AS currency_name,
    COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
    sum(b.money) * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
FROM "user" as u
FULL JOIN balance b ON u.id = b.user_id
FULL JOIN last_rate_currency c ON b.currency_id = c.id
GROUP BY user_id, type, u.name, lastname, currency_id, c.name, rate_to_usd
ORDER BY u.name = 'not defined',  1 DESC, lastname = 'not defined' DESC, 2, 3

