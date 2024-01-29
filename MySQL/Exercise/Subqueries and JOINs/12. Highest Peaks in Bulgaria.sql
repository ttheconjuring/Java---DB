SELECT 
    country_code, mountain_range, peak_name, elevation
FROM
    mountains AS m
        JOIN
    mountains_countries AS mc ON m.id = mc.mountain_id
        JOIN
    peaks AS p ON m.id = p.mountain_id
WHERE
    country_code = 'BG' AND elevation > 2835
ORDER BY elevation DESC;