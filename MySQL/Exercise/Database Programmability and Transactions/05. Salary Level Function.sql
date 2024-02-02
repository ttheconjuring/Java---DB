CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(10,4)) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF salary < 30000 THEN RETURN 'Low';
    ELSEIF salary <= 50000 THEN RETURN 'Average';
    ELSE RETURN 'High';
    END IF;
END








