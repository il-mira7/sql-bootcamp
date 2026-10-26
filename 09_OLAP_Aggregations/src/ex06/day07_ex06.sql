SELECT pizzeria.name, 
        count(*) count_of_orders, 
        ROUND(avg(price), 2) average_price, 
        max(price) max_price,
        min(price) min_price
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON menu.id = person_order.menu_id
GROUP BY pizzeria.id, pizzeria.name
ORDER BY 1