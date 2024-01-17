SELECT 
    title
FROM
    books
WHERE
    SUBSTRING(title, 1, 4) = 'The '
ORDER BY id;