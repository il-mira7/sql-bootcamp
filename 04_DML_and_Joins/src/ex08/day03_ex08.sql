insert into menu (id, pizzeria_id, pizza_name, price)
VALUES((SELECT max(id)+1 FROM menu), (SELECT id FROM pizzeria WHERE name = 'Dominos'),'Sicilian pizza', 900)
--SELECT * FROM menu
