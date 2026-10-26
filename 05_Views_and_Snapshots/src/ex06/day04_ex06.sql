CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 

SELECT pizzeria.name FROM person_visits v
JOIN person ON v.person_id = person.id
JOIN pizzeria ON v.pizzeria_id = pizzeria.id
JOIN menu ON v.pizzeria_id = menu.pizzeria_id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price < 800