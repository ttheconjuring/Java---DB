SELECT 
    flight_code,
    departure,
    CASE
        WHEN TIME(departure) BETWEEN '05:00:00' AND '11:59:00' THEN 'Morning'
        WHEN TIME(departure) BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon'
        WHEN TIME(departure) BETWEEN '17:00:00' AND '20:59:00' THEN 'Evening'
        ELSE 'Night'
    END AS day_part
FROM
    flights
ORDER BY flight_code DESC;