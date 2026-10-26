SELECT pizza_name, pizzeria.name FROM person_order o
JOIN person ON o.person_id = person.id
JOIN menu ON o.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Anna' OR person.name = 'Denis'
ORDER BY 1, 2