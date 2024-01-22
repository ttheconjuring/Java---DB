CREATE TABLE high_salaries SELECT * FROM
    employees
WHERE
    salary > 30000;

DELETE FROM high_salaries 
WHERE
    manager_id = 42;

UPDATE high_salaries 
SET 
    salary = salary + 5000
WHERE
    department_id = 1;

SELECT 
    department_id, AVG(salary)
FROM
    high_salaries
GROUP BY department_id
ORDER BY department_id;