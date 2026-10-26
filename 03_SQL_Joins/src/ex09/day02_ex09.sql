SELECT person.name FROM person_order o
JOIN person ON o.person_id = person.id
JOIN menu ON o.menu_id = menu.id
WHERE gender = 'female' AND pizza_name = 'pepperoni pizza'
INTERSECT
SELECT person.name FROM person_order o
JOIN person ON o.person_id = person.id
JOIN menu ON o.menu_id = menu.id
WHERE gender = 'female' AND pizza_name = 'cheese pizza'
ORDER BY 1