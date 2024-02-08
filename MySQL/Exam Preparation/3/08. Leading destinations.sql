SELECT 
    name, currency, COUNT(*) AS booked_tickets
FROM
    countries c
        JOIN
    flights f ON c.id = f.destination_country
        JOIN
    flights_passengers fp ON f.id = fp.flight_id
GROUP BY name
HAVING booked_tickets >= 20
ORDER BY booked_tickets DESC;