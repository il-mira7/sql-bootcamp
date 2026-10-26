SELECT 
	CASE 
	WHEN person.name IS NULL THEN '-'
	ELSE person.name
	END, 
	visits.visit_date,
	CASE 
	WHEN pizzeria.name IS NULL THEN '-'
	ELSE pizzeria.name
	END
FROM (SELECT * FROM person_visits 
	WHERE visit_date >= '2022-01-01' AND visit_date <= '2022-01-03') AS visits
FULL OUTER JOIN person ON visits.person_id = person.id
FULL OUTER JOIN pizzeria ON visits.pizzeria_id = pizzeria.id
ORDER BY 1, 2, 3