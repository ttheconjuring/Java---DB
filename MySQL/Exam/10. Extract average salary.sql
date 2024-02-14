CREATE FUNCTION  udf_average_salary_by_position_name (name VARCHAR(40)) RETURNS DECIMAL(7,2)
DETERMINISTIC
BEGIN
	DECLARE position_average_salary DECIMAL (7,2);
    SET position_average_salary := (
		SELECT 
			AVG(salary)
		FROM
			workers w
				JOIN
			positions p ON w.position_id = p.id
		WHERE
			p.name = name);
	RETURN position_average_salary;
END


