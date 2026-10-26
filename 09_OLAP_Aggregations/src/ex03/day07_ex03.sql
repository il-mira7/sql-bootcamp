WITH total AS 
(SELECT pizzeria.name AS pizzeria_name, count(*), 'visit' AS action_type FROM person_visits v
JOIN pizzeria ON v.pizzeria_id = pizzeria.id
GROUP BY pizzeria_name

UNION

SELECT pizzeria.name AS pizzeria_name, count(*), 'order' AS action_type FROM person_order o
JOIN menu ON o.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria_name

)

SELECT pizzeria_name, sum(count) AS total_count FROM total
GROUP BY pizzeria_name
ORDER BY 2 DESC, 1
