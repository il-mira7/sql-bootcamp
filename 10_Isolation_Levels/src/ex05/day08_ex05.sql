SHOW TRANSACTION ISOLATION LEVEL;

-- Начало транзакции Session #1
BEGIN;

SELECT sum(rating) FROM pizzeria;

SELECT sum(rating) FROM pizzeria;
COMMIT;
SELECT sum(rating) FROM pizzeria;

-------------------------------------------------

-- Начало транзакции Session #2

BEGIN;

INSERT INTO pizzeria (id, name, rating)
VALUES (10, 'Kazan Pizza', 5);
COMMIT;

SELECT sum(rating) FROM pizzeria;
