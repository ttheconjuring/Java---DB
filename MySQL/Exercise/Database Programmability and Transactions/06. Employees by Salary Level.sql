CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(10,4)) RETURNS VARCHAR(10) 
    DETERMINISTIC
BEGIN
    IF salary < 30000 THEN RETURN 'Low';
    ELSEIF salary <= 50000 THEN RETURN 'Average';
    ELSE RETURN 'High';
    END IF;
END;

CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10))
BEGIN
	SELECT 
		first_name, last_name
	FROM
		employees
	WHERE
		(SELECT ufn_get_salary_level(salary)) = salary_level
	ORDER BY first_name DESC , last_name DESC;
END;