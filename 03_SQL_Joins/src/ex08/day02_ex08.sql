SELECT person.name FROM person_order o
JOIN person ON o.person_id = person.id
JOIN menu ON o.menu_id = menu.id
WHERE gender = 'male' AND (address = 'Moscow' OR address = 'Samara') AND pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1 DESC