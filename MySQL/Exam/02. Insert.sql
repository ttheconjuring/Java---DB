INSERT INTO preserves (name, latitude, longitude, area, type, established_on)
SELECT 
    CONCAT(name, ' is in South Hemisphere') AS name,
    latitude,
    longitude,
    area * id AS area,
    LOWER(type) AS type,
    established_on
FROM
    preserves
WHERE
    latitude < 0;