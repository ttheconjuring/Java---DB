CREATE PROCEDURE usp_get_towns_starting_with(prefix VARCHAR(50))
BEGIN
	SELECT 
		name AS town_name
	FROM
		towns
	WHERE
		name LIKE CONCAT(prefix, '%')
	ORDER BY town_name;
END
