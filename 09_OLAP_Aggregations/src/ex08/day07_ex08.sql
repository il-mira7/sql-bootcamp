SELECT address, pizzeria.name, count(*) FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY address, pizzeria.name
ORDER BY 1, 2