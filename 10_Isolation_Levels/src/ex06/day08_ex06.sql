-- Начало транзакции Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT sum(rating) FROM pizzeria;

SELECT sum(rating) FROM pizzeria;
COMMIT;
SELECT sum(rating) FROM pizzeria;

-------------------------------------------------

-- Начало транзакции Session #2

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

INSERT INTO pizzeria (id, name, rating)
VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;

SELECT sum(rating) FROM pizzeria;