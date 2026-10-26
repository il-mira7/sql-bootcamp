WITH person12_visits (visit_date) AS (
	SELECT visit_date FROM person_visits 
	WHERE person_id = 2 OR person_id = 1),
dates AS (
	SELECT dates::date 
	FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates)

SELECT dates
FROM person12_visits
RIGHT JOIN 
dates ON person12_visits.visit_date = dates
WHERE visit_date IS NULL
ORDER BY dates
