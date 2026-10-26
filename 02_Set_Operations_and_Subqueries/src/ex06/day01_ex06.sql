SELECT order_date AS action_date, person.name AS name
FROM person_order INNER JOIN person ON person_order.person_id = person.id

INTERSECT ALL

SELECT visit_date AS action_date, person.name AS name
FROM person_visits INNER JOIN person ON person_visits.person_id = person.id
ORDER BY action_date, name  DESC