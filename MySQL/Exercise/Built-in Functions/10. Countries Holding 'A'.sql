SELECT 
    country_name, iso_code
FROM
    countries
WHERE
    LOWER(country_name) REGEXP '(.*a){3,}'
ORDER BY iso_code;