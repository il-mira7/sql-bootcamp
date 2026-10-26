SET enable_seqscan = off;
--отключаем псоледовательное сканирование

EXPLAIN ANALYZE

SELECT pizza_name, name AS pizzeria_name FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2 DESC;

SET enable_seqscan = on;

