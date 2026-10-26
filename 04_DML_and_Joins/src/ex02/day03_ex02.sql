SELECT pizza_name, price, pizzeria.name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.id NOT IN(SELECT DISTINCT menu_id FROM person_order)
ORDER BY 1, 2