(SELECT pizzeria.name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.id
HAVING SUM(CASE WHEN gender = 'female' THEN 1 ELSE 0 END) = 0)
UNION
(SELECT pizzeria.name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.id
HAVING SUM(CASE WHEN gender = 'male' THEN 1 ELSE 0 END) = 0)
ORDER BY 1