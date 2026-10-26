SELECT address, 
        ROUND((max(age) - (min(age)/max(age)::numeric)), 2) formula,
        ROUND(avg(age), 2) average,
        ROUND((max(age) - (min(age)/max(age)::numeric)), 2) > ROUND(avg(age), 2) 
FROM person
GROUP BY address
ORDER BY 1