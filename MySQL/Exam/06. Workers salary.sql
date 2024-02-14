SELECT 
    w.id,
    first_name,
    last_name,
    p.name AS preserve_name,
    country_code
FROM
    workers w
        JOIN
    preserves p ON w.preserve_id = p.id
        JOIN
    countries_preserves cp ON p.id = cp.preserve_id
        JOIN
    countries c ON cp.country_id = c.id
WHERE
    salary > 5000 AND age < 50
ORDER BY country_code;