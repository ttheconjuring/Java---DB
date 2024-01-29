SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    CONCAT(em.first_name, ' ', em.last_name) AS manager_name,
    name AS department_name
FROM
    employees AS e
        JOIN
    employees AS em ON e.manager_id = em.employee_id
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.manager_id IS NOT NULL
ORDER BY e.employee_id
LIMIT 5;