SELECT 
    mountain_range, peak_name, elevation AS 'peak_elevation'
FROM
    mountains
        JOIN
    peaks ON mountains.id = peaks.mountain_id
WHERE
    mountains.id = 17
ORDER BY `peak_elevation` DESC;