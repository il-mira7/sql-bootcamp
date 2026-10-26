SELECT name, count(*) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person_id, name
HAVING count(*) > 3
ORDER BY 1, 2
