SELECT pizza_name, p.name, price FROM (
	SELECT * 
	FROM menu 
	WHERE pizza_name = 'pepperoni pizza' OR pizza_name ='mushroom pizza'
	) AS m
JOIN
pizzeria p ON m.pizzeria_id = p.id
ORDER BY 1, 2