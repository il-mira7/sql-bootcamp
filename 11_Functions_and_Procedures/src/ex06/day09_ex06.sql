CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice numeric DEFAULT 500,
    IN pdate date DEFAULT '2022-01-08'
)
    RETURNS TABLE (pizzeria_name varchar) AS
    $$
    BEGIN
        RETURN QUERY
        SELECT pizzeria.name
        FROM person_visits v
        JOIN person p ON v.person_id = p.id
        JOIN menu m ON v.pizzeria_id = m.pizzeria_id
        JOIN pizzeria ON m.pizzeria_id = pizzeria.id
        WHERE p.name = pperson AND v.visit_date = pdate AND price < pprice;
    END;
    $$
    LANGUAGE plpgsql;



select *  
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *  
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');