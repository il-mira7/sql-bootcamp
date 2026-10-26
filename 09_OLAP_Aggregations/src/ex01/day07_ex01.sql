SELECT name, count(*) count_of_visits 
FROM person_visits v
JOIN person p ON v.person_id = p.id
GROUP BY name
ORDER BY 2 DESC, 1
LIMIT 4