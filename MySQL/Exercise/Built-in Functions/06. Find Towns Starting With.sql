SELECT 
    *
FROM
    towns
WHERE
    SUBSTRING(name, 1, 1) REGEXP '[MmKkBbEe]'
ORDER BY name;