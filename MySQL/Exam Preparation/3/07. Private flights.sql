SELECT 
    UPPER(CONCAT(SUBSTRING(last_name, 1, 2), country_id)) AS flight_code,
    CONCAT(first_name, ' ', last_name) AS full_name,
    country_id
FROM
    passengers p
        LEFT JOIN
    flights_passengers fp ON p.id = fp.passenger_id
WHERE
    fp.flight_id IS NULL
ORDER BY country_id;