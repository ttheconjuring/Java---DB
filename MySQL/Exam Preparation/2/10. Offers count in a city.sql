CREATE FUNCTION udf_offers_from_city_name (cityName VARCHAR(50)) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count INT;
    SET count := (SELECT 
		COUNT(property_id) AS offers_count
	FROM
		cities c
			JOIN
		properties p ON c.id = p.city_id
			JOIN
		property_offers po ON p.id = po.property_id
	WHERE
		c.name = cityName);
	RETURN count;
END

