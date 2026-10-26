SELECT pizzeria.name
FROM person_visits
JOIN person ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
HAVING SUM(CASE WHEN gender = 'male' THEN 1 ELSE 0 END) 
	!= SUM(CASE WHEN gender = 'female' THEN 1 ELSE 0 END)
ORDER BY 1