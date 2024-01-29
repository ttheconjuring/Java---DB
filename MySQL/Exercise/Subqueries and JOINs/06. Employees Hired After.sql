SELECT 
    first_name, last_name, hire_date, name AS dept_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    hire_date > '1999-01-01'
        AND (name = 'Sales' OR name = 'Finance')
ORDER BY hire_date;