CREATE FUNCTION udf_count_flights_from_country(country VARCHAR(50)) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE flights_count INT;
	SET flights_count := (SELECT 
		COUNT(f.id)
	FROM
		flights f
			JOIN
		countries c ON f.departure_country = c.id
	GROUP BY c.name
	HAVING name = country);
    RETURN flights_count;
END
