SHOW TRANSACTION ISOLATION LEVEL;

-- Начало транзакции Session #1
BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-------------------------------------------------

-- Начало транзакции Session #2

BEGIN;

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';