CREATE VIEW v_price_with_discount AS
SELECT p.name person_name, 
        pizza_name, 
        price real_price, 
        (price - price * 0.1)::integer discount_price
FROM person_order o
JOIN
person p ON o.person_id = p.id
JOIN
menu m ON o.menu_id = m.id
ORDER BY 1, 2