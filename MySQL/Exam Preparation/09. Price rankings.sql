SELECT 
    u.name AS unversity_name,
    c.name AS city_name,
    address,
    CASE
        WHEN tuition_fee < 800 THEN 'cheap'
        WHEN tuition_fee < 1200 THEN 'normal'
        WHEN tuition_fee < 2500 THEN 'high'
        ELSE 'expensive'
    END AS price_rank,
    tuition_fee
FROM
    universities u
        JOIN
    cities c ON u.city_id = c.id
ORDER BY tuition_fee;