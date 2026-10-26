INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date) 
SELECT
    (SELECT max(id)+1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'), 
    (SELECT p.id FROM pizzeria p
        INNER JOIN 
        menu m ON p.id = m.pizzeria_id 
        WHERE m.pizza_name != 'Papa Johns' AND price < 800 LIMIT 1),
    '2022-01-08';

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
