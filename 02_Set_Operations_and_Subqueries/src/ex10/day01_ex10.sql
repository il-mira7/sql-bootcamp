SELECT person.name AS person_name,
        menu.pizza_name,
        pizzeria.name AS pizzeria_name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN person_visits ON person_order.order_date = person_visits.visit_date 
                        AND person_order.person_id = person_visits.person_id
INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name, pizzeria_name;
                    