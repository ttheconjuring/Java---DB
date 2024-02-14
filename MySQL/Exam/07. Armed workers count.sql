SELECT 
    name, COUNT(*) AS armed_workers
FROM
    workers w
        JOIN
    preserves p ON w.preserve_id = p.id
WHERE
    is_armed = 1
GROUP BY name
ORDER BY armed_workers DESC , name;