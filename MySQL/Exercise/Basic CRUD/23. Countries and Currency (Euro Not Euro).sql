SELECT 
    country_name,
    country_code,
    CASE
        WHEN currency_code = 'EUR' THEN 'Euro'
        ELSE 'Not Euro'
    END AS currency_info
FROM
    countries
ORDER BY country_name ASC;
