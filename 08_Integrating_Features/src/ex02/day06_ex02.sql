SELECT person.name,
        pizza_name, 
        price, 
        CASE
            WHEN (price * discount/100) - ((price * discount/100)::integer) = 0 
                THEN TRUNC(price - (price * discount/100), 0)
            ELSE TRUNC(price - (price * discount/100), 2)
        END discount_price,
        pizzeria.name
FROM person_discounts d
JOIN person ON d.person_id = person.id
JOIN pizzeria ON d.pizzeria_id = pizzeria.id
JOIN menu ON menu.pizzeria_id = d.pizzeria_id
JOIN person_order ON menu.id = menu_id AND person.id = person_order.person_id
ORDER BY 1, 2;
