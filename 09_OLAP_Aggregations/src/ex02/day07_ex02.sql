(SELECT pizzeria.name AS pizzeria_name, count(*), 'visit' AS action_type FROM person_visits v
JOIN pizzeria ON v.pizzeria_id = pizzeria.id
GROUP BY pizzeria_name
ORDER BY 2 DESC
LIMIT 3)

UNION

(SELECT pizzeria.name AS pizzeria_name, count(*), 'order' AS action_type FROM person_order o
JOIN menu ON o.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria_name
ORDER BY 2 DESC
LIMIT 3
)
ORDER BY 3, 2 DESC




