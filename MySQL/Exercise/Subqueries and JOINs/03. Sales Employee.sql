SELECT 
    employee_id, first_name, last_name, name AS department_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    name = 'Sales'
ORDER BY employee_id DESC;