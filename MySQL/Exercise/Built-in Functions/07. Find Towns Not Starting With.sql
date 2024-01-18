SELECT 
    *
FROM
    towns
WHERE
    SUBSTRING(name, 1, 1) NOT REGEXP '[RrBbDd]'
ORDER BY name;