create TABLE route
(
point1 varchar,
point2 varchar,
cost INT
);

INSERT INTO route (point1, point2, cost)
VALUES 
('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'c', 35),
('c', 'b', 35),
('b', 'd', 25),
('d', 'b', 25),
('c', 'd', 30),
('d', 'c', 30);

WITH RECURSIVE tour AS (
    SELECT point1, point2, cost, ARRAY[point1, point2] AS visited
    FROM route 
    WHERE point1 = 'a'

    UNION ALL 

    SELECT route.point1, route.point2, tour.cost + route.cost, tour.visited || route.point2
    FROM tour 
    JOIN route ON tour.point2 = route.point1
    WHERE NOT route.point2 = ANY(tour.visited)
), all_tour AS (
    SELECT tour.cost + route.cost AS total_cost, '{' || array_to_string(tour.visited || route.point2, ',') || '}' AS tour
    FROM tour
    JOIN route ON tour.point2 = route.point1
    WHERE route.point2 = 'a' AND array_length(visited, 1) = 4
)

SELECT *
FROM all_tour
WHERE total_cost = (SELECT MIN(total_cost) FROM all_tour)
ORDER BY total_cost, tour






