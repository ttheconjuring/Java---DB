SELECT 
    e.employee_id,
    e.first_name,
    e.manager_id,
    em.first_name AS manager_name
FROM
    employees AS e
        JOIN
    employees AS em ON e.manager_id = em.employee_id
WHERE
    e.manager_id = 3 OR e.manager_id = 7
ORDER BY first_name;