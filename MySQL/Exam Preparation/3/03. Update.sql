UPDATE flights f
        JOIN
    countries c ON f.departure_country = c.id 
SET 
    f.airplane_id = f.airplane_id + 1
WHERE
    c.name = 'Armenia';
