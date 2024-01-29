SELECT 
    e.employee_id, first_name, name AS project_name
FROM
    employees AS e
        JOIN
    employees_projects AS ep ON e.employee_id = ep.employee_id
        JOIN
    projects AS p ON ep.project_id = p.project_id
WHERE
    DATE(start_date) > '2002-08-13'
        AND end_date IS NULL
ORDER BY first_name , project_name
LIMIT 5;

