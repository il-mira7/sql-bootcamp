CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (n_1 integer) AS
$$
    WITH RECURSIVE r(n_1, n_2) AS (
        SELECT 0, 1 AS r
        UNION ALL
        SELECT n_2, n_1+n_2 FROM r
        WHERE n_2 < pstop
    )
    SELECT n_1 FROM r;
$$
LANGUAGE SQL;


select * from fnc_fibonacci(100);

select * from fnc_fibonacci();

